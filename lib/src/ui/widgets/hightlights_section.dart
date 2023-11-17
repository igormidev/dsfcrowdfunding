import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dsfcrowdfunding/src/controllers/hightlights_post_controller.dart';
import 'package:dsfcrowdfunding/src/helpers/formaters.dart';
import 'package:dsfcrowdfunding/src/models/user_post.dart';
import 'package:dsfcrowdfunding/src/theme/shared_widgets/box.dart';
import 'package:dsfcrowdfunding/src/ui/highlights_video.dart';
import 'package:image_network/image_network.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HightlightsSection extends StatelessWidget {
  const HightlightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<HightlightsPostController>();

    return FutureBuilder(
      future: controller.getHighlightsPosts(
        '1c1d78db-c9b7-422f-9000-bf60ba764b01',
      ),
      builder: (context, snapshot) {
        final isDone = snapshot.connectionState == ConnectionState.done;

        if (isDone) {
          final hasError = snapshot.hasError;
          if (hasError || controller.userPosts?.isNotEmpty != true) {
            return const SizedBox(
              height: 220,
              width: 320,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 42,
                      color: Color(0xffFF4A01),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Erro ao carregar os destaques',
                      style: TextStyle(
                        fontFamily: 'MangoGrotesque',
                        fontSize: 42,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return UserHighlights(
            posts: controller.userPosts ?? [],
            mine: false,
          );
        } else {
          return const SizedBox(
            height: 220,
            width: 320,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class UserHighlights extends StatelessWidget {
  const UserHighlights({
    super.key,
    required this.posts,
    required this.mine,
  });

  final List<UserPost> posts;
  final bool mine;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Box(
      space: 12,
      // TODO: Translate
      // title: S.of(context).highlights.capitalized,
      title: 'Highlights',
      child: SizedBox(
        height: 220,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: posts.length + 2,
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0 || index == posts.length + 1) {
              return const SizedBox(width: 16);
            }

            final UserPost post = posts[index - 1];
            final image = post.thumb.toString();
            return AspectRatio(
              aspectRatio: 16 / 11,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(child: LayoutBuilder(
                              builder: (context, box) {
                                final width = box.maxWidth;
                                final height = box.maxHeight;
                                return ImageNetwork(
                                  image: image,
                                  width: width,
                                  height: height,
                                  fitAndroidIos: BoxFit.cover,
                                  fitWeb: BoxFitWeb.cover,
                                  // borderRadius: BorderRadius.circular(60),
                                  onLoading: const CircularProgressIndicator
                                      .adaptive(),
                                );
                              },
                            )),
                            Positioned.fill(
                              top: 60,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    end: Alignment.bottomCenter,
                                    begin: Alignment.topCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withAlpha(100),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 7,
                              left: 12,
                              child: UserPostCounters(
                                numComments: post.numComments,
                                numLikes: post.numLikes,
                                spacing: 12,
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  final postId = post.id;
                                  openHighlightsVideo(
                                    context: context,
                                    video: post.video,
                                    keyForPlayer: ValueKey(postId),
                                    title: post.title,
                                    actions: [],
                                    postId: postId,
                                    autoPlay: true,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 2,
                    child: Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        post.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class UserPostCounters extends StatelessWidget {
  const UserPostCounters({
    super.key,
    required this.numLikes,
    required this.numComments,
    this.spacing,
  });

  final int numLikes;
  final int numComments;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconTheme(
      data: IconThemeData(
        size: 14,
        color: theme.iconTheme.color,
      ),
      child: DefaultTextStyle(
        style: theme.textTheme.bodySmall!.copyWith(
          color: theme.iconTheme.color,
          fontSize: 11,
        ),
        child: Row(
          mainAxisAlignment: spacing != null
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceAround,
          children: [
            if (spacing != null) SizedBox(width: spacing),
            _buildCounter(
              icon: SvgPicture.asset('assets/images/like_icon.svg'),
              counter: numLikes,
            ),
            if (spacing != null) SizedBox(width: spacing),
            _buildCounter(
              icon: SvgPicture.asset('assets/images/comment_icon.svg'),
              counter: numComments,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounter({
    required Widget icon,
    required int counter,
  }) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 2),
        Text(clipToFourDigits(counter)),
      ],
    );
  }
}
