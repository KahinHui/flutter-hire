import 'package:flutter/material.dart';
import 'package:hire/widgets/mine/contactItem.dart';
import 'package:hire/widgets/mine/menuItem.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin<MinePage> {
  final double _appBarHeight = 180.0;
  final String _useHead = '';

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: new FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  const DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                        begin: const Alignment(0.0, -1.0),
                        end: const Alignment(0.0, -0.4),
                        colors: const <Color>[
                          const Color(0x00000000),
                          const Color(0x00000000)
                        ],
                      ),
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                        flex: 3,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, left: 30.0, bottom: 15.0),
                              child: new Text(
                                'kiki',
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.0),
                              ),
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: new Text(
                                '在職-不考慮機會',
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Expanded(
                        flex: 1,
                        child: new Padding(
                          padding:
                              const EdgeInsets.only(top: 40.0, right: 30.0),
                          child: new CircleAvatar(
                            radius: 35.0,
                            backgroundImage: new NetworkImage(_useHead),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          new SliverList(
              delegate: new SliverChildListDelegate(
            <Widget>[
              new Container(
                color: Colors.white,
                child: new Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new ContactItem(count: '12', title: '溝通過',),
                      new ContactItem(count: '1', title: '面試',),
                      new ContactItem(count: '24', title: '已投遞',),
                      new ContactItem(count: '20', title: '感興趣',),
                    ],
                  ),
                ),
              ),
              new Container(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: <Widget>[
                    new MenuItem(icon: Icons.face, title: '體驗新版本',),
                    new MenuItem(icon: Icons.print, title: '我的微簡歷',),
                    new MenuItem(icon: Icons.archive, title: '附件簡歷',),
                    new MenuItem(icon: Icons.home, title: '管理求職意向',),
                    new MenuItem(icon: Icons.title, title: '提升簡歷排名',),
                    new MenuItem(icon: Icons.chat, title: '牛人問答',),
                    new MenuItem(icon: Icons.assessment, title: '關注公司',),
                    new MenuItem(icon: Icons.add_shopping_cart, title: '錢包',),
                    new MenuItem(icon: Icons.security, title: '私隱設置',),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
