part of 'update_categories_imports.dart';

@RoutePage<CategoriesModel>()
class UpdateCategories extends StatefulWidget {
  const UpdateCategories({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  State<UpdateCategories> createState() => _UpdateCategoriesState();
}

class _UpdateCategoriesState extends State<UpdateCategories> {
  late UpdateCategoriesViewModel updateCategoriesViewModel;

  @override
  void initState() {
    updateCategoriesViewModel =
        UpdateCategoriesViewModel(repository: context.read<Repository>());

    updateCategoriesViewModel.textController.text =
        widget.category.title.toString();
    super.initState();
  }

  @override
  void dispose() {
    updateCategoriesViewModel.textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: MyColors.primaryColor,
        title: "Update Categories".text.size(16.sp).bold.white.make(),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: updateCategoriesViewModel.globalKey,
            child: Column(
              children: [
                16.heightBox,
                VxTextField(
                  fillColor: Colors.transparent,
                  borderColor: MyColors.primaryColor,
                  borderType: VxTextFieldBorderType.roundLine,
                  borderRadius: 10,
                  hint: "Title",
                  controller: updateCategoriesViewModel.textController,
                  validator: (title) {
                    if (title!.isEmpty) {
                      return "Empty Title";
                    }
                    return null;
                  },
                ),
                40.heightBox,
                VxTextField(
                  fillColor: Colors.transparent,
                  borderColor: MyColors.primaryColor,
                  borderType: VxTextFieldBorderType.roundLine,
                  borderRadius: 10,
                  hint: "Slug",
                  controller: updateCategoriesViewModel.textController,
                  validator: (slug) {
                    if (slug!.isEmpty) {
                      return "Empty Slug";
                    }
                    return null;
                  },
                ),
                const Spacer(),
                BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                    bloc: updateCategoriesViewModel.isLoadingBloc,
                    builder: (context, state) {
                      return PrimaryButton(
                        title: "Update New Categories",
                        isLoading: state.data,
                        onPressed: () {
                          if (updateCategoriesViewModel.globalKey.currentState!
                              .validate()) {
                            updateCategoriesViewModel.updateNewCategories(
                              context,
                              widget.category.id.toString(),
                            );
                          }
                        },
                      );
                    }),
                14.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
