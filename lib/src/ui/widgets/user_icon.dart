import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_network/image_network.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({
    super.key,
    this.icon,
    this.radius = 50,
    this.doesBorderHasPadding = false,
  });

  final Uri? icon;
  final double radius;
  final bool doesBorderHasPadding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        if (doesBorderHasPadding) ...{
          Container(
            width: radius * 0.73,
            height: radius * 0.73,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Theme.of(context).disabledColor,
              ),
            ),
          ),
        } else ...{
          SizedBox(
            width: radius * 0.63,
            height: radius * 0.63,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: ColoredBox(color: Theme.of(context).disabledColor),
            ),
          ),
        },
        Builder(
          builder: (context) {
            if (icon?.scheme.startsWith('http') ?? false) {
              if (kIsWeb) {
                return SizedBox(
                  width: radius * 1,
                  height: radius * 1,
                  child: ImageNetwork(
                    image:
                        'https://cdn.pixabay.com/photo/2021/06/04/10/29/man-6309454_1280.jpg',
                    width: radius * 1,
                    height: radius * 1,
                    fitAndroidIos: BoxFit.cover,
                    fitWeb: BoxFitWeb.cover,
                    borderRadius: BorderRadius.circular(60),
                    onLoading: const CircularProgressIndicator.adaptive(),
                  ),
                );
              }
              return CachedNetworkImage(
                imageUrl: icon.toString(),
                imageBuilder: (context, image) => Container(
                  width: radius * 0.6,
                  height: radius * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => SizedBox(
                  height: radius * 0.6,
                  width: radius * 0.6,
                  child: const CircularProgressIndicator(),
                ),
                errorWidget: (context, url, dynamic error) {
                  return _defaultImage;
                },
              );
            } else {
              return _defaultImage;
            }
          },
        ),
      ],
    );
  }

  Widget get _defaultImage => SizedBox(
        width: radius * 0.6,
        height: radius * 0.6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SvgPicture.asset('assets/images/profile_default.svg'),
        ),
      );
}
