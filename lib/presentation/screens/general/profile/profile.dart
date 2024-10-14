part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.logOut).pOnly(right: 10.w),
          )
        ],
      ),
      body: ListView(
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
                    radius: 100.r,
                    backgroundImage: const AssetImage(
                      MyAssets.assetsImagesAuthBg,
                    ),
                  ),
                  10.h.heightBox,
                  "Thiep".text.bold.xl2.make(),
                  "admin@admin.com".text.xl.white.make(),
                  20.h.heightBox,
                  "Thiep is a mobile developer who is more passionate about technology. His ambition towards technology is huge."
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
                          "6".text.white.bold.xl3.make(),
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
                GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 13,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(MyAssets.assetsImagesNetflix)
                            .cornerRadius(10.r),
                        6.h.heightBox,
                        Row(
                          children: [
                            "Netflix Will Charge Money for Password Sharing"
                                .text
                                .medium
                                .make()
                                .expand(),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
