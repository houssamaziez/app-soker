import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomlogin/App/util/QRscane/screenScaneQR.dart';

import '../../../Controller/api_operations.dart';
import '../../../util/Const/text_app.dart';
import '../../../util/QRscane/screenbeforscane.dart';
import '../../../util/Route/go.dart';
import '../../../util/Size/dimensions.dart';
import '../../../util/theme/Style/styles.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/textfild.dart';
import '../Forgot Password/screen_searshEmai.dart';
import '../Register Account/screenRegister.dart';

class ScreenSignin extends StatefulWidget {
  const ScreenSignin({super.key});

  @override
  State<ScreenSignin> createState() => _ScreenSigninState();
}

class _ScreenSigninState extends State<ScreenSignin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<ApiOperation>(context);

    return Scaffold(
      appBar: AppBar(elevation: 0, leading: Buttons.ButtonBack(context)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                const Text(
                  TextApp.helloAgain,
                  style: StyleApp.title,
                ),
                SizeApp.sizedboxh10,
                // const Text(
                //   TextApp.helloAgainsup,
                //   style: StyleApp.suptitle,
                //   textAlign: TextAlign.center,
                // ),
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
                                controller: emailController,
                                hin: 'xyz@gmail.com',
                                title: TextApp.emailAddress),
                            SizeApp.sizedboxh20,
                            Textfildapp.myTextfilde(
                                controller: passwordController,
                                hin: '**********',
                                obscureText: true,
                                title: TextApp.password),
                            SizeApp.sizedboxh30,
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Buttons.buttonAll(context,
                                  title: myData.isloadingAuth == false
                                      ? TextApp.signIn
                                      : TextApp.loading,
                                  color: Theme.of(context).primaryColor,
                                  functinn: () {
                                Go.to(context, ScreenBSC());
                              }),
                            ),
                          ],
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Go.to(context, const ScreenSendemail());
                    },
                    child: const Text(
                      TextApp.forgotpassword,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizeApp.sizedboxh40,
                TextButton(
                  onPressed: () {
                    Go.to(context, const ScreenRegister());
                  },
                  child: const Text(
                    TextApp.newUsCreateaccount,
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
