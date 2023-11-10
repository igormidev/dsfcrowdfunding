
// import 'package:flutter/material.dart';

// class AboutPlayer extends StatelessWidget {
//   const AboutPlayer();

//   @override
//   Widget build(BuildContext context) {
//     return ref.read(sessionProvider).maybeWhen(
//           signedIn: (profile) {
//             return ProviderScope(
//               overrides: [
//                 userProvider
//                     .overrideWithProvider(myProviderFamily(profile.uuid)),
//                 postsProvider
//                     .overrideWithProvider(postsProviderFamily(profile.uuid)),
//               ],
//               child: Consumer(
//                 builder: (context, ref, child) {
//                   final posts = ref.watch(postsProvider);
//                   final othersPosts = posts.splitByCondition(
//                     (item) =>
//                         item.contentCategory !=
//                         ContentCategory.freestyle.name.capitalized,
//                   );

//                   if (othersPosts.items.isEmpty) {
//                     return const SizedBox();
//                   }

//                   return Column(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: Text(
//                           'O Atleta',
//                           style: TextStyle(
//                             fontFamily: 'Archivo',
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: _UserDisplay(),
//                       ),
//                       UserHighlights(
//                         posts: othersPosts.items,
//                         mine: false,
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             );
//           },
//           orElse: SizedBox.fromSize,
//         );
//   }
// }