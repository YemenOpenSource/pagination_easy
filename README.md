
# pagination_easy_plugin

A  Flutter widget for pagination .
## Installation

Run `flutter pub add pagination_easy`

Or

add `pagination_easy` as a dependency in your `pubspec.yaml` file. and run `flutter pub get`.

## Usage

To use this plugin,

```flutter

  late PaginationMethod paginationMethod;
  
add is widget to be first widget in screen

 NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              return PaginationHelper.instance.onNotification(scrollInfo);
            },
            child:...
                    PaginationWidget(
                                      itemBuilder: (BuildContext context, item,
                                              int index) =>
                                          YourWidget(
                                        child:..
                                      ),
                                      controller:
                                          controller.paginationController,
                                      emptyWidget: const EmptyDataWidget(),
                                      bottomLoader: Center(
                                        child:
                                           CircularProgressIndicator(),
                                      ),
                                    )

```
