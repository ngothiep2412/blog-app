part of 'add_posts_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        automaticallyImplyLeading: false,
        title: "Add Posts".text.make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.check,
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          20.h.heightBox,
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.asset(
                MyAssets.assetsImagesNetflix,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FeatherIcons.camera,
                  color: MyColors.primaryColor,
                ),
              )
            ],
          ),
          10.h.heightBox,
          VxTextField(
            fillColor: Colors.transparent,
            borderColor: MyColors.primaryColor,
            borderType: VxTextFieldBorderType.roundLine,
            borderRadius: 10.r,
            hint: "Title",
          ),
          20.h.heightBox,
          VxTextField(
            fillColor: Colors.transparent,
            borderColor: MyColors.primaryColor,
            borderType: VxTextFieldBorderType.roundLine,
            borderRadius: 10.r,
            hint: "Slug",
          ),
          20.h.heightBox,
          Container(
            height: 60.h,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Tags".text.black.make(),
                const Icon(
                  FeatherIcons.chevronRight,
                )
              ],
            ),
          ),
          20.h.heightBox,
          Container(
            height: 60.h,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Categories".text.make(),
                const Icon(
                  FeatherIcons.chevronRight,
                )
              ],
            ),
          ),
          20.h.heightBox,
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              controller: _controller,
              sharedConfigurations: const QuillSharedConfigurations(),
            ),
          ),
          SizedBox(
            height: 500.h,
            child: QuillEditor.basic(
              configurations: QuillEditorConfigurations(
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
