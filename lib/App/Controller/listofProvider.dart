import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tomlogin/App/Controller/api_operations.dart';
import 'package:tomlogin/App/Controller/locationController.dart';

List<SingleChildWidget> listofprovider = [
  ChangeNotifierProvider(create: (_) => ApiOperation()),
  ChangeNotifierProvider(create: (_) => ControllerLocation()),
];
