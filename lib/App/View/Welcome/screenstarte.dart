import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:tomlogin/App/View/Auth/Sign%20in/screensignin.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Introduction> list = [
      Introduction(
        title: ' ',
        subTitle: '''مرحبا بكم في تطبيق MED CUP

التطبيق الاول من نوعه في الجزائر ، تطبيق سهل و سلس لمساعدتك في
إدارة دوائك بكل سهولة وأمان''',
        imageUrl: 'assets/images/logo-removebg-preview.png',
        imageHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      Introduction(
        title: 'Med Cup مع',
        subTitleTextStyle: TextStyle(fontSize: 18),
        subTitle:
            ''' علبة ذكية ترافقك في رحلة علاجك من خلال تحكم كامل في إدارة أدويتك وتعيين جداول زمنية وإبقائك على المسار الصحيح بإرسال تنبيهات وتتبع التزامك بالأدوية بالإضافة إلى ميزة خاصة تساعدك على أخذ جرعاتك من الأنسولين وكل هذا بنظام سهل و آمن''',
        imageUrl:
            'assets/images/Messenger_creation_9821d3b1-4fad-4ff6-b91c-a3d87ce3ce04-removebg-preview.png',
        imageHeight: MediaQuery.of(context).size.height * 0.27,
      ),
      Introduction(
        title: 'تجربة علاج',
        subTitle: '''Med Cup مع
لن تفوت جرعة أخرى من دوائك
مع تجربة إدارة دوائك أسهل
وأفضل''',
        imageUrl:
            'assets/images/Messenger_creation_22635593-5bd5-4690-ae29-11f3683cfdf5-removebg-preview.png',
        imageHeight: MediaQuery.of(context).size.height * 0.3,
      ),
    ];

    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        // start.write("start", true);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenSignin(),
          ), //MaterialPageRoute
        );
      },
      // foregroundColor: Colors.red,
    );
  }
}
