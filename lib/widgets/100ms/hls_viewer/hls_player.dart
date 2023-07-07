import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
//Project imports
import 'package:healthcaredoctor2050/widgets/100ms/meeting/meeting_store.dart';

import '../../../Utils/colors/colors.dart';
import 'hls_stats_view.dart';
import 'hms_hls_player.dart';
import 'hms_hls_player_controller.dart';

// class HLSPlayer extends StatefulWidget {
//   HLSPlayer({Key? key}) : super(key: key);
//
//   @override
//   _HLSPlayerState createState() => _HLSPlayerState();
// }
//
// class _HLSPlayerState extends State<HLSPlayer> with TickerProviderStateMixin {
//   late AnimationController animation;
//   late Animation<double> fadeInFadeOut;
//
//   @override
//   void initState() {
//     super.initState();
//     animation = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );
//     fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);
//
//     context
//         .read<MeetingStore>()
//         .setPIPVideoController(false, aspectRatio: 16 / 9);
//     animation.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Selector<MeetingStore, PipFlutterPlayerController?>(
//         selector: (_, meetingStore) => meetingStore.hlsVideoController,
//         builder: (_, controller, __) {
//           if (controller == null) {
//             return Scaffold();
//           }
//           return Scaffold(
//               key: GlobalKey(),
//               body: Stack(
//                 children: [
//                   Center(
//                       child: FadeTransition(
//                     opacity: fadeInFadeOut,
//                     child: AspectRatio(
//                       aspectRatio: context.read<MeetingStore>().hlsAspectRatio,
//                       child: PipFlutterPlayer(
//                         controller: controller,
//                         key: context.read<MeetingStore>().pipFlutterPlayerKey,
//                       ),
//                     ),
//                   )),
//                   if (!context.read<MeetingStore>().isPipActive)
//                     Positioned(
//                       bottom: 10,
//                       right: 20,
//                       child: GestureDetector(
//                         onTap: () {
//                           animation.reverse();
//                           context
//                               .read<MeetingStore>()
//                               .setPIPVideoController(true);
//                           animation.forward();
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(5),
//                           child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.circle,
//                                   color: Colors.red,
//                                   size: 15,
//                                 ),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   "Go Live",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ]),
//                         ),
//                       ),
//                     )
//                 ],
//               ));
//         });
//   }
// }

class HLSPlayer extends StatefulWidget {
  final double? ratio;
  HLSPlayer({Key? key, this.ratio}) : super(key: key);
  @override
  _HLSPlayerState createState() => _HLSPlayerState();
}

class _HLSPlayerState extends State<HLSPlayer> with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> fadeInFadeOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: GlobalKey(),
        body: Stack(
          children: [
            Center(
                child: Selector<MeetingStore, double>(
                    selector: (_, meetingStore) => meetingStore.hlsAspectRatio,
                    builder: (_, ratio, __) {
                      return AspectRatio(
                        aspectRatio: ratio,
                        child: HMSHLSPlayer(
                          showPlayerControls: true,
                          isHLSStatsRequired:
                          context.read<MeetingStore>().isHLSStatsEnabled,
                        ),
                      );
                    })),
            Selector<MeetingStore, bool>(
                selector: (_, meetingStore) => meetingStore.isHLSStatsEnabled,
                builder: (_, isHLSStatsEnabled, __) {
                  return isHLSStatsEnabled
                      ? Align(
                    alignment: Alignment.topLeft,
                    child: ChangeNotifierProvider.value(
                      value: context.read<MeetingStore>(),
                      child: HLSStatsView(),
                    ),
                  )
                      : Container();
                }),
            if (!context.read<MeetingStore>().isPipActive)
              Positioned(
                bottom: 10,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    HMSHLSPlayerController.seekToLivePosition();
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Go Live",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  var _meetingStore = context.read<MeetingStore>();
                  if (_meetingStore.isLandscapeLocked) {
                    _meetingStore.setLandscapeLock(false);
                    if (_meetingStore.isDefaultAspectRatioSelected) {
                      _meetingStore.setAspectRatio(9 / 16);
                    }
                  } else {
                    _meetingStore.setLandscapeLock(true);
                    if (_meetingStore.isDefaultAspectRatioSelected) {
                      _meetingStore.setAspectRatio(16 / 9);
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/rotate.svg",
                    color: iconColor,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
