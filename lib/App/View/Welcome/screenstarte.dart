import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:tomlogin/App/View/Auth/Sign%20in/screensignin.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Introduction> list = [
      Introduction(
        title: ' ',
        subTitle: '''MED CUP  مرحبا بكم في تطبيق 

التطبيق الاول من نوعه في الجزائر ، تطبيق سهل و سلس لمساعدتك في حياتك الصحية''',
        imageUrl: 'assets/images/logo-removebg-preview.png',
        imageHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      Introduction(
        title: 'MED CUP',
        subTitle:
            'هي عبارة عن علبة ستقوم بتسهيل حالتك المرضية و مساعدتك على العلاج في اقرب وقت حيث تحتوي على نظام تذكير تناول للأدوية و ميزة خاصة تساعدك على أخذ جرعاتك من الأنسولين و كل هاذا بنظام سهل و حماية تامة',
        imageUrl:
            'assets/images/Messenger_creation_9821d3b1-4fad-4ff6-b91c-a3d87ce3ce04-removebg-preview.png',
        imageHeight: MediaQuery.of(context).size.height * 0.27,
      ),
      Introduction(
        title: 'تجربة علاج',
        subTitle: 'إستمتع بتجربة فريدة وسهل',
        imageUrl:
            'assets/images/Messenger_creation_22635593-5bd5-4690-ae29-11f3683cfdf5-removebg-preview.png',
        imageHeight: MediaQuery.of(context).size.height * 0.3,
      ),
    ];

    return IntroScreenOnboarding(
      backgroudColor: Colors.teal,
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
