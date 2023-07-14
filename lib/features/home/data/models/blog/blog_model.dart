part of '../model.dart';

@freezed
class BlogDto with _$BlogDto {
  const BlogDto._();
  const factory BlogDto({
    int? id,
    String? title,
    @JsonKey(name: 'subTitle') String? subtitle,
    String? photo,
    String? content,
    String? author,
    @JsonKey(name: 'create_at') int? createdAt,
    String? tag,
  }) = _BlogDto;

  factory BlogDto.fromJson(Map<String, dynamic> json) =>
      _$BlogDtoFromJson(json);

  Blog toDomain() {
    return Blog(
      id: id ?? 0,
      title: title ?? '',
      subtitle: subtitle ?? '',
      photoUrl: photo ?? '',
      content: content ?? '',
      author: author ?? '',
      createdAt: createdAt ?? 0,
      tag: tag ?? '',
    );
  }
}
