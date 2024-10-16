part of 'update_categories_imports.dart';

class UpdateCategoriesViewModel {
  final Repository repository;

  UpdateCategoriesViewModel({required this.repository});

  TextEditingController textController = TextEditingController();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  final globalKey = GlobalKey<FormState>();

  updateNewCategories(context, String id) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.categoriesRepo.updateCategories(
        id: id,
        title: textController.text,
        slug: textController.text.toLowerCase().replaceAll(" ", "-"));

    if (data.status == 1) {
      VxToast.show(context, msg: data.message!);
      var newData = await repository.categoriesRepo.getAllCategories();

      AutoRouter.of(context).maybePop<CategoriesModel>(newData);
    }

    isLoadingBloc.onUpdateData(false);
  }
}
