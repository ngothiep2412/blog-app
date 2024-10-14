part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Image.asset(MyAssets.assetsImagesNetflix).cornerRadius(20.r),
              20.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Latest Posts".text.make(),
                  "See All".text.make(),
                ],
              ),
              20.h.heightBox,
              ListView.separated(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20.h,
                      ),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => AutoRouter.of(context).push(
                            const HomeDetailsRoute(),
                          ),
                          child: Image.asset(
                            MyAssets.assetsImagesNetflix,
                            width: 180.w,
                            height: 120.h,
                            fit: BoxFit.cover,
                          ).cornerRadius(20.r),
                        ),
                        10.w.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Netflix Will Charge Money for Password Sharing"
                                .text
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
                                "6 Months ago".text.make(),
                              ],
                            ),
                            6.h.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "59 Views".text.make(),
                                const Icon(
                                  FeatherIcons.bookmark,
                                ),
                              ],
                            ),
                            6.h.heightBox,
                          ],
                        ).expand()
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
