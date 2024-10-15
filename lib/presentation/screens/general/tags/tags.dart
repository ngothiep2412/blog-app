part of 'tags_imports.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  late TagsViewModel tagsViewModel;

  @override
  void initState() {
    tagsViewModel = TagsViewModel(repository: context.read<Repository>());
    tagsViewModel.fetchAllTags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: "Tags".text.size(16.sp).make(),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(FeatherIcons.plus))
        ],
      ),
      body: BlocBuilder<VelocityBloc<TagsModel>, VelocityState<TagsModel>>(
          bloc: tagsViewModel.tagsModelBloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is VelocityUpdateState) {
              return ListView.separated(
                itemCount: state.data.tags!.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.h,
                ),
                itemBuilder: (context, index) {
                  var tagData = state.data.tags![index];
                  return Card(
                    child: ListTile(
                      leading: '${index + 1}'.text.size(16.sp).make(),
                      title: tagData.title!.text.size(16.sp).make(),
                      trailing: SizedBox(
                        width: 100.w,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                color: Colors.green,
                                FeatherIcons.edit,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
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
                },
              );
            }
            return const SizedBox.shrink();
          }),
    );
  }
}
