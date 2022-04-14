import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:provider/provider.dart';
import '../../../utility/flick_multi_manager.dart';
import '../../../utility/global.dart';
import '../../../utility/shared_preferences.dart';

class FeedPlayerPortraitControls extends StatelessWidget {
  const FeedPlayerPortraitControls(
      {Key? key, this.flickMultiManager, this.flickManager,this.listLength,this.indexPage})
      : super(key: key);

  final FlickMultiManager? flickMultiManager;
  final FlickManager? flickManager;
  final int? listLength;
  final int? indexPage;

  @override
  Widget build(BuildContext context) {
    FlickDisplayManager displayManager = Provider.of<FlickDisplayManager>(context);
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FlickAutoHideChild(
            showIfVideoNotInitialized: false,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FlickLeftDuration(),
              ),
            ),
          ),
          Expanded(
            child: FlickToggleSoundAction(
              toggleMute: () {
                flickMultiManager?.toggleMute();
                displayManager.handleShowPlayerControls();
              },
              child: FlickSeekVideoAction(
                child: Center(child: FlickVideoBuffer()),
              ),
            ),
          ),
          FlickAutoHideChild(
            autoHide: true,
            showIfVideoNotInitialized: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FlickSoundToggle(
                    toggleMute: () => flickMultiManager?.toggleMute(),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FlickAutoHideChild(
                    autoHide: false,
                    showIfVideoNotInitialized: false,
                    child: FlickFullScreenToggle(),
                  ),
                ),
                // FlickFullScreenToggle(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
