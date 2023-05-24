import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_statistic/generated/locale_keys.g.dart';
import 'package:spotify_statistic/styles/colors.dart';

import '../../../styles/dimens.dart';
import '../cubit/login_screen_cubit.dart';

class LoginScreenForm extends StatelessWidget {
  const LoginScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo-no-background.png',
                  scale: 5,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: SpotifyColors.white,
                    backgroundColor: SpotifyColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.circular),
                    ),
                  ),
                  onPressed: () =>
                      BlocProvider.of<LoginScreenCubit>(context).login(),
                  child: Container(
                    padding: const EdgeInsets.all(Dimens.spanMedium),
                    child: Text(
                      LocaleKeys.login.tr(),
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
