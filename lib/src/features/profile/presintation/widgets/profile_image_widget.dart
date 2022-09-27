import 'package:booking_app/src/app/core/utils/mediaquery_managment.dart';
import 'package:booking_app/src/app/injector.dart';
import 'package:booking_app/src/features/auth/data/models/profile_info_model.dart';
import 'package:booking_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/src/features/auth/presentation/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImage extends StatelessWidget {
  final ProfileModel m;
  const ProfileImage({Key? key, required this.m}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => sl(),
      child: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) =>
              current is SuccessImageState ||
              current is ErrorImageState ||
              current is LoadingImageState,
          builder: (context, state) => Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    AuthCubit.get(context).image != null
                        ? CircleAvatar(
                            radius: MediaQueryManager.screenWidth * 0.125,
                            backgroundImage:
                                FileImage(AuthCubit.get(context).image!))
                        : CircleAvatar(
                            radius: MediaQueryManager.screenWidth * 0.125,
                            backgroundImage: NetworkImage(m.data!.imageUrl!),
                          ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Card(
                        color: Colors.blue.shade800,
                        shape: const CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: InkWell(
                            onTap: () async{
                              await AuthCubit.get(context).uploadImage();
                            },
                            child: Icon(Icons.camera_alt_rounded,
                                color: Colors.white, size: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
