import 'package:band_names/providers/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  static const String routeName = 'Status';

  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SocketService socketService = Provider.of<SocketService>(context);
    return Scaffold(
      body: Center(
        child: Text('ServerStatus: ${socketService.serverStatus}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          socketService.emit('emitir-mensaje', {
            'nombre': 'Flutter',
            'mensaje': 'Hola desde Flutter',
          });
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
