import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus {
  online,
  offline,
  connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  Socket get socket => _socket;
  // Function get emit => _socket.emit;

  SocketService() {
    _initConfig();
  }

  final String ip = '192.168.194.23';
  final String port = '8080';

  _initConfig() {
    final String url = 'http://$ip:$port';

    // io.Socket socket = io.io(url, {
    //   'transports': ['websocket'],
    //   'autoConnect': true,
    // });

    _socket = io(
      url,
      OptionBuilder().setTransports(['websocket']).enableAutoConnect().setExtraHeaders({'foo': 'bar'}).build(),
    );

    _socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });

    // _socket.on('new-sms', (payload) {
    //   print('new-sms: $payload');
    // });
  }
}
