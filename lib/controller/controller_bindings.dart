import 'package:get/instance_manager.dart';
import 'package:getx_amplify/controller/controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Controller());
  }
}
