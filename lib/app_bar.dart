import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router_utils.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final Size prefSize;
  final String title;
  final bool isSubPage;
  final bool hasSearchFunction;

  CustomAppBar(
    {required this.title,
    this.isSubPage = false,
    this.hasSearchFunction = false,
    this.prefSize = const Size.fromHeight(56.0),
    Key? key})
    : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0); 

 @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      automaticallyImplyLeading: false,
      leading: widget.isSubPage
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => GoRouter.of(context).pop(),
            )
          : null,
      actions: [
        widget.hasSearchFunction
            ? IconButton(
                onPressed: () =>
                    GoRouter.of(context).goNamed(APP_PAGE.search.routeName),
                icon: const Icon(Icons.search))
            : const Icon(null),
        IconButton(
            onPressed: () {
              print("Don't poke me!!");
            },
            icon: const Icon(Icons.person))
      ],
    );
  }
}