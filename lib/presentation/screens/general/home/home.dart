part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    homeViewModel = HomeViewModel(repository: context.read<Repository>());
    homeViewModel.fetchAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<VelocityBloc<HomeModel>, VelocityState<HomeModel>>(
          bloc: homeViewModel.postsBloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is VelocityUpdateState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Hello %s"
                            .i18n
                            .fill(
                              [
                                '${context.read<VelocityBloc<ProfileModel>>().state.data.userDetails!.name}'
                              ],
                            )
                            .text
                            .bold
                            .xl
                            .make(),
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                //  context
                                //     .read<VelocityBloc<ProfileModel>>()
                                //     .state
                                //     .data
                                //     .userDetails!
                                //     .profilePhotoUrl
                                // .toString(),
                                "https://static.wikia.nocookie.net/bach-khoa-the-gioi-toan-thu/images/e/e4/Son_goku.png/revision/latest?cb=20211030082932",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).pSymmetric(h: 16.h),
                    40.verticalSpace,
                    VxSwiper.builder(
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      itemCount: state.data.popularPosts!.length,
                      itemBuilder: (context, index) {
                        var latestPosts = state.data.allPosts![index];
                        var imagePath = latestPosts.featuredimage
                            .toString()
                            .replaceAll('public', 'storage');
                        return CachedImageWidget(
                          imgUrl: imagePath,
                          imgWidth: 500.w,
                          boxFit: BoxFit.cover,
                        ).cornerRadius(20.r).pSymmetric(h: 10.w);
                      },
                    ),
                    20.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Latest Posts".text.make(),
                        "See All".text.make(),
                      ],
                    ).pSymmetric(h: 24.w),
                    20.h.heightBox,
                    ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      itemCount: state.data.allPosts!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20.h,
                      ),
                      itemBuilder: (context, index) {
                        var latestPosts = state.data.allPosts![index];
                        var imagePath = latestPosts.featuredimage
                            .toString()
                            // .prepend('https://techblog.codersangam.com/')
                            .replaceAll("public", "storage");
                        return FadedScaleAnimation(
                          fadeCurve: Curves.easeInCubic,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => AutoRouter.of(context).push(
                                  HomeDetailsRoute(
                                      post: latestPosts, imagePath: imagePath),
                                ),
                                child: Hero(
                                  tag: Key(latestPosts.id!.toString()),
                                  child: CachedImageWidget(
                                    imgUrl: imagePath,
                                    imgWidth: 180.w,
                                    imgHeight: 120.h,
                                    boxFit: BoxFit.cover,
                                  ).cornerRadius(20.r),
                                ),
                              ),
                              10.w.widthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  latestPosts.title!.text
                                      .size(16.sp)
                                      .maxLines(2)
                                      .bold
                                      .make(),
                                  6.h.heightBox,
                                  Row(
                                    children: [
                                      const Icon(
                                        FeatherIcons.clock,
                                      ),
                                      8.horizontalSpace,
                                      latestPosts.createdAt!
                                          .timeAgo()
                                          .toString()
                                          .text
                                          .ellipsis
                                          .maxLines(2)
                                          .make()
                                          .expand(),
                                    ],
                                  ),
                                  6.h.heightBox,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      "${latestPosts.views} Views".text.make(),
                                      const Icon(
                                        FeatherIcons.bookmark,
                                      ),
                                    ],
                                  ),
                                  6.h.heightBox,
                                ],
                              ).expand()
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
