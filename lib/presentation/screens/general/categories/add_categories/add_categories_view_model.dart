part of 'add_categories_imports.dart';

class AddCategoriesViewModel {
  final Repository repository;

  AddCategoriesViewModel({required this.repository});

  TextEditingController textController = TextEditingController();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  final globalKey = GlobalKey<FormState>();

  addNewCategories(context) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.categoriesRepo.addNewCategories(
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
