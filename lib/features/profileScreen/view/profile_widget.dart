import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_statistic/core/widgets/koin_page.dart';
import 'package:spotify_statistic/features/loginScreen/view/login_screen_route.dart';
import 'package:spotify_statistic/features/profileScreen/cubit/profile_cubit.dart';
import 'package:spotify_statistic/generated/locale_keys.g.dart';
import 'package:spotify_statistic/styles/colors.dart';
import 'package:spotify_statistic/styles/dimensions.dart';

class ProfileWidget extends KoinPage<ProfileCubit> {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  void initBloc(ProfileCubit bloc) {
    bloc.init();
    super.initBloc(bloc);
  }

  @override
  Widget buildPage(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLogoutSuccess) {
              Navigator.of(context).pushReplacementNamed(LoginScreenRoute.ROUTE_NAME);
            }
          },
          buildWhen: (previous, current) => previous is ProfileInitial && current is ProfileLoaded,
          builder: (context, state) => state is ProfileLoaded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.circular)),
                      color: SpotifyColors.black,
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(Dimensions.circular),
                                child: Image(
                                  image: NetworkImage(state.user.image),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: Dimensions.spanMedium,
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                state.user.name,
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: SpotifyColors.red),
                      onPressed: () {
                        context.read<ProfileCubit>().logout();
                      },
                      child: Text(
                        LocaleKeys.logout.tr(),
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
