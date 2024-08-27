import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/product_datasource.dart';
import 'package:tedikap_user_bloc/data/models/response/banner_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/box_promo_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/most_like_product_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/status_outlet_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/user_point_response_model.dart';

import '../../../../data/datasource/user_datasource.dart';
import '../../../../data/models/response/current_user_response_model.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserDatasource datasource;
  final ProductDatasource productDatasource;

  HomeBloc({required this.datasource, required this.productDatasource})
      : super(const HomeState.initial()) {

    on<_ChangeIndex>((event, emit) {
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(newIndex: event.index));
      }
    });

    on<_GetUser>((event, emit) async {
      final currentState = state;
      // Jika forceRefresh true atau state bukan _Success, lakukan fetch
      if (currentState is _Success && !event.forceRefresh) {
        return;
      }
      emit(const _Loading());
      try {
        final userResult = await datasource.getCurrentUser();
        await userResult.fold((userError) async {
          emit(const _Error(message: 'Failed to get user'));
        }, (user) async {
          final productResult = await productDatasource.getAllMostPopularProduct();
          final pointsResult = await datasource.getPointUser();
          final statusResult = await datasource.getStatusOutlet();
          final bannerResult = await datasource.getBanner();
          final boxPromoResult = await datasource.getBoxPromo();

          final products = productResult.fold((l) => null, (r) => r);
          final points = pointsResult.fold((l) => null, (r) => r);
          final status = statusResult.fold((l) => null, (r) => r);
          final banner = bannerResult.fold((l) => null, (r) => r);
          final boxPromo = boxPromoResult.fold((l) => null, (r) => r);

          emit(_Success(
            user: user,
            model: products,
            pointModel: points,
            statusOutletModel: status,
            bannerModel: banner,
            boxPromoModel: boxPromo,
          ));
        });
      } catch (e) {
        emit(const _Error(message: 'Failed to access data'));
      }
    });

  }
}
