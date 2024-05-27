import 'package:flutter_test/flutter_test.dart';
import 'package:wapas/models/achievement_list_model.dart';
import 'package:wapas/models/autocomplete_model.dart';
import 'package:wapas/models/balance_history_list_model.dart';
import 'package:wapas/models/balance_model.dart';
import 'package:wapas/models/config_model.dart';
import 'package:wapas/models/transaction_model.dart';
import 'package:wapas/models/transaction_profile_model.dart';
import 'package:wapas/models/transaction_report_list_model.dart';
import 'package:wapas/models/transactions_list_model.dart';
import 'package:wapas/wapas.dart';
import 'package:wapas/wapas_platform_interface.dart';
import 'package:wapas/wapas_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWapasPlatform
    with MockPlatformInterfaceMixin
    implements WapasPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<AchievementList> getAvailableAchievements(int limit, int offset,
      [Config? config]) {
    // TODO: implement getAvailableAchievements
    throw UnimplementedError();
  }

  @override
  Future<List<BalanceModel>> getBalance(String userId, String currency,
      [Config? config]) {
    // TODO: implement getBalance
    throw UnimplementedError();
  }

  @override
  Future<BalanceHistoryListModel> getBalanceHistory(
      String userId, String currency, String startDate, String endDate,
      [Config? config]) {
    // TODO: implement getBalanceHistory
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getBalanceReport(
      String userId,
      String currency,
      String startDate,
      String endDate,
      String group,
      bool includePrevious,
      bool includeToday,
      [Config? config]) {
    // TODO: implement getBalanceReport
    throw UnimplementedError();
  }

  @override
  Future<List<AutocompleteModel>> getCurrencyTypes(
      [String? userId, Config? config]) {
    // TODO: implement getCurrencyTypes
    throw UnimplementedError();
  }

  @override
  Future<TransactionProfileModel> getTransactionProfile(
      String userId, String currency,
      [Config? config]) {
    // TODO: implement getTransactionProfile
    throw UnimplementedError();
  }

  @override
  Future<List<AutocompleteModel>> getTransactionTypes(
      [String? userId, Config? config]) {
    // TODO: implement getTransactionTypes
    throw UnimplementedError();
  }

  @override
  Future<TransactionListModel> getTransactions(int limit, int offset,
      [String? filter, Config? config]) {
    // TODO: implement getTransactions
    throw UnimplementedError();
  }

  @override
  Future<TransactionReportListModel> getTransactionsReport(
      String? startDate, String? endDate, bool? suspense, int? limit,
      [String? filter, Config? config]) {
    // TODO: implement getTransactionsReport
    throw UnimplementedError();
  }

  @override
  Future<AchievementList> getUnacknowledgedAchievements(String userId,
      [Config? config]) {
    // TODO: implement getUnacknowledgedAchievements
    throw UnimplementedError();
  }

  @override
  Future<void> init(Config config) {
    // TODO: implement init
    throw UnimplementedError();
  }
}

void main() {
  final WapasPlatform initialPlatform = WapasPlatform.instance;

  test('$MethodChannelWapas is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWapas>());
  });

  test('getPlatformVersion', () async {
    Wapas wapasPlugin = Wapas();
    MockWapasPlatform fakePlatform = MockWapasPlatform();
    WapasPlatform.instance = fakePlatform;

    expect(await wapasPlugin.getPlatformVersion(), '42');
  });
}
