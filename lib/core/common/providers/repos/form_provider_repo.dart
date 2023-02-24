import 'package:kamran/core/common/entities/controller.dart';

abstract class FormProviderRepo {
  final List<Controller> fieldControllers = [];
  bool allFilled = false;

  void checkAllFilled();

  int findUnusedIndex();

  void setUsed(int index);

  void addController(Controller controller);
}
