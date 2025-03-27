import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';

Widget myListTile({
  required String title,
  required IconData leadingIcon,
  required void Function() onTab,
}) {
  return Material(
    clipBehavior: Clip.hardEdge,
    borderRadius: BorderRadius.circular(20),
    child: ListTile(
      leading: Icon(leadingIcon, size: 35),
      title: Text(title),
      tileColor: Colors.grey.withAlpha(50),
      // shape: Border.all(color: Theme.of(context).colorScheme.primary),
      onTap: onTab,
    ),
  );
}

Widget myListTileLogOut({
  required String title,
  required IconData leadingIcon,
  required void Function() onTab,
}) {
  return Material(
    clipBehavior: Clip.hardEdge,
    borderRadius: BorderRadius.circular(20),
    child: ListTile(
      leading: Icon(leadingIcon, color: myColor, size: 35),
      title: Text(title),
      tileColor: Colors.grey.withAlpha(50),
      // shape: Border.all(color: Theme.of(context).colorScheme.primary),
      onTap: onTab,
    ),
  );
}
