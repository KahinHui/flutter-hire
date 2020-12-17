
import 'package:json_annotation/json_annotation.dart';

part 'companyDetail.g.dart';

@JsonSerializable()
class CompanyDetail {
  final String id;
  final String workHours;
  final String weekend;
  final String overTime;
  final String inc;
  final List companyImgsResult;

  CompanyDetail({this.id, this.workHours, this.weekend, this.overTime, this.inc, this.companyImgsResult});

  factory CompanyDetail.fromJson(Map<String, dynamic> json) => _$CompanyDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDetailToJson(this);
}