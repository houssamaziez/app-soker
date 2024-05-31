import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Controller/api_operations.dart';
import '../../../Controller/authController.dart';
import '../../../util/Const/text_app.dart';
import '../../../util/Size/dimensions.dart';
import '../../../util/theme/Style/styles.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/snackBar.dart';
import '../../Widgets/textfild.dart';

class ScreenConfermpassword extends StatefulWidget {
  final String email;
  const ScreenConfermpassword({super.key, required this.email});
  @override
  State<ScreenConfermpassword> createState() => _ScreenSigninState();
}

class _ScreenSigninState extends State<ScreenConfermpassword> {
  final TextEditingController passwordconfermController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    passwordconfermController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<ApiOperation>(context);
    return Scaffold(
      appBar: AppBar(elevation: 0, leading: Buttons.ButtonBack(context)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: SizeApp.heightmobile(context, size: 0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                const Text(
                  TextApp.findYaccount,
                  style: StyleApp.title,
                ),
                SizeApp.sizedboxh20,
                const Text(
                  TextApp.enteremail,
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
                                controller: passwordconfermController,
                                keyboardType: TextInputType.name,
                                hin: '********',
                                obscureText: true,
                                title: TextApp.password),
                            SizeApp.sizedboxh20,
                            Textfildapp.myTextfilde(
                                obscureText: true,
                                controller: passwordController,
                                keyboardType: TextInputType.name,
                                hin: '********',
                                title: TextApp.passwordconfi),
                            SizeApp.sizedboxh20,
                            Buttons.buttonAll(context,
                                title: myData.isloadingAuth == false
                                    ? TextApp.Search
                                    : TextApp.loading,
                                color: Theme.of(context).primaryColor,
                                functinn: myData.isloadingAuth == false
                                    ? () async {
                                        if (_formKey.currentState!.validate()) {
                                          if (passwordconfermController.text ==
                                              passwordController.text) {
                                            myData.change(true);
                                            await AuthController()
                                                .updatepassword(
                                                  password:
                                                      passwordconfermController
                                                          .text,
                                                  context: context,
                                                  email: widget.email,
                                                )
                                                .then((value) =>
                                                    myData.change(false));
                                          } else {
                                            snackBar(
                                              context,
                                              message:
                                                  TextApp.passwordsnotmatch,
                                            );
                                          }
                                        }
                                      }
                                    : () {}),
                            SizeApp.sizedboxh25,
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
