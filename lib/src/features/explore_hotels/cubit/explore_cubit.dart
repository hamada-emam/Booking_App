import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/app/core/helpers/api_helpert.dart';
import 'package:booking_app/src/features/explore_hotels/cubit/explore_states.dart';
import 'package:booking_app/src/features/explore_hotels/data/models/hotels_data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreCubit extends Cubit<ExploreStates> {
  ExploreCubit() : super(InitExploreState());

  static ExploreCubit get(context) => BlocProvider.of(context);

  bool isMapScreen = false;

  void changeScreen() {
    isMapScreen = !isMapScreen;
    emit(ExploreScreenChangedState());
  }

  AllHotelsData? allHotelsData;

  Future<void> getAllHotels({String? token}) async {
    try {
      Response value = await ApiHelper.getData(
        url: '/api/hotels/',
        token: token,
      );
      // showToastMessage(message: "${value.data['message']}");
      allHotelsData = AllHotelsData.fromJson(value.data);
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

  DateTimeRange? dateRange;

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(days: 1)),
    );
    dateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: mainAppColor,
            colorScheme: ColorScheme.light(primary: mainAppColor),
            buttonTheme: const ButtonThemeData(
                textTheme: ButtonTextTheme.primary
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 150, horizontal: 30),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    emit(DateRangePickedState());
  }
}
