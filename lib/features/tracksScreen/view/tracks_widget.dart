import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_statistic/core/widgets/koin_page.dart';
import 'package:spotify_statistic/features/widgets/second_button_widget.dart';
import 'package:spotify_statistic/features/widgets/card_item.dart';
import 'package:spotify_statistic/generated/locale_keys.g.dart';
import 'package:spotify_statistic/styles/colors.dart';

import '../../../data/models/time_interval.dart';
import '../../../styles/dimens.dart';
import '../cubit/tracks_cubit.dart';

class TracksWidget extends KoinPage<TracksCubit> {
  const TracksWidget({Key? key}) : super(key: key);

  @override
  void initBloc(bloc) => bloc.init();

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<TracksCubit, TracksState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimens.spanBig),
              child: Text(LocaleKeys.yourTopTracks.tr(),
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SecondButtonWidget(
                    text: LocaleKeys.last4Weeks.tr(),
                    onPressed: () => context
                        .read<TracksCubit>()
                        .changeTimeInterval(TimeInterval.last4Weeks),
                    isActive: state.timeInterval == TimeInterval.last4Weeks),
                SecondButtonWidget(
                    text: LocaleKeys.last6Months.tr(),
                    onPressed: () => context
                        .read<TracksCubit>()
                        .changeTimeInterval(TimeInterval.last6Months),
                    isActive: state.timeInterval == TimeInterval.last6Months),
                SecondButtonWidget(
                    text: LocaleKeys.allTime.tr(),
                    onPressed: () => context
                        .read<TracksCubit>()
                        .changeTimeInterval(TimeInterval.allTime),
                    isActive: state.timeInterval == TimeInterval.allTime),
              ],
            ),
            Expanded(
              child: BlocBuilder<TracksCubit, TracksState>(
                builder: (context, state) {
                  if (state is TracksLoadedState) {
                    return GridView.count(
                        crossAxisCount: 2,
                        children: [...listOfTracks(state, context)]);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: SpotifyColors.primaryColor,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        )),
      );
    });
  }

  List<Widget> listOfTracks(TracksLoadedState state, BuildContext context) {
    List<Widget> widgets = [];
    int index = 1;
    for (var track in state.tracks) {
      widgets.add(CardItem(
        index: index,
        image: track.image,
        name: track.name,
      ));
      index++;
    }
    return widgets;
  }
}
