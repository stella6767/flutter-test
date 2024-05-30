import 'package:json_annotation/json_annotation.dart';

import 'pageable.dart';
import 'sort.dart';

part 'page.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
)
class PageDto<T> {
  final List<T> content;
  final Pageable pageable;
  final bool last;
  final int totalPages;
  final int totalElements;
  final bool first;
  final int size;
  final int number;
  final Sort sort;
  final int numberOfElements;
  final bool empty;

  PageDto({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.first,
    required this.size,
    required this.number,
    required this.sort,
    required this.numberOfElements,
    required this.empty,
  });

  factory PageDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PageDtoFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$PageDtoToJson(this, toJsonT);
}
