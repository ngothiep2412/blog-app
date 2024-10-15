part of 'categories_imports.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: "Categories".text.size(16.sp).bold.white.make(),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.plus,
              color: Colors.white,
            ),
          )
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
          }),
    );
  }
}
