import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class PaginationMethod {
  //----------

  PaginationHelper paginationHelper = PaginationHelper.instance;

//-------------------
  PaginationMethod(this.futureFunction) {
    Future.delayed(const Duration(seconds: 1)).then((value) => getData());
  }
  final Future<List<dynamic>> Function(int pageKey) futureFunction;
  List<dynamic> items = [];
  int pageKey = 1;
  double pixels = 0.0;
  //--------------
  bool isCompleted = false;
  bool errorHappen = false;
  void getData() {
    paginationHelper.subject
        .addStream(Stream.fromFuture(futureFunction(pageKey)));
    paginationHelper.controller
        .listen((notification) => fetchData(notification));
  }

  void refresh() {
    pageKey = 1;
    pixels = 0.0;
    items.clear();
    isCompleted = false;
    // paginationHelper.subject.sink.add([]);
  }

  Future<void> fetchData(
    ScrollNotification notification,
  ) async {
    try {
      if (notification.metrics.pixels == notification.metrics.maxScrollExtent &&
              pixels != notification.metrics.pixels ||
          pageKey == 0) {
        pixels = notification.metrics.pixels;
        pageKey += 1;
        List<dynamic> list = await futureFunction(pageKey);
        if (list.isEmpty || list.length < 10) {
          isCompleted = true;
        }
        paginationHelper.subject.sink.add(list);
      }
    } catch (error) {
      errorHappen = true;
    }
  }
}

class PaginationHelper {
  final ReplaySubject<List<dynamic>> subject = ReplaySubject();
  final ReplaySubject<ScrollNotification> controller = ReplaySubject();
  Stream<List<dynamic>> get stream => subject.stream;
  Sink<ScrollNotification> get sink => controller.sink;
  static final PaginationHelper instance = PaginationHelper();
  bool onNotification(ScrollNotification scrollInfo) {
    print("oNotification ${scrollInfo is OverscrollNotification}");
    if (scrollInfo is OverscrollNotification) {
      sink.add(scrollInfo);
    }
    return false;
  }
}
