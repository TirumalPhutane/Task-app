import 'package:async_redux/async_redux.dart';
import 'package:demo/common/typedef.dart';

class UpdateFieldsViewmodel extends Vm {
  UpdateFieldsViewmodel({required this.loading, required this.updateFields})
    : super(equals: [loading]);

  final bool loading;
  final UpdateFields updateFields;
}
