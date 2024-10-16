part of 'categories_imports.dart';

class CategoriesViewModel {
  final Repository repository;

  final VelocityBloc<CategoriesModel> categoriesModelBloc =
      VelocityBloc<CategoriesModel>(CategoriesModel());

  CategoriesViewModel({required this.repository});

  fetchAllCategories() async {
    var categoriesData = await repository.categoriesRepo.getAllCategories();

    if (categoriesData.status == 1) {
      categoriesModelBloc.onUpdateData(categoriesData);
    }
  }

  goToAddCategories(context) async {
    var addCategoriesData = await AutoRouter.of(context)
        .push<CategoriesModel>(const AddCategoriesRoute());

    if (addCategoriesData != null) {
      categoriesModelBloc.onUpdateData(addCategoriesData);
    }
  }

  goToUpdateCategories(context, category) async {
    var addCategoriesData = await AutoRouter.of(context)
        .push<CategoriesModel>(UpdateCategoriesRoute(category: category));

    if (addCategoriesData != null) {
      categoriesModelBloc.onUpdateData(addCategoriesData);
    }
  }

  deleteCategories(id, index) async {
    var data = await repository.categoriesRepo.deleteCategories(id: id);

    if (data.status == 1) {
      categoriesModelBloc.state.data.categories!.removeAt(index);
      categoriesModelBloc.onUpdateData(categoriesModelBloc.state.data);
    }
  }
}
