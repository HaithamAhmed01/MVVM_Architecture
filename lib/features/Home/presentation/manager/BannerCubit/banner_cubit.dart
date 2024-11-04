import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test/features/Home/data/repo/home_repo.dart';

import '../../../data/models/banner_model/banner_model.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this.homeRepo) : super(BannerInitial());
  HomeRepo homeRepo;

  static BannerCubit get(context) => BlocProvider.of<BannerCubit>(context);

  Future<void> getBanner() async {
    emit(GetBannerLoading());
    var result = await homeRepo.getBanner();
    result.fold((failure) {
      emit(GetBannerFailure(failure.message));
    }, (banners) {
      emit(GetBannerSuccess(banners));
    });
  }
}
