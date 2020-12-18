import 'package:flutter/material.dart';
import 'package:hire/model/company.dart';
import 'package:hire/widgets/company/companyDetailPage.dart';
import 'package:hire/widgets/company/companyItem.dart';

class CompanyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage>
    with AutomaticKeepAliveClientMixin {
  Future<List<Company>> _fetchCompanyList() async {
    List<Company> companyList = List<Company>();
    Company companyData = Company(
        id: '0',
        company: 'Google Inc.',
        logo:
            '',
        info: 'An American company.',
        hot: '12345678');
    Company companyData1 = Company(
        id: '1',
        company: 'Apple Inc.',
        logo:
            '',
        info: 'An American company.',
        hot: '123456');
    companyList.add(companyData);
    companyList.add(companyData1);
    return companyList;
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
          'Company',
          style: new TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: new Center(
        child: FutureBuilder(
          future: _fetchCompanyList(),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return new CircularProgressIndicator();
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else
                  return _createListView(context, snapshot);
            }
          },
        ),
      ),
    );
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Company> companyList = snapshot.data;
    return ListView.builder(
        key: new PageStorageKey('company=list'),
        itemCount: companyList.length,
        itemBuilder: (BuildContext context, int index) {
          return CompanyItem(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CompanyDetailPage(
                            company: companyList[index],
                            heroLogo: "heroLogo$index",
                          )));
            },
            company: companyList[index],
            heroLogo: "heroLogo$index",
          );
        });
  }
}
