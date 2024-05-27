import 'package:flutter/material.dart';
import 'package:wapas/models/partner_hierarchy_model.dart';

import 'package:wapas/wapas.dart';

class PartnerLevelsScreen extends StatefulWidget {
  final Wapas wapasPlugin;

  PartnerLevelsScreen({super.key, required this.wapasPlugin});

  @override
  State<PartnerLevelsScreen> createState() => _PartnerLevelsScreenState();
}

class _PartnerLevelsScreenState extends State<PartnerLevelsScreen> {
  int forLevel = 1;
  bool includeBalances = true;
  String userId = "662f7997704a55d1820cd8ee";

  List<PartnerHierarchyModel?>? partners;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    List<PartnerHierarchyModel> list =
        await widget.wapasPlugin.getPartnerHierarchy(
      userId,
      null,
      null,
      forLevel,
      null,
      null,
      null,
      null,
      null,
      includeBalances,
    );
    setState(() {
      partners = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partner Levels'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Partner Id : $userId',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                Text(
                  'Level ',
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                DropdownButton(
                  // Initial Value
                  value: forLevel,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: [
                    1,
                    2,
                    3,
                    4,
                    5,
                    6,
                    7,
                    8,
                    9,
                    10,
                    11,
                    12,
                    13,
                    14,
                    15,
                    16,
                    17,
                    18,
                    19,
                    20
                  ].map((int items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items.toString()),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (int? newValue) {
                    setState(() {
                      forLevel = newValue!;
                    });
                    fetch();
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            partners != null
                ? partners!.isNotEmpty
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(
                              label: Text('CreatedAt'),
                            ),
                            DataColumn(
                              label: Text('Parent ID'),
                            ),
                            DataColumn(
                              label: Text('Partner ID'),
                            ),
                            DataColumn(
                              label: Text('Partner Name'),
                            ),
                            DataColumn(
                              label: Text('Direct Referral'),
                            ),
                            DataColumn(
                              label: Text('Balances'),
                            ),
                          ],
                          rows: [
                            for (int i = 0; i < partners!.length; i++)
                              DataRow(
                                cells: [
                                  DataCell(Text(partners![i]!
                                      .partnerCreatedAt
                                      .toString())),
                                  DataCell(
                                      Text(partners![i]!.parentId.toString())),
                                  DataCell(
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          userId = partners![i]!
                                              .partnerId
                                              .toString();
                                        });
                                        fetch();
                                      },
                                      child: Text(
                                        partners![i]!.partnerId.toString(),
                                        style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(Text(
                                      partners![i]!.partnerName.toString())),
                                  DataCell(Text(
                                      partners![i]!.childrenCount.toString())),
                                  partners![i]!.transactionTypesAmount != null
                                      ? DataCell(Text(partners![i]!
                                          .transactionTypesAmount!
                                          .toJson()
                                          .toString()))
                                      : DataCell(Text("")),
                                ],
                              ),
                          ],
                        ),
                      )
                    : SizedBox()
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
