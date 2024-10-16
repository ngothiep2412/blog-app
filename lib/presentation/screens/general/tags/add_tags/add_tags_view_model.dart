part of 'add_tags_imports.dart';

class AddTagsViewModel {
  final Repository repository;

  AddTagsViewModel({required this.repository});

  TextEditingController textController = TextEditingController();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  final globalKey = GlobalKey<FormState>();

  addNewTags(context) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.tagsRepo.addNewTags(
        title: textController.text,
        slug: textController.text.toLowerCase().replaceAll(" ", "-"));

    if (data.status == 1) {
      VxToast.show(context, msg: data.message!);
      var newData = await repository.tagsRepo.getAllTags();

      AutoRouter.of(context).maybePop<TagsModel>(newData);
    }

    isLoadingBloc.onUpdateData(false);
  }
}
