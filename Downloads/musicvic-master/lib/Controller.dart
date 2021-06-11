import 'package:get/get.dart';

class MusicController extends GetxController {
@override

  int counter = 0;

  void increment() {
    counter++;
    update(); // look here!
  }

}