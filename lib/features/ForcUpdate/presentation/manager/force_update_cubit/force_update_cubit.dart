import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/version_model/version_model.dart';
import '../../../data/repo/version_repo.dart';

part 'force_update_state.dart';

class ForceUpdateCubit extends Cubit<ForceUpdateState> {
  ForceUpdateCubit(this.versionRepo) : super(ForceUpdateInitial());

  VersionRepo versionRepo;

  static ForceUpdateCubit get(context) =>
      BlocProvider.of<ForceUpdateCubit>(context);

  Future<void> getVersion() async {
    emit(GetVersionLoading());
    var result = await versionRepo.getVersion();
    result.fold(
      (failure) {
        emit(GetVersionFailure(failure.message));
      },
      (version) {
        emit(GetVersionSuccess(version));
      },
    );
  }
}
