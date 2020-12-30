import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hire/common/Config.dart';
import 'package:hire/model/message.dart';
import 'package:hire/widgets/message/messageReceiveItem.dart';
import 'package:hire/widgets/message/messageSendItem.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessageHistoryPage extends StatefulWidget {
  final Message message;

  const MessageHistoryPage({Key key, this.message}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageHistoryPageState();
}

class _MessageHistoryPageState extends State<MessageHistoryPage> /*with WidgetsBindingObserver*/ {
  ScrollController _scrollController = new ScrollController();
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  WebSocketChannel channel =
      IOWebSocketChannel.connect('ws://echo.websocket.org/');

  List<Message> _msgList = List();
  double _scrollBottom = 0.0;
  bool _isKeyboardShowing = false;

  @override
  void initState() {
    super.initState();
    // channel.stream.listen((msgString) {
    //   Message msg = Message.fromJson(jsonDecode(msgString));
    //   msg.type = 'receive';
    //   setState(() => _msgList.add(msg));
    // });
    _focusNode.addListener(onFocusChange);
    // WidgetsBinding.instance.addObserver(this);
    Message msg = widget.message;
    msg.type = 'receive';
    _msgList.add(msg);
  }

  @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   WidgetsBinding.instance.addPostFrameCallback((callback) {
  //     if (_focusNode.hasFocus) {
  //       if (_isKeyboardShowing) {
  //         _isKeyboardShowing = false;
  //         _focusNode.unfocus();
  //         return;
  //       }
  //       _isKeyboardShowing = true;
  //     }
  //   });
  // }

  void onFocusChange() {
    if (_focusNode.hasFocus) {
      setState(() {
        _scrollController.jumpTo(_scrollBottom);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // _isKeyboardShowing = MediaQuery.of(context).viewInsets.vertical > 0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          widget.message.name,
          style: new TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: WillPopScope(
        onWillPop: null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
                child: StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                return new ListView.builder(
                    // reverse: true,
                    controller: _scrollController,
                    itemBuilder: (context, index) =>
                        _makeMessageElement(index));
              },
            )
                // new ListView.builder(
                //   reverse: true,
                //   controller: _scrollController,
                //     itemBuilder: (context, index) => _makeMessageElement(index)),
                ),
            SafeArea(
                child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    onSubmitted: (value) {
                      _sendMessage();
                    },
                    controller: _controller,
                    focusNode: _focusNode,
                    // autofocus: true,
                    decoration: new InputDecoration(hintText: '發送一條消息'),
                  )),
                  RaisedButton(
                    color: Config.GLOBAL_COLOR,
                    child: Text(
                      '發送',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _sendMessage,
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      final Message msg = Message()
        ..name = widget.message.name
        ..head = widget.message.head
        ..message = _controller.text
        ..type = 'send';

      setState(() => _msgList.add(msg));
      channel.sink.add(jsonEncode(msg.toJson()));

      if (_scrollController.position.maxScrollExtent != double.infinity) {
        _scrollBottom = _scrollController.position.maxScrollExtent;
      }
      _scrollController.jumpTo(_scrollBottom);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Widget _makeMessageElement(index) {
    if (index >= _msgList.length) {
      return null;
    }
    Message msg = _msgList[index];
    if (msg.type == 'send') {
      return MessageSendItem(
        message: msg,
      );
    } else if (msg.type == 'receive') {
      return MessageReceiveItem(
        message: msg,
      );
    }
  }
}
