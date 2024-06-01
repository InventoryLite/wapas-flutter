import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wapas/models/balance_model.dart';
import 'package:wapas/wapas.dart';
import 'package:wapas_example/globals.dart';
import 'package:wapas_example/screens/reports/chart.dart';

class BalanceChart extends StatefulWidget {
  final String userId;
  final String currency;
  final List<String>? transactionTypes;
  final String amountType;

  BalanceChart({
    super.key,
    required this.userId,
    required this.currency,
    this.transactionTypes,
    required this.amountType,
  });

  @override
  State<BalanceChart> createState() => BalanceChartState();
}

class BalanceChartState extends State<BalanceChart> {
  final _wapasPlugin = Wapas();
  List<BalanceModel> balances = [];
  List<ChartData> chartData = [];
  bool loading = false;

  void refresh() {
    fetch();
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    setState(() {
      loading = true;
    });
    chartData.clear();
    if (widget.userId.isNotEmpty && widget.currency.isNotEmpty) {
      balances = await _wapasPlugin.getBalance(
        widget.userId,
        widget.currency,
      );

      for (int idx = 0; idx < balances.length; idx++) {
        BalanceModel balnce = balances[idx];
        if (widget.transactionTypes != null) {
          if (widget.transactionTypes!.length > 0 &&
              !widget.transactionTypes!.contains(balnce.transactionType)) {
            continue;
          }
        }

        if (widget.amountType == "amount") {
          chartData.add(ChartData(balnce!.transactionType.toString(),
              double.parse(balnce!.amount ?? "0")));
        }
        if (widget.amountType == "virtual") {
          chartData.add(ChartData(balnce!.transactionType.toString(),
              double.parse(balnce!.virtualValue ?? "0")));
        }
      }

      setState(() {});
    } else {
      // TODO : error handling
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(globals.blankFieldError)));
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !loading
        ? SfCircularChart(
            selectionGesture: ActivationMode.singleTap,
            series: <CircularSeries>[
              // Render pie chart
              PieSeries<ChartData, String>(
                dataSource: chartData,
                // pointColorMapper:(ChartData data,  _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                enableTooltip: true,
                dataLabelMapper: (data, _) => "${data.x} ${data.y} %",
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                  labelIntersectAction: LabelIntersectAction.shift,
                  useSeriesColor: true,
                  connectorLineSettings: ConnectorLineSettings(
                    length: '10%',
                    type: ConnectorType.line,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )
        : CircularProgressIndicator();
  }
}
