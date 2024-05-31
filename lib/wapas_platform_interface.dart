import 'package:plugin_platform_interface/plugin_platform_interface.dart';
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
import 'package:wapas/models/user_achievement_model.dart';

import 'wapas_method_channel.dart';

abstract class WapasPlatform extends PlatformInterface {
  /// Constructs a WapasPlatform.
  WapasPlatform() : super(token: _token);

  static final Object _token = Object();

  static WapasPlatform _instance = MethodChannelWapas();

  /// The default instance of [WapasPlatform] to use.
  ///
  /// Defaults to [MethodChannelWapas].
  static WapasPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WapasPlatform] when
  /// they register themselves.
  static set instance(WapasPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> init(Config config) async {
    throw UnimplementedError('init() has not been implemented.');
  }

  //ACHIEVEMENTS
  Future<AchievementList> getAvailableAchievements(int limit, int offset,
      [Config? config]) async {
    throw UnimplementedError(
        'getAvailableAchievements() has not been implemented.');
  }

  Future<List<UserAchievementModel>> getUserAchievements(String userId,
      [Config? config]) async {
    throw UnimplementedError('getUserAchievements() has not been implemented.');
  }

  Future<UserAchievementListModel> getUnacknowledgedAchievements(String userId,
      [Config? config]) async {
    throw UnimplementedError(
        'getUnacknowledgedAchievements() has not been implemented.');
  }

  Future<List<UserAchievementModel>> acknowledgeAchievement(
      String userId, String achievementId,
      [Config? config]) async {
    throw UnimplementedError(
        'acknowledgeAchievement() has not been implemented.');
  }

  //DROPDOWNS
  Future<List<AutocompleteModel>> getCurrencyTypes(
      [String? userId, Config? config]) async {
    throw UnimplementedError('getCurrencyTypes() has not been implemented.');
  }

  Future<List<AutocompleteModel>> getTransactionTypes(
      [String? userId, Config? config]) async {
    throw UnimplementedError('getTransactionTypes() has not been implemented.');
  }

  //Partner Balances
  Future<List<BalanceModel>> getBalance(String userId, String currency,
      [Config? config]) async {
    throw UnimplementedError('getBalance() has not been implemented.');
  }

  Future<BalanceHistoryListModel> getBalanceHistory(
      String userId, String currency, String startDate, String endDate,
      [Config? config]) async {
    throw UnimplementedError('getBalanceHistory() has not been implemented.');
  }

  Future<TransactionProfileModel> getTransactionProfile(
      String userId, String currency,
      [Config? config]) async {
    throw UnimplementedError(
        'getTransactionProfile() has not been implemented.');
  }

  Future<TransactionListModel> getTransactions(int limit, int offset,
      [String? filter, Config? config]) async {
    throw UnimplementedError('getTransactions() has not been implemented.');
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
    throw UnimplementedError('getBalanceReport() has not been implemented.');
  }

  Future<TransactionReportListModel> getTransactionsReport(
      String? startDate, String? endDate, bool? suspense, int? limit,
      [String? filter, Config? config]) async {
    throw UnimplementedError(
        'getTransactionsReport() has not been implemented.');
  }

  //partner
  Future<bool> savePartner(Map<String, dynamic> payload,
      [Config? config]) async {
    throw UnimplementedError('savePartner() has not been implemented.');
  }

  //PartnerHierarchyTree
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
    throw UnimplementedError('getPartnerHierarchy() has not been implemented.');
  }
}
