part of 'categories_imports.dart';

@RoutePage<Category>()
class Categories extends StatefulWidget {
  const Categories({
    super.key,
    required this.navigationType,
  });

  final NavigationType navigationType;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late CategoriesViewModel categoriesViewModel;

  @override
  void initState() {
    categoriesViewModel =
        CategoriesViewModel(repository: context.read<Repository>());
    categoriesViewModel.fetchAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: MyColors.primaryColor,
        title: "Categories".text.size(16.sp).bold.white.make(),
        automaticallyImplyLeading:
            NavigationType.outer == widget.navigationType ? false : true,
        actions: [
          IconButton(
            onPressed: () => categoriesViewModel.goToAddCategories(context),
            icon: const Icon(
              FeatherIcons.plus,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: BlocBuilder<VelocityBloc<CategoriesModel>,
          VelocityState<CategoriesModel>>(
        bloc: categoriesViewModel.categoriesModelBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is VelocityUpdateState) {
            return ListView.separated(
                itemCount: state.data.categories!.length,
                separatorBuilder: (context, index) => SizedBox(
                      height: 20.h,
                    ),
                itemBuilder: (context, index) {
                  var categoryData = state.data.categories![index];
                  return Card(
                    child: ListTile(
                      onTap: () => NavigationType.outer == widget.navigationType
                          ? null
                          : AutoRouter.of(context)
                              .maybePop<Category>(categoryData),
                      leading: '${index + 1}'.text.size(16.sp).make(),
                      title: "${categoryData.title}".text.size(16.sp).make(),
                      trailing: SizedBox(
                        width: 100.w,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => categoriesViewModel
                                  .goToUpdateCategories(context, categoryData),
                              icon: const Icon(
                                color: Colors.green,
                                FeatherIcons.edit,
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  categoriesViewModel.deleteCategories(
                                      categoryData.id.toString(), index),
                              icon: const Icon(
                                color: Colors.red,
                                FeatherIcons.trash,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
