import 'package:bloc/bloc.dart';
import 'package:booking_app/src/app/config/routes/routes.dart';
import 'package:booking_app/src/features/explore_hotels/presentation/screens/explore_screen.dart';
import 'package:booking_app/src/features/home/presentation/views/profile/description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int index = 0;
  List<Widget> screens =
      List<Widget>.from([(ExploreScreen()), ExploreScreen(), ProfileScreen()]);
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
}
