part of 'banner_cubit.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}

class GetBannerLoading extends BannerState {}

class GetBannerFailure extends BannerState {
  final String errMessage;

  GetBannerFailure(this.errMessage);
}

class GetBannerSuccess extends BannerState {
  final BannerModel bannerModel;

  GetBannerSuccess(this.bannerModel);
}
