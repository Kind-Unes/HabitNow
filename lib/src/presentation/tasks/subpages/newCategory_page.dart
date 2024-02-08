import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_now/src/cubit/tasks_cubits/addCategory_cubi.dart';
import 'package:habit_now/src/cubit/tasks_cubits/categories_database_cubit.dart';
import 'package:habit_now/src/cubit/tasks_cubits/editCategory_cubit.dart';
import 'package:habit_now/src/presentation/shared/bottomSheets.dart';
import 'package:habit_now/src/utils/app_static_data.dart';
import 'package:habit_now/src/utils/boxes.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';
import 'package:habit_now/src/utils/models/task_model.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Todo : add init stuff
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.refreshDB();
    });
    return Scaffold(
      appBar: NewCategoryAppBar(
        context: context,
      ),
      body: Stack(
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: context.height * 0.027,
                    left: context.width * 0.03,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Custom categories",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: context.fontSize * 0.9,
                          ),
                        ),
                        BlocBuilder<CategoriesDatabaseCubit, List>(
                          builder: (context, state) {
                            return Text(
                              // either me don't know why is it 6
                              "${6 - state.length} available",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.3),
                                  fontSize: context.fontSize * 0.8,
                                  fontWeight: FontWeight.w400),
                            );
                          },
                        ),
                      ]),
                ),
                SizedBox(
                    height: context.height * 0.2,
                    width: double.infinity,
                    child: BlocBuilder<CategoriesDatabaseCubit,
                        List<CategoryModel>>(
                      builder: (context, categoreyModel) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoreyModel
                              .length, // Set itemCount to the length of your data source
                          itemBuilder: (context, index) {
                            if (index == 0 || index >= categoreyModel.length) {
                              // Skip index 0 and handle cases where index is out of bounds
                              return Container();
                            }

                            return EditCategoryListViewElement(
                              category: CategoryModel(
                                color: categoreyModel[index].color,
                                icon: categoreyModel[index].icon,
                                name: categoreyModel[index].name,
                                id: categoreyModel[index].id,
                              ),
                            );
                          },
                        );
                      },
                    )),
                const Divider(
                  color: Color.fromARGB(255, 62, 62, 62),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: context.height * 0.027,
                    left: context.width * 0.03,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Default categories",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: context.fontSize * 0.9,
                          ),
                        ),
                        Text(
                          "Editable for premuim users",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.3),
                              fontSize: context.fontSize * 0.8,
                              fontWeight: FontWeight.w400),
                        ),
                      ]),
                ),
                SizedBox(
                  height: context.height * 0.2,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: categories.map((e) {
                      return CategoryListViewElement(
                        category: CategoryModel(
                          color: e.color,
                          icon: e.icon,
                          name: e.name,
                          id: e.id,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 62, 62, 62),
                ),
              ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Material(
                borderRadius: BorderRadius.circular(context.fontSize * 1.1),
                color: AppColors.kLightPurple,
                child: InkWell(
                  onTap: () {
                    if (customCategoriesBox.values.length <= 5) {
                      context.read<NewCategoryCubit>().initState();

                      context.showBottmSheet(
                          BlocBuilder<NewCategoryCubit, NewCategoryState>(
                        builder: (context, categoryModel) {
                          return NewCategoryBottomSheet(
                              category: CategoryModel(
                                  color: categoryModel.categoryModel.color,
                                  name: categoryModel.categoryModel.name,
                                  icon: categoryModel.categoryModel.icon,
                                  id: ''));
                        },
                      ));
                    } else {
                      context.showToast(
                          Center(
                            child: Text(
                              "You can't have more then 5 custom categories",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: context.fontSize,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          margin: const Size(0.1, 0.15));
                    }
                  },
                  borderRadius: BorderRadius.circular(context.fontSize * 1.1),
                  child: Container(
                    height: context.height * 0.075,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(context.fontSize * 1.1)),
                    child: Center(
                        child: Text(
                      "NEW CATEGORY",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 29, 11, 17),
                          fontSize: context.fontSize,
                          fontWeight: FontWeight.w700),
                    )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryListViewElement extends StatelessWidget {
  const CategoryListViewElement({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: context.height * 0.026,
          top: context.height * 0.02,
          bottom: context.height * 0.02),
      child: Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
          onTap: () {
            context.showBottmSheet(EditCategoryBottomSheet(category: category));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 7),
                height: context.height * 0.095,
                width: context.height * 0.095,
                decoration: BoxDecoration(
                    color: category.color,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  category.icon,
                  size: context.fontSize * 2.2,
                ),
              ),
              SizedBox(
                width: context.width * 0.17,
                height: context.height * 0.03,
                child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: context.fontSize * 0.8,
                  ),
                ),
              ),
              Text(
                "0entry", //TODO: Implement the logic here
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: context.fontSize * 0.75,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditCategoryListViewElement extends StatelessWidget {
  const EditCategoryListViewElement({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: context.height * 0.026,
          top: context.height * 0.02,
          bottom: context.height * 0.02),
      child: Material(
        color: AppColors.kBackgroundColor,
        child: InkWell(
          onTap: () {
            context.showBottmSheet(EditCategoryBottomSheet(category: category));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 7),
                height: context.height * 0.095,
                width: context.height * 0.095,
                decoration: BoxDecoration(
                    color: category.color,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  category.icon,
                  size: context.fontSize * 2.2,
                ),
              ),
              SizedBox(
                width: context.width * 0.17,
                height: context.height * 0.03,
                child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: context.fontSize * 0.8,
                  ),
                ),
              ),
              Text(
                "0entry", //TODO: Implement the logic here
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: context.fontSize * 0.75,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewCategoryIconDialog extends StatelessWidget {
  const NewCategoryIconDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 18.0),
          Text(
            'Category icon',
            style: TextStyle(
                fontSize: context.fontSize * 0.85,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 10.0),
          const Divider(
            color: Color.fromARGB(255, 46, 46, 46),
          ),
          SizedBox(
            height: context.height * 0.37,
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * 0.05),
                    child: Wrap(
                      children: customCategoriesIcons.map((e) {
                        return NewCategoryIconButton(icon: e);
                      }).toList(),
                    )),
              ]),
            ),
          ),
          InkWell(
              onTap: () {
                context.pop();
              },
              child: Container(
                height: context.height * 0.07,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 79, 79, 79),
                            width: 0.3))),
                child: Center(
                  child: Text(
                    "CLOSE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: context.fontSize * 00.85),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class EditCategoryIconDialog extends StatelessWidget {
  const EditCategoryIconDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 18.0),
          Text(
            'Category icon',
            style: TextStyle(
                fontSize: context.fontSize * 0.85,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 10.0),
          const Divider(
            color: Color.fromARGB(255, 46, 46, 46),
          ),
          SizedBox(
            height: context.height * 0.37,
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * 0.05),
                    child: Wrap(
                      children: customCategoriesIcons.map((e) {
                        return EditCategoryIconButton(icon: e);
                      }).toList(),
                    )),
              ]),
            ),
          ),
          InkWell(
              onTap: () {
                context.pop();
              },
              child: Container(
                height: context.height * 0.07,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 79, 79, 79),
                            width: 0.3))),
                child: Center(
                  child: Text(
                    "CLOSE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: context.fontSize * 00.85),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class EditCategoryIconButton extends StatelessWidget {
  const EditCategoryIconButton({
    super.key,
    required this.icon,
  });

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<EditCategoryCubit>().updateProperty(icon: icon);
        context.refreshDB();
        context.pop();
      },
      child: SizedBox(
        height: context.height * 0.11,
        width: context.height * 0.11,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: context.fontSize * 2.6,
                color: const Color.fromARGB(255, 186, 186, 186),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewCategoryIconButton extends StatelessWidget {
  const NewCategoryIconButton({
    super.key,
    required this.icon,
  });

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NewCategoryCubit>().updateProperty(icon: icon);
        context.refreshDB();
        context.pop();
      },
      child: SizedBox(
        height: context.height * 0.11,
        width: context.height * 0.11,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: context.fontSize * 2.6,
                color: const Color.fromARGB(255, 186, 186, 186),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteCategoryDialog extends StatelessWidget {
  const DeleteCategoryDialog({
    super.key,
    required this.yesFunction,
    required this.noFunction,
  });

  final Function() yesFunction;
  final Function() noFunction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 18.0),
          const Text(
            'Delete category',
            style: TextStyle(
                color: Colors.red,
                fontSize: 18.0,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 10.0),
          const Divider(
            color: Color.fromARGB(255, 46, 46, 46),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.pop();
                },
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(16)),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(16)),
                  ),
                  width: context.width * 0.398,
                  height: context.height * 0.056,
                  child: const Center(
                      child: Text(
                    "CANCEL",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
                ),
              ),
              InkWell(
                onTap: yesFunction,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(16)),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(16)),
                  ),
                  width: context.width * 0.398,
                  height: context.height * 0.056,
                  child: const Center(
                      child: Text(
                    "DELETE",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class EditCategoryColorButton extends StatelessWidget {
  const EditCategoryColorButton({
    super.key,
    required this.color,
  });

  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<EditCategoryCubit>().updateProperty(color: color);
        context.refreshDB();

        context.pop();
      },
      child: SizedBox(
        height: context.height * 0.11,
        width: context.height * 0.11,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: context.fontSize * 2.5,
                width: context.fontSize * 2.5,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(500)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewCategoryColorButton extends StatelessWidget {
  const NewCategoryColorButton({
    super.key,
    required this.color,
  });

  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NewCategoryCubit>().updateProperty(color: color);
        context.refreshDB();
        context.pop();
      },
      child: SizedBox(
        height: context.height * 0.11,
        width: context.height * 0.11,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: context.fontSize * 2.5,
                width: context.fontSize * 2.5,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(500)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewCategoryAppBar extends StatelessWidget implements PreferredSize {
  const NewCategoryAppBar({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(context.height * 0.13);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
          color: AppColors.kLightPurple,
          iconSize: context.fontSize * 1.6,
        ),
        title: Transform.translate(
          offset: Offset(-context.width * 0.05, 0),
          child: const Text(
            "Cetogories",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.verified),
            color: const Color.fromARGB(255, 95, 95, 95),
            iconSize: Sizes.kActionIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded),
            color: const Color.fromARGB(255, 95, 95, 95),
            iconSize: Sizes.kActionIcon,
          ),
        ],
        elevation: 1,
        shadowColor: const Color.fromARGB(255, 122, 115, 115));
  }
}
