part of 'update_tags_imports.dart';

@RoutePage<TagsModel>()
class UpdateTags extends StatefulWidget {
  const UpdateTags({super.key, required this.tag});

  final Tag tag;

  @override
  State<UpdateTags> createState() => _UpdateTagsState();
}

class _UpdateTagsState extends State<UpdateTags> {
  late UpdateTagsViewModel updateTagsViewModel;

  @override
  void initState() {
    updateTagsViewModel =
        UpdateTagsViewModel(repository: context.read<Repository>());

    updateTagsViewModel.textController.text = widget.tag.title.toString();
    super.initState();
  }

  @override
  void dispose() {
    updateTagsViewModel.textController.dispose();
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
        title: "Update Tags".text.size(16.sp).bold.white.make(),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: updateTagsViewModel.globalKey,
            child: Column(
              children: [
                16.heightBox,
                VxTextField(
                  fillColor: Colors.transparent,
                  borderColor: MyColors.primaryColor,
                  borderType: VxTextFieldBorderType.roundLine,
                  borderRadius: 10,
                  hint: "Title",
                  controller: updateTagsViewModel.textController,
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
                  controller: updateTagsViewModel.textController,
                  validator: (slug) {
                    if (slug!.isEmpty) {
                      return "Empty Slug";
                    }
                    return null;
                  },
                ),
                const Spacer(),
                BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                    bloc: updateTagsViewModel.isLoadingBloc,
                    builder: (context, state) {
                      return PrimaryButton(
                        title: "Update Tag",
                        isLoading: state.data,
                        onPressed: () {
                          if (updateTagsViewModel.globalKey.currentState!
                              .validate()) {
                            updateTagsViewModel.updateTags(
                                context, widget.tag.id.toString());
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
