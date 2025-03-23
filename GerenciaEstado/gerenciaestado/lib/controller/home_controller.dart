import 'package:get/get.dart';

class HomeController extends GetxController {
  var _count = 0.obs;

  get count => _count;

  set count(value) {
    _count = value;
  }

  incrementar() => _count++;
  decrementar() => _count--;
}
