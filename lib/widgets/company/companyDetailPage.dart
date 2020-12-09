import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire/model/company.dart';
import 'package:hire/model/companyDetail.dart';

class CompanyDetailPage extends StatefulWidget {
  final Company company;
  final String heroLogo;

  const CompanyDetailPage({Key key, this.company, this.heroLogo}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  bool _isShow = false;

  Future<CompanyDetail> _fetchCompany() async {
    CompanyDetail companyDetail = CompanyDetail(
      id: '0',
      inc: 'inc',
      companyImgsResult: List<String>()
    );
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
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: new NetworkImage(widget.company.logo),
              alignment: Alignment.center
            ),
          ),
          child: new Text('Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.Company Detail.'),
        ),
      ),
    );
  }

}