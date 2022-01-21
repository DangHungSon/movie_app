import 'package:equatable/equatable.dart';

abstract class BannerEvent extends Equatable{
  const BannerEvent();

  @override
  List<Object?> get props => [];
}

class RequestGetBanner extends BannerEvent{
  const RequestGetBanner();

  @override
  List<Object?> get props => [];
}