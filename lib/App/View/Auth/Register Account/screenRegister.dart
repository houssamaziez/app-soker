import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomlogin/App/View/Auth/Sign%20in/screensignin.dart';

import '../../../Controller/api_operations.dart';
import '../../../Controller/locationController.dart';
import '../../../util/Const/text_app.dart';
import '../../../util/QRscane/screenbeforscane.dart';
import '../../../util/Route/go.dart';
import '../../../util/Size/dimensions.dart';
import '../../../util/theme/Style/styles.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/textfild.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController namelController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ApiOperation controller = Provider.of<ApiOperation>(context);
    var controllerlocation = Provider.of<ControllerLocation>(context);

    return Scaffold(
      appBar: AppBar(elevation: 0, leading: Buttons.ButtonBack(context)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                const Text(
                  TextApp.registerAccount,
                  style: StyleApp.title,
                ),
                SizeApp.sizedboxh10,
                const Text(
                  TextApp.helloAgainsup,
                  style: StyleApp.suptitle,
                  textAlign: TextAlign.center,
                ),
                SizeApp.sizedboxh10,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Textfildapp.myTextfilde(
                                controller: namelController,
                                hin: 'name',
                                title: TextApp.yourName),
                            SizeApp.sizedboxh20,
                            Textfildapp.myTextfilde(
                                controller: emailController,
                                hin: 'xyz@gmail.com',
                                title: TextApp.emailAddress),
                            SizeApp.sizedboxh20,
                            Textfildapp.myTextfilde(
                                keyboardType: TextInputType.phone,
                                controller: phoneController,
                                hin: 'phone',
                                title: TextApp.yourphone),
                            SizeApp.sizedboxh20,
                            Textfildapp.myTextfilde(
                                controller: passwordController,
                                hin: '**********',
                                obscureText: true,
                                title: TextApp.password),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Welaya :",
                                  style: StyleApp.style1,
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controllerlocation
                                          .showWilayaMenu(context);
                                    },
                                    child: Consumer<ControllerLocation>(
                                        builder: (context, a, child) {
                                      return SizedBox(
                                          width: double.infinity,
                                          height: 50,
                                          child: Center(
                                              child: Text(
                                            a.selectedWilaya,
                                          )));
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            SizeApp.sizedboxh20,
                            Consumer<ControllerLocation>(
                                builder: (context, a, child) {
                              return Buttons.buttonAll(context,
                                  title: controller.isloadingAuth == false
                                      ? TextApp.registerAccount
                                      : TextApp.loading,
                                  color: Theme.of(context).primaryColor,
                                  functinn: () {
                                Go.to(context, ScreenBSC());
                              });
                            }),
                            SizeApp.sizedboxh25,
                          ],
                        ),
                      ),
                    )),
                TextButton(
                  onPressed: () {
                    Go.push(const ScreenSignin());
                  },
                  child: const Text(
                    TextApp.alreHaAccount,
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
