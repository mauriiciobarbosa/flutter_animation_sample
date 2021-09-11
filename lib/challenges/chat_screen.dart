import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = [];
  final _textController = TextEditingController();
  final _listViewController = ScrollController();
  final _focusNode = FocusNode();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friendly Chat'),
      ),
      body: SafeArea(
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).accentColor),
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  controller: _listViewController,
                  padding: EdgeInsets.all(8),
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (context, position) {
                    return _messages[position];
                  },
                ),
              ),
              Divider(height: 1),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _textController,
                        onChanged: (text) {
                          setState(() {
                            _isComposing = text.isNotEmpty;
                          });
                        },
                        onSubmitted: _isComposing ? _handleSubmitted : null,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Send a message',
                        ),
                        focusNode: _focusNode,
                      ),
                    ),
                    IconButton(
                      onPressed: _isComposing
                          ? () => _handleSubmitted(_textController.text)
                          : null,
                      icon: Icon(Icons.send),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmitted(String value) {
    _textController.clear();

    var chatMessage = ChatMessage(
      text: value,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this,
      ),
    );

    setState(() {
      _messages.insert(0, chatMessage);
    });

    chatMessage.animationController.forward();
    _listViewController.animateTo(0.0,
        duration: Duration(milliseconds: 400), curve: Curves.fastOutSlowIn);

    _focusNode.requestFocus();
    _isComposing = false;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.animationController});

  final AnimationController animationController;
  final String text;
  final String _name = 'Mauricio';

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      axisAlignment: -1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              child: CircleAvatar(child: Text(_name[0])),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_name, style: Theme.of(context).textTheme.headline5),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(text),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
