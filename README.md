
# pagination_easy_plugin

A  Flutter widget for pagination .
## Installation

Run `flutter pub add pagination_easy`

Or

add `pagination_easy` as a dependency in your `pubspec.yaml` file. and run `flutter pub get`.

## Usage

To use this plugin,

```flutter
import 'package:pagination_easy/pagination_controller.dart';
import 'package:pagination_easy/pagnation_widget.dart';


late PaginationController paginationController;
  
  
   @override
  void initState() {
   paginationController =
        PaginationController((int pageKey) => getData(pageKey));
        
    
  }
    Future<List<Product>> getData(int pageKey) async {
    //write your code
    }
  
  
add NotificationListener widget to be first widget in screen

 NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              return PaginationHelper.instance.onNotification(scrollInfo);
            },
            child:...
                    PaginationWidget(
                                      itemBuilder: (BuildContext context, item,
                                              int index) =>
                                          YourWidget(
                                          product:item
                                      ),
                                      controller:
                                         paginationController,
                                      emptyWidget: const EmptyDataWidget(),
                                      bottomLoader: Center(
                                        child:
                                           CircularProgressIndicator(),
                                      ),
                                    )

```
