// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companyDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDetail _$CompanyDetailFromJson(Map<String, dynamic> json) {
  return CompanyDetail(
    id: json['id'] as String,
    workHours: json['workHours'] as String,
    weekend: json['weekend'] as String,
    overTime: json['overTime'] as String,
    inc: json['inc'] as String,
    companyImgsResult: json['companyImgsResult'] as List,
  );
}

Map<String, dynamic> _$CompanyDetailToJson(CompanyDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workHours': instance.workHours,
      'weekend': instance.weekend,
      'overTime': instance.overTime,
      'inc': instance.inc,
      'companyImgsResult': instance.companyImgsResult,
    };
