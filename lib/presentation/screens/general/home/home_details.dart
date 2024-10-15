part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  const HomeDetails({
    super.key,
    required this.post,
    required this.imagePath,
  });

  final Post post;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: post.title!.text.ellipsis.make(),
      ),
      body: ListView(
        children: [
          Hero(
            tag: Key(post.id!.toString()),
            child: CachedImageWidget(
              imgUrl: imagePath,
              // imgWidth: 180.w,
              // imgHeight: 120.h,
              boxFit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                10.h.heightBox,
                post.title!.text.bold.xl2.make(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(FeatherIcons.eye),
                    8.w.widthBox,
                    "${post.views} Views".text.make(),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsUp,
                        color: Colors.green,
                      ),
                    ),
                    "${post.like ?? 0}".text.make(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsDown,
                        color: Colors.red,
                      ),
                    ),
                    post.like ?? 0.text.make(),
                  ],
                ),
                HtmlWidget(
                  post.body!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
