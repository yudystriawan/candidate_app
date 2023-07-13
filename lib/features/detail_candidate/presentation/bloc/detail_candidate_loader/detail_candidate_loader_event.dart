part of 'detail_candidate_loader_bloc.dart';

@freezed
class DetailCandidateLoaderEvent with _$DetailCandidateLoaderEvent {
  const factory DetailCandidateLoaderEvent.showed(int id) = _Showed;
}
