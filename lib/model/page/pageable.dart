import 'package:json_annotation/json_annotation.dart';
import 'sort.dart';

part 'pageable.g.dart';

@JsonSerializable()
class Pageable {
  final int pageNumber;
  final int pageSize;
  final Sort sort;
  final int offset;
  final bool? paged;
  final bool? unpaged;

  Pageable({
    required this.pageNumber,
    required this.pageSize,
    required this.sort,
    required this.offset,
    this.paged,
    this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) => _$PageableFromJson(json);
  Map<String, dynamic> toJson() => _$PageableToJson(this);
}