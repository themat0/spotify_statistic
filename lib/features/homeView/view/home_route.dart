import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify_statistic/core/widgets/koin_page.dart';
import 'package:spotify_statistic/features/artistsScreen/view/artists_widget.dart';
import 'package:spotify_statistic/features/homeView/bloc/home_bloc.dart';
import 'package:spotify_statistic/features/loginScreen/view/login_screen_route.dart';
import 'package:spotify_statistic/features/profileScreen/view/profile_widget.dart';
import 'package:spotify_statistic/features/tracksScreen/view/tracks_widget.dart';
import 'package:spotify_statistic/generated/locale_keys.g.dart';
import 'package:spotify_statistic/styles/colors.dart';

class HomeRoute extends KoinPage<HomeBloc> {
  const HomeRoute({super.key});

  // ignore: constant_identifier_names
  static const ROUTE_NAME = 'homeRoute';

  void _onItemTapped(int index, BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(HomeChangeMenuEvent(index));
  }

  Widget _pageNavigation(HomeState state) => [
        const ArtistsWidget(),
        const TracksWidget(),
        const ProfileWidget(),
      ].elementAt(state.index);

  @override
  Widget buildPage(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeForceLogoutState) {
          Navigator.of(context).pushReplacementNamed(LoginScreenRoute.ROUTE_NAME);
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: SpotifyColors.secondaryColor,
            selectedItemColor: SpotifyColors.primaryColor,
            iconSize: 30,
            currentIndex: state.index,
            onTap: (index) => _onItemTapped(index, context),
            items: [
              BottomNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.compactDisc),
                label: LocaleKeys.artists.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.music),
                label: LocaleKeys.tracks.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.user),
                label: LocaleKeys.profile.tr(),
              ),
            ],
          ),
          body: _pageNavigation(state),
        );
      },
    );
  }
}
