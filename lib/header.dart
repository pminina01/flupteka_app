import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header(
      {Key? key,
      required this.hasMenu,
      required this.title,
      this.onExtraAction})
      : super(key: key);

  final bool hasMenu;
  final String title;
  final Function()? onExtraAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: hasMenu
                  ? () => {Scaffold.of(context).openDrawer()}
                  : () => Navigator.pop(context),
              icon: hasMenu
                  ? const Icon(Icons.menu_rounded, size: 35,)
                  : const Icon(Icons.arrow_back_ios_new)),
          Text(title),
          onExtraAction != null
              ? IconButton(
                  onPressed: onExtraAction,
                  icon: const Icon(Icons.add),
                )
              : const SizedBox(width: 20),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
