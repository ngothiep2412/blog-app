part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    profileViewModel = ProfileViewModel(repository: context.read<Repository>());
    profileViewModel.getUserProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => profileViewModel.logout(context),
            icon: const Icon(
              FeatherIcons.logOut,
              color: Colors.white,
            ).pOnly(right: 10.w),
          )
        ],
      ),
      body:
          BlocBuilder<VelocityBloc<ProfileModel>, VelocityState<ProfileModel>>(
        bloc: profileViewModel.profileModelBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is VelocityUpdateState) {
            return RefreshIndicator.adaptive(
              onRefresh: () => profileViewModel.getUserProfileData(),
              child: ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500.h,
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 70.r,
                            backgroundImage: const NetworkImage(
                              // state.data.userDetails!.profilePhotoUrl
                              //     .toString(),
                              "https://static.wikia.nocookie.net/bach-khoa-the-gioi-toan-thu/images/e/e4/Son_goku.png/revision/latest?cb=20211030082932",
                            ),
                          ),
                          10.h.heightBox,
                          state.data.userDetails!.name
                              .toString()
                              .text
                              .bold
                              .xl2
                              .make(),
                          20.h.heightBox,
                          state.data.userDetails!.email
                              .toString()
                              .text
                              .xl
                              .white
                              .make(),
                          20.h.heightBox,
                          state.data.userDetails!.about == null
                              ? "N/A"
                                  .text
                                  .xl
                                  .center
                                  .white
                                  .make()
                                  .pSymmetric(h: 20.w)
                              : state.data.userDetails!.about
                                  .toString()
                                  .text
                                  .xl
                                  .center
                                  .white
                                  .make()
                                  .pSymmetric(h: 20.w),
                          20.h.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  state.data.postsCount
                                      .toString()
                                      .text
                                      .white
                                      .bold
                                      .xl3
                                      .make(),
                                  "Posts".text.white.xl.make(),
                                ],
                              ),
                              Column(
                                children: [
                                  "0".text.white.bold.xl3.make(),
                                  "Following".text.white.xl.make(),
                                ],
                              ),
                              Column(
                                children: [
                                  "0".text.white.bold.xl3.make(),
                                  "Follower".text.white.xl.make(),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  20.h.heightBox,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "My Posts".text.xl3.bold.make(),
                        10.h.heightBox,
                        FadedScaleAnimation(
                          child: GridView.builder(
                            itemCount: state.data.posts!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 13,
                              childAspectRatio: 0.9,
                            ),
                            itemBuilder: (context, index) {
                              var myPost = state.data.posts![index];
                              var imagePath = myPost.featuredimage
                                  .toString()
                                  .replaceAll('public', 'storage');
                              return Column(
                                children: [
                                  CachedImageWidget(imgUrl: imagePath)
                                      .cornerRadius(10.r),
                                  6.h.heightBox,
                                  Row(
                                    children: [
                                      myPost.title!.text.medium.make().expand(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          FeatherIcons.moreVertical,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
