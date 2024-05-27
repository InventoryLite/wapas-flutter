import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:wapas/models/achievement_list_model.dart';
import 'package:wapas/models/autocomplete_model.dart';
import 'package:wapas/models/balance_history_list_model.dart';
import 'package:wapas/models/balance_model.dart';
import 'package:wapas/models/transaction_model.dart';
import 'package:wapas/models/transaction_profile_model.dart';
import 'package:wapas/models/transaction_report_list_model.dart';
import 'package:wapas/models/transactions_list_model.dart';
import 'package:wapas/models/user_achievement_list_model.dart';
import 'package:wapas/services/achievement_service.dart';
import 'package:wapas/services/autocomplete_service.dart';
import 'package:wapas/services/balance_service.dart';
import 'package:wapas/services/partner_service.dart';
import 'package:wapas/services/report_service.dart';
import 'package:wapas/services/transaction_service.dart';
import 'models/config_model.dart';

import 'wapas_platform_interface.dart';

// ignore: non_constant_identifier_names
Config? CONFIG;

/// An implementation of [WapasPlatform] that uses method channels.
class MethodChannelWapas extends WapasPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wapas');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> init(Config config) async {
    // final Auth auth = await authenticate(config);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (auth.token != null) {
    //   await prefs.setString('token', auth.token ?? "");
    // }
    CONFIG = config;
    // CONFIG!.token = auth.token;
    // return auth.token;
  }

  //ACHIEVEMENTS
  @override
  Future<AchievementList> getAvailableAchievements(int limit, int offset,
      [Config? config]) async {
    config ??= CONFIG!;
    return fetchAvailableAchievements(limit, offset, config);
  }

  @override
  Future<UserAchievementListModel> getUnacknowledgedAchievements(String userId,
      [Config? config]) async {
    config ??= CONFIG!;

    return fetchUnacknowledgedAchievements(userId, config);
  }

  //DROPDOWNS
  @override
  Future<List<AutocompleteModel>> getCurrencyTypes(
      [String? userId, Config? config]) async {
    config ??= CONFIG!;
    return fetchCurrencyTypes(userId, config);
  }

  @override
  Future<List<AutocompleteModel>> getTransactionTypes(
      [String? userId, Config? config]) async {
    config ??= CONFIG!;
    return fetchTransactionTypes(userId, config);
  }

  //Partner Balances
  @override
  Future<List<BalanceModel>> getBalance(String userId, String currency,
      [Config? config]) async {
    config ??= CONFIG!;
    return fetchBalance(userId, currency, config);
  }

  @override
  Future<BalanceHistoryListModel> getBalanceHistory(
      String userId, String currency, String startDate, String endDate,
      [Config? config]) async {
    config ??= CONFIG!;
    return fetchBalanceHistory(userId, currency, startDate, endDate, config);
  }

  @override
  Future<TransactionProfileModel> getTransactionProfile(
      String userId, String currency,
      [Config? config]) async {
    config ??= CONFIG!;
    return fetchTransactionProfile(userId, currency, config);
  }

  @override
  Future<TransactionListModel> getTransactions(int limit, int offset,
      [String? filter, Config? config]) async {
    config ??= CONFIG!;
    return fetchTransactions(limit, offset, filter, config);
  }

  //Reports
  //TODO check model
  @override
  Future<List<TransactionModel>> getBalanceReport(
      String userId,
      String currency,
      String startDate,
      String endDate,
      String group,
      bool includePrevious,
      bool includeToday,
      [Config? config]) async {
    config ??= CONFIG!;
    return fetchBalanceReport(userId, currency, startDate, endDate, group,
        includePrevious, includeToday, config);
  }

  @override
  Future<TransactionReportListModel> getTransactionsReport(
      String? startDate, String? endDate, bool? suspense, int? limit,
      [String? filter, Config? config]) async {
    config ??= CONFIG!;
    return fetchTransactionsReport(
        filter, startDate, endDate, suspense, limit, config);
  }

  //partner
  @override
  Future<bool> savePartner(Map<String, dynamic> payload,
      [Config? config]) async {
    config ??= CONFIG!;
    return createPartner(payload, config);
  }
}
