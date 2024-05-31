import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomlogin/App/View/Widgets/textfild.dart';

import '../../../Controller/api_operations.dart';
import '../../../Controller/authController.dart';
import '../../../util/Const/text_app.dart';
import '../../../util/Size/dimensions.dart';
import '../../../util/theme/Style/styles.dart';
import '../../Widgets/buttons.dart';

class ScreenSendemail extends StatefulWidget {
  const ScreenSendemail({super.key});
  @override
  State<ScreenSendemail> createState() => _ScreenSigninState();
}

class _ScreenSigninState extends State<ScreenSendemail> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<ApiOperation>(
      context,
    );

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
                SizeApp.sizedboxh10,
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
                                controller: emailController,
                                hin: 'xyz@gmail.com',
                                title: TextApp.emailAddress),
                            SizeApp.sizedboxh20,

                            Buttons.buttonAll(context,
                                title: myData.isloadingAuth == false
                                    ? TextApp.Search
                                    : TextApp.loading,
                                color: Theme.of(context).primaryColor,
                                functinn: myData.isloadingAuth == false
                                    ? () async {
                                        if (_formKey.currentState!.validate()) {
                                          myData.change(true);
                                          await AuthController()
                                              .sendEmailConferM(
                                                context: context,
                                                email: emailController.text,
                                              )
                                              .then((value) =>
                                                  myData.change(false));
                                        }
                                      }
                                    : () {}),
                            SizeApp.sizedboxh25,
                            // Buttons.buttonAll(context,
                            //     title: TextApp.signInwithGoogle,
                            //     isgoogle: true,
                            //     color: const Color.fromARGB(255, 235, 235, 235),
                            //     functinn: () {}),
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
