part of 'model.dart';

@freezed
class BlogDto with _$BlogDto {
  const BlogDto._();
  const factory BlogDto({
    int? id,
    String? title,
    String? subTitle,
    String? photo,
    String? content,
    String? author,
    @JsonKey(name: 'create_at') int? createAt,
    String? tag,
  }) = _BlogDto;

  factory BlogDto.fromJson(Map<String, dynamic> json) =>
      _$BlogDtoFromJson(json);

  Blog toDomain() {
    return Blog(
      id: id ?? 0,
      title: title ?? '',
      subtitle: subTitle ?? '',
      photoUrl: photo ?? '',
      content: content ?? '',
      author: author ?? '',
      createdAt: createAt ?? 0,
      tag: tag ?? '',
    );
  }
}
