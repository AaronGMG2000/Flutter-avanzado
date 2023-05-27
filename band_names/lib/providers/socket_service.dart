import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

enum ServerStatus { online, offline, connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  ServerStatus get serverStatus => _serverStatus;

  io.Socket? _socket;

  io.Socket? get socket => _socket;

  Function get emit => _socket!.emit;

  set socket(io.Socket? valor) {
    _socket = valor;
    notifyListeners();
  }

  set serverStatus(ServerStatus status) {
    _serverStatus = status;
    notifyListeners();
  }

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    _socket = io.io('https://flutter-socket-server-rnxi.onrender.com/', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    _socket!
      ..onConnect((_) {
        debugPrint('connect');
        serverStatus = ServerStatus.online;
      })
      ..onDisconnect((_) {
        debugPrint('disconnect');
        serverStatus = ServerStatus.offline;
      });
  }
}
