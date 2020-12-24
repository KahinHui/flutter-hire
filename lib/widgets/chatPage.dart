import 'package:flutter/material.dart';
import 'package:hire/model/message.dart';
import 'package:hire/widgets/message/messageHistory.dart';
import 'package:hire/widgets/message/messageItem.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin {
  Future<List<Message>> _fetchMeaasgeList() async {
    List<Message> messageList = List<Message>();
    Message message = Message(
        name: 'kk',
        head: '',
        message: 'hello!',
        time: '2020-12-23 16:15:00',
        type: 'text');
    Message message1 = Message(
        name: 'kiki',
        head: '',
        message: 'hey!',
        time: '2020-12-23 17:54:00',
        type: 'text');
    messageList.add(message);
    messageList.add(message1);
    return messageList;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text(
          '消息',
          style: new TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: new Center(
        child: FutureBuilder(
            future: _fetchMeaasgeList(),
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  else
                    return _createListView(context, snapshot);
              }
            }),
      ),
    );
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Message> messageList = snapshot.data;
    return ListView.builder(
        key: new PageStorageKey('message-list'),
        itemCount: messageList.length,
        itemBuilder: (BuildContext context, int index) {
          return new MessageItem(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  MessageHistoryPage(message: messageList[index],)));
            },
            message: messageList[index],
          );
        });
  }
}
