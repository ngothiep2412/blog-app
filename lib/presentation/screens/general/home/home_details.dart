part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: "Netflix Will Charge Money for Password Sharing"
            .text
            .ellipsis
            .make(),
      ),
      body: ListView(
        children: [
          Image.asset(
            MyAssets.assetsImagesNetflix,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                10.h.heightBox,
                "Netflix Will Charge Money for Password Sharing"
                    .text
                    .bold
                    .xl2
                    .make(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(FeatherIcons.eye),
                    8.w.widthBox,
                    "147 Views".text.make(),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsUp,
                        color: Colors.green,
                      ),
                    ),
                    "0".text.make(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsDown,
                        color: Colors.red,
                      ),
                    ),
                    "0".text.make(),
                  ],
                ),
                "For years, Netflix allowed its users to share their accounts across multiple devices, regardless of location. This flexibility was a selling point for many, making it easy for family members or friends to access content without needing to purchase separate subscriptions. It became common practice for people to share their Netflix login details with others, even if they didn’t live together. However, Netflix has always stated in its terms of service that an account should be shared only by individuals living in the same household. Over time, password sharing became widespread, with people sharing accounts across different cities, countries, or even continents. This trend led to a significant number of users accessing Netflix without actually paying for it, putting pressure on the company’s ability to generate revenue from its growing user base."
                    .text
                    .make(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
