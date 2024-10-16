part of 'add_posts_imports.dart';

class AddPostsViewModel {
  final Repository repository;

  AddPostsViewModel({required this.repository});

  final ImagePicker picker = ImagePicker();

  final VelocityBloc<XFile?> selectedImageBloc = VelocityBloc<XFile?>(null);

  final VelocityBloc<Tag?> selectedTagBloc = VelocityBloc<Tag?>(null);
  final VelocityBloc<Category?> selectedCategoriesBloc =
      VelocityBloc<Category?>(null);

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  final QuillController controller = QuillController.basic();

  final TextEditingController textEditingController = TextEditingController();

  pickImage(context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImageBloc.onUpdateData(image);
    } else {
      VxToast.show(context, msg: "No Image Selected");
    }
  }

  clear() {
    selectedImageBloc.onUpdateData(null);
    textEditingController.clear();
    selectedCategoriesBloc.onUpdateData(null);
    selectedTagBloc.onUpdateData(null);
    controller.clear();
  }

  addPost(context, String id) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.postsRepo.addNewPosts(
      title: textEditingController.text,
      slug: textEditingController.text.replaceAll(' ', '-'),
      tagId: selectedTagBloc.state.data!.id!,
      categoryId: selectedCategoriesBloc.state.data!.id!,
      body: controller.document.toPlainText(),
      userId: id,
      fileName: selectedImageBloc.state.data!.path.split("/").last,
      filePath: selectedImageBloc.state.data!.path,
    );
    if (data.status == 1) {
      clear();
      VxToast.show(context, msg: data.message!);
    }
    isLoadingBloc.onUpdateData(false);
  }
}
