import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tomlogin/App/Controller/api_operations.dart';
import 'package:tomlogin/App/Controller/locationController.dart';
import 'package:tomlogin/App/Controller/myappcontroller.dart';

List<SingleChildWidget> listofprovider = [
  ChangeNotifierProvider(create: (_) => TimeProvider()),
  ChangeNotifierProvider(create: (_) => ApiOperation()),
  ChangeNotifierProvider(create: (_) => ControllerLocation()),
];
