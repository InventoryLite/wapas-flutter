import 'package:wapas/models/achievement_list_model.dart';
import 'package:wapas/models/autocomplete_model.dart';
import 'package:wapas/models/balance_history_list_model.dart';
import 'package:wapas/models/balance_model.dart';
import 'package:wapas/models/config_model.dart';
import 'package:wapas/models/partner_hierarchy_model.dart';
import 'package:wapas/models/transaction_model.dart';
import 'package:wapas/models/transaction_profile_model.dart';
import 'package:wapas/models/transaction_report_list_model.dart';
import 'package:wapas/models/transactions_list_model.dart';
import 'package:wapas/models/user_achievement_list_model.dart';

import 'wapas_platform_interface.dart';

class Wapas {
  Future<String?> getPlatformVersion() {
    return WapasPlatform.instance.getPlatformVersion();
  }

  Future<void> init(Config config) async {
    return WapasPlatform.instance.init(config);
  }

  //ACHIEVEMENTS
  Future<AchievementList> getAvailableAchievements(int limit, int offset,
      [Config? config]) async {
    return WapasPlatform.instance
        .getAvailableAchievements(limit, offset, config);
  }

  Future<UserAchievementListModel> getUnacknowledgedAchievements(String userId,
      [Config? config]) async {
    return WapasPlatform.instance.getUnacknowledgedAchievements(userId, config);
  }

  //DROPDOWNS
  Future<List<AutocompleteModel>> getCurrencyTypes(
      [String? userId, Config? config]) async {
    return WapasPlatform.instance.getCurrencyTypes(userId, config);
  }

  Future<List<AutocompleteModel>> getTransactionTypes(
      [String? userId, Config? config]) async {
    return WapasPlatform.instance.getTransactionTypes(userId, config);
  }

  //Partner Balances
  Future<List<BalanceModel>> getBalance(String userId, String currency,
      [Config? config]) async {
    return WapasPlatform.instance.getBalance(userId, currency, config);
  }

  Future<BalanceHistoryListModel> getBalanceHistory(
      String userId, String currency, String startDate, String endDate,
      [Config? config]) async {
    return WapasPlatform.instance
        .getBalanceHistory(userId, currency, startDate, endDate, config);
  }

  Future<TransactionProfileModel> getTransactionProfile(
      String userId, String currency,
      [Config? config]) async {
    return WapasPlatform.instance
        .getTransactionProfile(userId, currency, config);
  }

  Future<TransactionListModel> getTransactions(int limit, int offset,
      [String? filter, Config? config]) async {
    return WapasPlatform.instance
        .getTransactions(limit, offset, filter, config);
  }

  //Reports
  Future<List<TransactionModel>> getBalanceReport(
      String userId,
      String currency,
      String startDate,
      String endDate,
      String group,
      bool includePrevious,
      bool includeToday,
      [Config? config]) async {
    return WapasPlatform.instance.getBalanceReport(userId, currency, startDate,
        endDate, group, includePrevious, includeToday, config);
  }

  Future<TransactionReportListModel> getTransactionsReport(
      String? startDate, String? endDate, bool? suspense, int? limit,
      [String? filter, Config? config]) async {
    return WapasPlatform.instance.getTransactionsReport(
        startDate, endDate, suspense, limit, filter, config);
  }

  //partner
  Future<bool> savePartner(Map<String, dynamic> payload,
      [Config? config]) async {
    return WapasPlatform.instance.savePartner(payload, config);
  }

  Future<List<PartnerHierarchyModel>> getPartnerHierarchy(
      String userId,
      String? hierarchyType,
      String? uptoPartner,
      int? forLevel,
      int? limit,
      int? skip,
      String? orderByRank,
      String? orderByCount,
      String? relativeTo,
      bool? includeBalances,
      [Config? config]) async {
    return WapasPlatform.instance.getPartnerHierarchy(
      userId,
      hierarchyType,
      uptoPartner,
      forLevel,
      limit,
      skip,
      orderByRank,
      orderByCount,
      relativeTo,
      includeBalances,
      config,
    );
  }
}
