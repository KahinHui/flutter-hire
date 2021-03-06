import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

@JsonSerializable()
class Job {
  final String id;
  final String title;
  final String salary;
  final String company;
  final String info;
  final String category;
  final String head;
  final String publish;

  Job({
    this.id,
    this.title,
    this.salary,
    this.company,
    this.info,
    this.category,
    this.head,
    this.publish,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);
}
