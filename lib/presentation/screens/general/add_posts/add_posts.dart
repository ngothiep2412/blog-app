part of 'add_posts_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  late AddPostsViewModel addPostsViewModel;

  @override
  void initState() {
    addPostsViewModel =
        AddPostsViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  void dispose() {
    addPostsViewModel.controller.dispose();
    addPostsViewModel.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        title: "Add Posts".text.white.make(),
        actions: [
          BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
            bloc: addPostsViewModel.isLoadingBloc,
            builder: (context, state) {
              return IconButton(
                onPressed: () => addPostsViewModel.addPost(
                  context,
                  context
                      .read<VelocityBloc<ProfileModel>>()
                      .state
                      .data
                      .userDetails!
                      .id
                      .toString(),
                ),
                icon: state.data == true
                    ? const CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.white,
                      )
                    : const Icon(
                        FeatherIcons.check,
                      ),
              );
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          20.h.heightBox,
          BlocBuilder<VelocityBloc<XFile?>, VelocityState<XFile?>>(
              bloc: addPostsViewModel.selectedImageBloc,
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    state.data != null
                        ? Image.file(
                            File(state.data!.path),
                            height: 250.h,
                            width: 1.sw,
                            fit: BoxFit.cover,
                          ).cornerRadius(20.r)
                        : Image.asset(
                            MyAssets.assetsImagesNetflix,
                          ).cornerRadius(20.r),
                    IconButton(
                      onPressed: () => addPostsViewModel.pickImage(context),
                      icon: Icon(
                        FeatherIcons.camera,
                        color: MyColors.primaryColor,
                      ),
                    )
                  ],
                );
              }),
          10.h.heightBox,
          VxTextField(
            fillColor: Colors.transparent,
            borderColor: MyColors.primaryColor,
            borderType: VxTextFieldBorderType.roundLine,
            borderRadius: 10.r,
            hint: "Title",
            controller: addPostsViewModel.textEditingController,
          ),
          20.h.heightBox,
          VxTextField(
            fillColor: Colors.transparent,
            borderColor: MyColors.primaryColor,
            borderType: VxTextFieldBorderType.roundLine,
            borderRadius: 10.r,
            hint: "Slug",
            controller: addPostsViewModel.textEditingController,
          ),
          20.h.heightBox,
          BlocBuilder<VelocityBloc<Tag?>, VelocityState<Tag?>>(
              bloc: addPostsViewModel.selectedTagBloc,
              builder: (context, state) {
                return InkWell(
                  onTap: () async {
                    var data = await AutoRouter.of(context).push<Tag>(
                        TagsRoute(navigationType: NavigationType.inner));

                    if (data != null) {
                      log(data.title.toString());
                      addPostsViewModel.selectedTagBloc.onUpdateData(data);
                    }
                  },
                  child: Container(
                    height: 60.h,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        state.data != null
                            ? state.data!.title!.text.black.make()
                            : "Tags".text.black.make(),
                        const Icon(
                          FeatherIcons.chevronRight,
                        )
                      ],
                    ),
                  ),
                );
              }),
          20.h.heightBox,
          BlocBuilder<VelocityBloc<Category?>, VelocityState<Category?>>(
              bloc: addPostsViewModel.selectedCategoriesBloc,
              builder: (context, state) {
                return InkWell(
                  onTap: () async {
                    var data = await AutoRouter.of(context).push<Category>(
                        CategoriesRoute(navigationType: NavigationType.inner));

                    if (data != null) {
                      log(data.title.toString());
                      addPostsViewModel.selectedCategoriesBloc
                          .onUpdateData(data);
                    }
                  },
                  child: Container(
                    height: 60.h,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        state.data != null
                            ? state.data!.title!.text.black.make()
                            : "Categories".text.black.make(),
                        const Icon(
                          FeatherIcons.chevronRight,
                        )
                      ],
                    ),
                  ),
                );
              }),
          20.h.heightBox,
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              controller: addPostsViewModel.controller,
              sharedConfigurations: QuillSharedConfigurations(
                locale: I18n.locale,
              ),
            ),
          ),
          SizedBox(
            height: 500.h,
            child: QuillEditor.basic(
              configurations: QuillEditorConfigurations(
                controller: addPostsViewModel.controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
