import 'package:flutter/material.dart';
import 'package:hire/model/job.dart';
import 'package:hire/widgets/job/jobItem.dart';

class JobPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _JobPageState();
}

class _JobPageState extends State<JobPage> with AutomaticKeepAliveClientMixin {
  Future<List<Job>> _fetchJobList() async {
    List<Job> jobList = List<Job>();
    // Response<Map<String, dynamic>> response = await HttpUtil().get();
    Job jobData = new Job(
        id: '1',
        title: 'Engineer',
        salary: '10k pre mon',
        company: 'Google Inc.',
        info: 'Working in Google Inc.',
        category: 'category',
        head: '',
        publish: 'Tom');
    Job jobData1 = new Job(
        id: '2',
        title: 'Senior Engineer',
        salary: '100k pre mon',
        company: 'Google Inc.',
        info: 'Working in Google Inc.Working in Google Inc.Working in Google Inc.Working in Google Inc.Working in Google Inc.Working in Google Inc.Working in Google Inc.Working in Google Inc.Working in Google Inc.Working in Google Inc.',
        category: 'category',
        head: '',
        publish: 'Tom');
    jobList.add(jobData);
    jobList.add(jobData1);
    return jobList;
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
    List<Job> jobList = snapshot.data;
    return ListView.builder(
      key: new PageStorageKey('job-list'),
      itemCount: jobList.length,
      itemBuilder: (BuildContext context, int index) {
        return new JobItem(
          onPressed: () {},
          job: jobList[index],
        );
      },
    );
  }
}
