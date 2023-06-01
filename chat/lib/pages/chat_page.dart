import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  static const String routeName = 'ChatPage';

  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = [];
  final _textController = TextEditingController();
  bool _isWriting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              radius: 14,
              child: const Text('Te', style: TextStyle(fontSize: 12)),
            ),
            const SizedBox(height: 3),
            const Text('Test User', style: TextStyle(fontSize: 12, color: Colors.black87)),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true,
              ),
            ),
            const Divider(height: 1),
            _chatInput(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (final message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  Widget _chatInput() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      height: 50,
      child: Row(
        children: [
          const SizedBox(width: 5),
          Flexible(
            child: TextField(
              decoration: const InputDecoration.collapsed(hintText: 'Enviar mensaje'),
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              // focusNode: _focusNode,
              controller: _textController,
              onSubmitted: _handleSubmit,
              onEditingComplete: () => FocusScope.of(context).requestFocus(),
              onChanged: (value) => setState(() => _isWriting = value.trim().isNotEmpty),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: const BoxDecoration(),
            child: IconTheme(
              data: IconThemeData(color: Colors.blue[400]),
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: _isWriting ? () => _handleSubmit(_textController.text) : null,
                icon: const Icon(Icons.send),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _handleSubmit(String text) {
    if (text.isEmpty) return;
    _textController.clear();
    if (text.trim().isEmpty) return;
    final newMessage = ChatMessage(
      text: text,
      uid: '123',
      animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 200)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    _isWriting = false;
    setState(() {});
  }
}
