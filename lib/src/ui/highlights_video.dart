import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

void openHighlightsVideo({
  required BuildContext context,
  required final Uri video,
  required final Key? keyForPlayer,
  required final String title,
  required final List<Widget> actions,
  required final String? postId,
  required final bool autoPlay,
}) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return Center(
        child: HighlightsVideo(
          video: video,
          title: title,
          subTitle: '',
          actions: actions,
          autoPlay: false,
          keyForPlayer: keyForPlayer,
          postId: postId,
        ),
      );
    },
  );
}

class HighlightsVideo extends StatelessWidget {
  const HighlightsVideo({
    super.key,
    required this.video,
    this.keyForPlayer,
    required this.title,
    required this.subTitle,
    required this.actions,
    this.postId,
    required this.autoPlay,
  });

  final Uri video;
  final Key? keyForPlayer;
  final String title;
  final String subTitle;
  final List<Widget> actions;
  final String? postId;
  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xff1E1D1D),
          ),
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DsfVideoPlayer.fromNetwork(
                    key: keyForPlayer,
                    networkVideo: video,
                    titleForAnalytics: title,
                    postIdForAnalytics: postId,
                    autoPlay: autoPlay,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (subTitle.isNotEmpty)
                      Text(
                        subTitle,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    const SizedBox(height: 14),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: actions,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class DsfVideoPlayer extends StatefulWidget {
  const DsfVideoPlayer.fromNetwork({
    super.key,
    required this.networkVideo,
    required this.titleForAnalytics,
    required this.postIdForAnalytics,
    this.autoPlay = true,
  });

  const DsfVideoPlayer.fromFile({
    super.key,
    required this.titleForAnalytics,
    required this.postIdForAnalytics,
    this.autoPlay = true,
  }) : networkVideo = null;

  @override
  State<StatefulWidget> createState() => DsfVideoPlayerState();

  final Uri? networkVideo;
  // TODO(Anonymous): ViewにAnalyticsのパラメータを持たせたくない
  final String titleForAnalytics;
  final String? postIdForAnalytics;
  final bool autoPlay;
}

class DsfVideoPlayerState extends State<DsfVideoPlayer> {
  ChewieController? _controller;
  VideoPlayerController? _videoPlayerController;
  bool isFinished = false;

  @override
  void initState() {
    super.initState();

    if (widget.networkVideo != null) {
      _videoPlayerController = VideoPlayerController.networkUrl(
        widget.networkVideo!,
      );
    }

    _videoPlayerController!.initialize().then((_) {
      setState(() {
        _controller = ChewieController(
          deviceOrientationsAfterFullScreen: [
            DeviceOrientation.portraitUp,
          ],
          videoPlayerController: _videoPlayerController!,
          autoPlay: widget.autoPlay,
          looping: true,
        );
      });
    });
    _videoPlayerController!.addListener(_finished);
  }

  void _finished() {
    if (_videoPlayerController!.value.position.inSeconds ==
            _videoPlayerController!.value.duration.inSeconds &&
        !isFinished) {
      isFinished = true;
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: _controller != null
          ? VisibilityDetector(
              key: const ValueKey('video-player'),
              onVisibilityChanged: (VisibilityInfo info) {
                if (info.visibleFraction == 0 && !_controller!.isFullScreen) {
                  _videoPlayerController?.pause();
                }
              },
              child: Chewie(controller: _controller!),
            )
          : const SizedBox(),
    );
  }

  void pause() {
    _controller?.pause();
  }
}
