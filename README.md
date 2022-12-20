
# pagination_easy_plugin


A  Flutter widget for pagination .
## Installation

Run `flutter pub add pagination_easy`

Or

add `pagination_easy` as a dependency in your `pubspec.yaml` file. and run `flutter pub get`.

## Usage

To use this plugin,

```dart
import 'package:pagination_easy/pagination_controller.dart';
import 'package:pagination_easy/pagnation_widget.dart';


late PaginationController<Product> paginationController;
  
  
   @override
  void initState() {
     paginationController = PaginationController<Product>(
             (int pageKey) => getData(pageKey));
        
    
  }
    Future<List<Product>> getData(int pageKey) async {
    //write your code
    }



    ///
SingleChildScrollView(
controller: controller.paginationController.scrollController,
          
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


<h3 align="left">Connect with me:</h3>
<p align="left">

<a  href="https://t.me/Mobile_AppDeveloper" target="_blank"><img align="center"                                                                src="https://user-images.githubusercontent.com/83473041/208145434-4c4a9444-5d3f-4ca0-958c-8e72cb0b6e34.svg" alt="amjad_alhetary" height="40" width="40"/></a>
<a  href="https://www.linkedin.com/in/amjed-hitari-883aab180/" target="_blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="amjad_alhetary" height="30" width="40" /></a>
<a  href="https://wa.me/967776399500" target="_blank"><img align="center" src="https://user-images.githubusercontent.com/83473041/208144638-45efc918-bb84-493b-8bc9-d80316b24aad.svg" alt="amjad_alhetary" height="30" width="40" /></a>
