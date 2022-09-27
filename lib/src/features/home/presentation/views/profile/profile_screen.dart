import 'package:booking_app/src/app/config/routes/routes.dart';
import 'package:booking_app/src/app/core/components/loaders/simple_loader.dart';
import 'package:booking_app/src/app/injector.dart';
import 'package:booking_app/src/features/auth/data/models/profile_info_model.dart';
import 'package:booking_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/src/features/auth/presentation/cubit/states.dart';
import 'package:booking_app/src/features/home/presentation/widgets/profile_widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/core/utils/text_styles_manager.dart';
import '../../widgets/profile_widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => sl<AuthCubit>()..userProfile(),
      child: SafeArea(
        child: Scaffold(
            body: Column(
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is LoadingAuthState) return const SimpleLoader();
                if (state is ErrorAuthState) {
                  return const Icon(Icons.wifi_off_sharp);
                } else {
                  ProfileModel profile = AuthCubit.get(context).profileModel!;
                  return ProfileHeader(
                      image: profile.data!.imageUrl!, name: profile.data!.name);
                }
              },
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is LoadingAuthState) return const SimpleLoader();
                if (state is ErrorAuthState) {
                  return const Icon(Icons.wifi_off_sharp);
                } else {
                  ProfileModel profile = AuthCubit.get(context).profileModel!;
                  return Column(
                    children: [
                      ProfileItem(
                        title: "Change Password",
                        icon: Icons.lock,
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.changePassword),
                      ),
                  
                      ProfileItem(
                        title: "Invite Friend",
                        icon: Icons.group,
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.invitefriend),
                      ),
                  
                      ProfileItem(
                        title: "Crdit & Copons",
                        icon: Icons.card_giftcard,
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.invitefriend),
                      ),
                  
                      ProfileItem(
                        title: "Help Center",
                        icon: Icons.info,
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.helpcenter),
                      ),
                  
                      ProfileItem(
                        title: "Payment",
                        icon: Icons.payment,
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.payment),
                      ),
                  
                      ProfileItem(
                        title: "Settings",
                        icon: Icons.settings,
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.settings),
                      ),
                  
                    ],
                  );
                }
              },
            )
          ],
        )),
      ),
    );
  }
}
