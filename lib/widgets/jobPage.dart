import 'package:flutter/material.dart';

class JobPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> with AutomaticKeepAliveClientMixin {


  @override
  bool get wantKeepAlive => true;

  @override
  Widget bulild(BuildContext context) {
    return new Scaffold();
  }
}