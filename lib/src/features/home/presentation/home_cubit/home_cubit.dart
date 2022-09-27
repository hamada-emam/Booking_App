import 'package:booking_app/src/features/explore_hotels/presentation/screens/explore_screen.dart';
import 'package:booking_app/src/features/home/presentation/views/profile/profile_screen.dart';
import 'package:booking_app/src/features/home/presentation/views/trips/presentation/screens/trips_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/core/helpers/api_helpert.dart';
import '../../../../app/injector.dart';
import '../../data/models/all_hotels_data.dart';
import '../views/explore/home_explore_page.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int index = 0;
  List<Widget> screens =
      List<Widget>.from([(HomeExplore()), TripsScreen(), const ProfileScreen()]);
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);
  double opacity = 0;
  double margin = 100;
  changeIndex(int i) {
    index = i;
    opacity = 1;
    margin = 0;

    emit(ScreenChangedState());
  }

  void resetAnimation() {
    opacity = 0;
    margin = 100;
  }

  AllHotelsDataModel? allHotelsData;


  Future<void> getAllHotels({String? token}) async {
    try {
      DioHelper apiHelper = sl<DioHelper>();
      var value = await apiHelper.get(
        endPoint: '/hotels/',
        token: token,
      );
      // showToastMessage(message: "${value.data['message']}");
      allHotelsData = AllHotelsDataModel.fromJson(value);
      debugPrint("-----------------------------------------------");
      debugPrint(allHotelsData!.data!.length.toString());
      debugPrint("-----------------------------------------------");

      emit(SuccessGetHotelsDataState());
    } on DioError catch (e) {
      if (e.response == null) {
        // showToastMessage(message: "Check you connection", toastColor: Colors.red);
      } else {
        debugPrint(e.response!.data);
        // showToastMessage(message: "${e.response!.data['message']}", toastColor: Colors.red);
      }
      emit(FailedGetHotelsDataState());
    }
  }


}
