import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:payment_app/service/data_service.dart';

class DataController extends GetxController {
  var list = [].obs;
  final _loading = false.obs;
  final service = DataService();

  get loading => _loading.value;
  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  _loadData() async {
    _loading.value = true;
    try {
      var info = service.getUsers();
      list.addAll(await info);
    } catch (ex) {
      if (kDebugMode) {
        print('Error in get data_service in data_controller');
        print(ex);
      }
    } finally {
      _loading.value = false;
    }
  }
}
