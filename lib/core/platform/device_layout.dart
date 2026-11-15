import 'package:flutter/services.dart';

/// Native Android TV detection. No screen-size guessing: tablets stay mobile.
class DeviceLayout {
  DeviceLayout._();

  static const MethodChannel _channel =
      MethodChannel('com.streamia/device_identity');

  static bool _isTelevision = false;
  static String _lastOrientation = '';

  static bool get isTelevision => _isTelevision;

  /// Call before runApp and before setting the startup orientation.
  static Future<void> initialize() async {
    try {
      _isTelevision =
          await _channel.invokeMethod<bool>('isAndroidTv') ?? false;
    } on PlatformException {
      _isTelevision = false;
    } on MissingPluginException {
      _isTelevision = false;
    }
  }

  static Future<void> setOnboardingOrientation() {
    if (_lastOrientation == 'onboarding') return Future<void>.value();
    _lastOrientation = 'onboarding';
    return SystemChrome.setPreferredOrientations(
      _isTelevision
          ? const [DeviceOrientation.landscapeLeft,
                   DeviceOrientation.landscapeRight]
          : const [DeviceOrientation.portraitUp],
    );
  }

  static Future<void> setDashboardOrientation() {
    if (_lastOrientation == 'dashboard') return Future<void>.value();
    _lastOrientation = 'dashboard';
    return SystemChrome.setPreferredOrientations(
      const [DeviceOrientation.landscapeLeft,
             DeviceOrientation.landscapeRight],
    );
  }
}
