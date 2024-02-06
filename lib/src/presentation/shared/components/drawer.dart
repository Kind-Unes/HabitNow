import 'package:flutter/material.dart';
import 'package:habit_now/src/utils/const.dart';
import 'package:habit_now/src/utils/extentions.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width * 0.82,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      backgroundColor: AppColors.kBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.height * 0.065,
              ),
              const Row(
                children: [
                  Text(
                    "Habit",
                    style: TextStyle(
                        color: Color.fromARGB(255, 144, 24, 64),
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Now",
                    style: TextStyle(
                        color: Color.fromARGB(255, 246, 16, 93),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                "Saturday",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "February 3, 2024",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: context.height * 0.025,
              ),
              const Divider(
                color: Color.fromARGB(255, 61, 61, 61),
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              DrawerTile(
                function: () {},
                text: 'Home',
                icon: Icons.home_outlined,
                isSelected: true,
              ),
              DrawerTile(
                function: () {
                  context.pushNamed("/timer");
                },
                text: 'Timer',
                icon: Icons.timer_outlined,
                isSelected: false,
              ),
              DrawerTile(
                function: () {
                  context.pushNamed("/categories");
                },
                text: 'Categories',
                icon: Icons.category_outlined,
                isSelected: false,
              ),
              SizedBox(
                height: context.height * 0.009,
              ),
              const Divider(
                color: Color.fromARGB(255, 47, 47, 47),
              ),
              SizedBox(
                height: context.height * 0.009,
              ),
              DrawerTile(
                function: () {
                  //TODO: just route
                },
                text: 'Customize',
                icon: Icons.draw_outlined,
                isSelected: false,
              ),
              DrawerTile(
                function: () {},
                text: 'Settings',
                icon: Icons.settings,
                isSelected: false,
              ),
              DrawerTile(
                function: () {},
                text: 'Backups',
                icon: Icons.backup_outlined,
                isSelected: false,
              ),
              SizedBox(
                height: context.height * 0.009,
              ),
              const Divider(
                color: Color.fromARGB(255, 47, 47, 47),
              ),
              SizedBox(
                height: context.height * 0.009,
              ),
              DrawerTile(
                function: () {},
                text: 'Get premuim',
                icon: Icons.workspace_premium_outlined,
                isSelected: false,
              ),
              DrawerTile(
                function: () {},
                text: 'Rate this app',
                icon: Icons.star,
                isSelected: false,
              ),
              DrawerTile(
                function: () {},
                text: 'contact us',
                icon: Icons.contact_support_sharp,
                isSelected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.function,
  });
  final Function() function;
  final String text;
  final IconData icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(500),
      color: isSelected
          ? const Color.fromARGB(255, 41, 22, 29)
          : AppColors.kBackgroundColor,
      child: InkWell(
        splashColor: const Color.fromARGB(255, 41, 22, 29),
        borderRadius: BorderRadius.circular(500),
        onTap: function,
        child: Container(
          width: double.infinity,
          height: context.height * 0.07,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(500)),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.width * 0.05,
                ),
                Icon(
                  color: isSelected
                      ? const Color.fromARGB(255, 202, 33, 89)
                      : Colors.grey,
                  icon,
                  size: context.height * 0.039,
                ),
                SizedBox(
                  width: context.width * 0.032,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? const Color.fromARGB(255, 202, 33, 89)
                          : Colors.grey,
                      fontSize: 17),
                ),
              ]),
        ),
      ),
    );
  }
}
