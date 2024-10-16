part of 'add_tags_imports.dart';

@RoutePage<TagsModel>()
class AddTags extends StatefulWidget {
  const AddTags({super.key});

  @override
  State<AddTags> createState() => _AddTagsState();
}

class _AddTagsState extends State<AddTags> {
  late AddTagsViewModel addTagsViewModel;

  @override
  void initState() {
    addTagsViewModel = AddTagsViewModel(repository: context.read<Repository>());
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
        title: "Add Tags".text.size(16.sp).bold.white.make(),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: addTagsViewModel.globalKey,
            child: Column(
              children: [
                16.heightBox,
                VxTextField(
                  fillColor: Colors.transparent,
                  borderColor: MyColors.primaryColor,
                  borderType: VxTextFieldBorderType.roundLine,
                  borderRadius: 10,
                  hint: "Title",
                  controller: addTagsViewModel.textController,
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
                  controller: addTagsViewModel.textController,
                  validator: (slug) {
                    if (slug!.isEmpty) {
                      return "Empty Slug";
                    }
                    return null;
                  },
                ),
                const Spacer(),
                BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                    bloc: addTagsViewModel.isLoadingBloc,
                    builder: (context, state) {
                      return PrimaryButton(
                        title: "Add New Tags",
                        isLoading: state.data,
                        onPressed: () {
                          if (addTagsViewModel.globalKey.currentState!
                              .validate()) {
                            addTagsViewModel.addNewTags(context);
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
