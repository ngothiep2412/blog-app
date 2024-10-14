part of 'tags_imports.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
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
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(
          height: 20.h,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: '${index + 1}'.text.size(16.sp).make(),
              title: "Enter".text.size(16.sp).make(),
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
      ),
    );
  }
}
