import 'package:flutter/material.dart';
import 'package:hire/common/Widget/scrollImgItem.dart';
import 'package:hire/model/company.dart';
import 'package:hire/model/companyDetail.dart';
import 'package:hire/widgets/company/welfareItem.dart';
import 'package:hire/widgets/galleryPage.dart';

class CompanyDetailPage extends StatefulWidget {
  final Company company;
  final String heroLogo;

  const CompanyDetailPage({Key key, this.company, this.heroLogo})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  bool _isShow = false;

  Future<CompanyDetail> _fetchCompany() async {
    CompanyDetail companyDetail = CompanyDetail(
        id: '0',
        workHours: '10:00-19:00',
        weekend: '雙休',
        overTime: '偶爾',
        inc: 'inc',
        companyImgsResult: List<String>());
    return companyDetail;
  }

  _scrollListener() {
    setState(() {
      if (_scrollController.offset < 56 && _isShow) {
        _isShow = false;
      } else if (_scrollController.offset >= 56 && !_isShow) {
        _isShow = true;
      }
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Scaffold(
        backgroundColor: new Color.fromARGB(255, 68, 76, 96),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.dstATop),
                fit: BoxFit.cover,
                image: new NetworkImage(widget.company.logo),
                alignment: Alignment.center),
          ),
          // child: new Text(
          //     'Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.'),
          child: _companyDetailView(context),
        ),
      ),
    );
  }

  Widget _companyDetailView(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            new SliverAppBar(
              elevation: 0.0,
              pinned: true,
              backgroundColor:
                  new Color.fromARGB(_isShow == true ? 255 : 0, 68, 76, 96),
              centerTitle: false,
              title: new Text(
                widget.company.company,
                style: new TextStyle(
                  fontSize: 20.0,
                  color: new Color.fromARGB(
                      _isShow == true ? 255 : 0, 255, 255, 255),
                ),
              ),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {})
              ],
            ),
            SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                new Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 3,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 25.0, bottom: 10.0),
                            child: new Text(
                              '${widget.company.company}',
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: new Text(
                              '${widget.company.info}',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Expanded(
                        child: new Padding(
                      padding: const EdgeInsets.only(top: 25.0, right: 30.0),
                      child: Hero(
                        tag: widget.heroLogo,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: Image.network(
                            widget.company.logo,
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
                FutureBuilder<CompanyDetail>(
                  future: _fetchCompany(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _companyBody(context, snapshot);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ]),
            )
          ],
        ),
      ],
    );
  }

  Widget _companyBody(BuildContext context, AsyncSnapshot snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30.0, left: 25.0, right: 20.0),
          child: _createWorkHours(context, snapshot),
        ),
        _createWelfareItem(),
        Padding(
          padding: EdgeInsets.only(left: 25.0, right: 20.0),
          child: Text(
            '公司介紹',
            style: new TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, bottom: 10.0, right: 25.0),
          child: Text(
            snapshot.data.inc,
            textAlign: TextAlign.justify,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.0,
            style: new TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0, left: 25.0, bottom: 10.0),
          child: Text(
            '公司相片',
            style: new TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 50.0),
          height: 120.0,
          child: _createImgList(context, snapshot),
        )
      ],
    );
  }

  Widget _createWorkHours(BuildContext context, AsyncSnapshot snapshot) {
    return Wrap(
      spacing: 40.0,
      runSpacing: 16.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.access_alarm,
              color: Colors.white,
              size: 18.0,
            ),
            Padding(padding: EdgeInsets.only(right: 6.0)),
            Text(
              snapshot.data.workHours,
              style: new TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
              size: 18.0,
            ),
            Padding(padding: EdgeInsets.only(right: 6.0)),
            Text(
              snapshot.data.weekend,
              style: new TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.movie,
              color: Colors.white,
              size: 18.0,
            ),
            Padding(padding: EdgeInsets.only(right: 6.0)),
            Text(
              snapshot.data.overTime,
              style: new TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ],
        ),
      ],
    );
  }

  Widget _createWelfareItem() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
      child: Container(
        margin: EdgeInsets.only(left: 20.0, bottom: 20.0),
        height: 120.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            WelfareItem(
              iconData: Icons.flip,
              title: '五險一金',
            ),
            WelfareItem(
              iconData: Icons.security,
              title: '補充醫療保險',
            ),
            WelfareItem(
              iconData: Icons.access_alarm,
              title: '定期體檢',
            ),
            WelfareItem(
              iconData: Icons.face,
              title: '年終獎',
            ),
            WelfareItem(
              iconData: Icons.brightness_5,
              title: '帶薪年假',
            ),
          ],
        ),
      ),
    );
  }

  Widget _createImgList(BuildContext context, AsyncSnapshot snapshot) {
    List imgList = snapshot.data.companyImgsResult;
    return ListView.builder(
        key: new PageStorageKey('img-list'),
        scrollDirection: Axis.horizontal,
        itemCount: imgList.length,
        itemBuilder: (BuildContext context, int index) {
          return ScrollImageItem(
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder<Null>(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> sexondaryAnimation) {
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (BuildContext context, Widget child) {
                        return Opacity(
                          opacity: animation.value,
                          child: GalleryPage(
                              url: imgList[index], heroTag: 'heroTag$index'),
                        );
                      },
                    );
                  },
                  transitionDuration: Duration(microseconds: 300),
                ),
              );
            },
            url: imgList[index],
            heroTag: 'heroTag$index',
          );
        });
  }
}
