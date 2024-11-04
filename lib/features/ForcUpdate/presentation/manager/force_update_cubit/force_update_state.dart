part of 'force_update_cubit.dart';

@immutable
abstract class ForceUpdateState {}

class ForceUpdateInitial extends ForceUpdateState {}

class GetVersionLoading extends ForceUpdateState {}

class GetVersionFailure extends ForceUpdateState {
  final String errMessage;

  GetVersionFailure(this.errMessage);
}

class GetVersionSuccess extends ForceUpdateState {
  final VersionModel versionModel;

  GetVersionSuccess(this.versionModel);
}
