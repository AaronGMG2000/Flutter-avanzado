import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/usuario_model.dart';

class UsuariosPage extends StatefulWidget {
  static const String routeName = 'UsuariosPage';

  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final List<UsuarioModel> usuarios = [
    UsuarioModel(uid: '1', nombre: 'Maria', email: 'maria@email.com', online: true),
    UsuarioModel(uid: '2', nombre: 'Jose', email: 'jose@email.com', online: false),
    UsuarioModel(uid: '3', nombre: 'Pedro', email: 'fernando@email.com', online: true),
  ];
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UsuariosPage', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 1,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
            // child: const Icon(Icons.offline_bolt, color: Colors.red),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _onRefresh,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400]),
          waterDropColor: Colors.blue[400]!,
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, i) => _UsuarioListTile(usuarios[i]),
          separatorBuilder: (_, i) => const Divider(),
          itemCount: usuarios.length,
        ),
      ),
    );
  }

  Future _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    _refreshController.refreshCompleted();
  }
}

class _UsuarioListTile extends StatelessWidget {
  final UsuarioModel usuario;
  const _UsuarioListTile(this.usuario, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(usuario.nombre.toUpperCase().substring(0, 2), style: const TextStyle(color: Colors.white))),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: usuario.online ? Colors.green : Colors.red,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
      ),
    );
  }
}
