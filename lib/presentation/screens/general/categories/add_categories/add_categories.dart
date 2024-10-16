part of 'add_categories_imports.dart';

@RoutePage<CategoriesModel>()
class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  late AddCategoriesViewModel addCategoriesViewModel;

  @override
  void initState() {
    addCategoriesViewModel =
        AddCategoriesViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: MyColors.primaryColor,
        title: "Add Categories".text.size(16.sp).bold.white.make(),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: addCategoriesViewModel.globalKey,
            child: Column(
              children: [
                16.heightBox,
                VxTextField(
                  fillColor: Colors.transparent,
                  borderColor: MyColors.primaryColor,
                  borderType: VxTextFieldBorderType.roundLine,
                  borderRadius: 10,
                  hint: "Title",
                  controller: addCategoriesViewModel.textController,
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
                  controller: addCategoriesViewModel.textController,
                  validator: (slug) {
                    if (slug!.isEmpty) {
                      return "Empty Slug";
                    }
                    return null;
                  },
                ),
                const Spacer(),
                BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                    bloc: addCategoriesViewModel.isLoadingBloc,
                    builder: (context, state) {
                      return PrimaryButton(
                        title: "Add New Categories",
                        isLoading: state.data,
                        onPressed: () {
                          if (addCategoriesViewModel.globalKey.currentState!
                              .validate()) {
                            addCategoriesViewModel.addNewCategories(context);
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
