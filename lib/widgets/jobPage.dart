import 'package:flutter/material.dart';

class JobPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _JobPageState();
}

class _JobPageState extends State<JobPage> with AutomaticKeepAliveClientMixin {
  Future<List<String>> _fetchJobList() async {}

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text(
          'Job',
          style: new TextStyle(fontSize: 20.0, color: Colors.white),
          textDirection: TextDirection.ltr,
        ),
      ),
      body: new Center(
        child: FutureBuilder(
          future: _fetchJobList(),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return _createListView(context, snapshot);
            }
          },
        ),
      ),
    );
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> jobList = snapshot.data;
    return ListView.builder(
      key: new PageStorageKey('job-list'),
      itemCount: jobList.length,
      itemBuilder: (BuildContext context, int index) {
        return null;
      },
    );
  }
}
