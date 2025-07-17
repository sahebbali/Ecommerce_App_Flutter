import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

/// Manages the network connectivity status and provides methods to check and handle connectivity changes.
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  // Update type to StreamSubscription<List<ConnectivityResult>>
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    // You can decide what logic to apply if multiple results exist.
    final firstResult = results.isNotEmpty
        ? results.first
        : ConnectivityResult.none;
    _connectionStatus.value = firstResult;

    if (_connectionStatus.value == ConnectivityResult.none) {
      HkHelperFunctions.warningSnackBar(title: 'No Internet Connection');
    }
  }

  /// Check the internet connection status.
  /// Returns `true` if connected, `false` otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      // Check if the list contains any connectivity result that's not none
      return result.isNotEmpty &&
          result.any((r) => r != ConnectivityResult.none);

      // OR if you just want to check if there's any connection (regardless of type)
      // return result.isNotEmpty && result.first != ConnectivityResult.none;
    } on PlatformException {
      return false;
    }
  }

  /// Dispose or close the active connectivity stream.
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
