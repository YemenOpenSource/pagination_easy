import 'package:flutter/material.dart';

import 'pagination_method.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    Key? key,
    this.bottomLoader,
    this.isGridView = false,
    this.emptyWidget,
    required this.itemBuilder,
    required this.controller,
  }) : super(key: key);
  final Widget? bottomLoader;
  final Widget? emptyWidget;
  final bool isGridView;
  final Widget Function(BuildContext, dynamic item, int) itemBuilder;
  final PaginationMethod controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<dynamic>>(
        stream: controller.paginationHelper.stream,
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return buildListView(context, snapshot, controller);
        });
  }

  Widget buildListView(BuildContext context,
      AsyncSnapshot<List<dynamic>> asyncSnapshot, PaginationMethod controller) {
    if (!asyncSnapshot.hasData) {
      return bottomLoader ?? const SizedBox.shrink();
    }

    controller.items.addAll(asyncSnapshot.data!.toList());

    if (!isGridView) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        itemCount: controller.items.length + 1,
        itemBuilder: (context, index) => (index == controller.items.length &&
                !controller.isCompleted)
            ? bottomLoader ?? const SizedBox.shrink()
            : (index == controller.items.length && controller.items.isEmpty)
                ? emptyWidget ?? const SizedBox.shrink()
                : (index == controller.items.length && controller.isCompleted)
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      )
                    : itemBuilder(context, controller.items[index], index),
      );
    } else {
      return GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        children: List.generate(
          controller.items.length + 1,
          //    model.isEmpty?
          //     productsFilter.length:
          // productsFilter.length<10?
          // productsFilter.length:
          // productsFilter.length + 1,
          (index) => (index == controller.items.length &&
                  !controller.isCompleted)
              ? bottomLoader ?? const SizedBox.shrink()
              : (index == controller.items.length && controller.items.isEmpty)
                  ? emptyWidget ?? const SizedBox.shrink()
                  : (index == controller.items.length && controller.isCompleted)
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 15,
                        )
                      : itemBuilder(context, controller.items[index], index),
        ),
      );
    }
  }
}
