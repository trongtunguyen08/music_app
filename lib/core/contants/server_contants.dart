import 'dart:io';

class ServerContants {
  static String serverURL =
      Platform.isAndroid
          ? "http://192.168.90.47:8000"
          : "http://127.0.0.1:8000";
}
