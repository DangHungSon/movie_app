import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/services/api_call.dart';

import 'banner_events.dart';
import 'banner_states.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  ApiClient apiClient = ApiClient();

  BannerBloc() : super(const BannerInit()) {
    on<RequestGetBanner>((event, emit) async {
      await _handleGetBanner(emit);
    });
  }

  _handleGetBanner(Emitter emit) async {
    emit(const BannerLoading());
    try {
      final response = await apiClient.getBannerList();
      emit(BannerLoadSuccess(movieBanner: response));
    } catch (e) {
      emit(BannerLoadError(messageBanner: e.toString()));
    }
  }
}