import 'package:flutter/material.dart';
import 'package:moviestudio/src/theme/app_colors.dart';
import 'package:moviestudio/src/theme/app_style.dart';
import 'package:moviestudio/src/ui/detail_screen.dart';
import 'package:moviestudio/src/ui/main/main_screen.dart';
import 'package:moviestudio/src/utils/cache.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int theme = 0;
  @override
  void initState() {
    _initTheme();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          SizedBox(height: 32,),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  onTap: (){
                    theme = 1;
                    saveTheme(theme);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){
                      return MainScreen();
                    }));
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  title: Text('Qorongu',style: AppStyle.bodyContent(AppColors.text),),
                ),
              ),
              Expanded(
                child: ListTile(
                  onTap: (){
                    theme = 0;
                    saveTheme(theme);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){
                      return MainScreen();
                    }));
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  title: Text('Yorug',style: AppStyle.bodyContent(AppColors.text),),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  void saveTheme(int theme) {
    ThemePreferences.saveTheme(theme);
    AppColors.changeTheme();
    // Navigator.popUntil(context, (route) => route.isFirst);
    // Navigator.pushReplacement(
    //   context,
    //   CupertinoPageRoute(
    //     builder: (context) {
    //       return MainScreen();
    //     },
    //   ),
    // );
  }

  void _initTheme() async{
    setState(() {
      theme = ThemePreferences.getThemeAll()??0;
    });
  }
}
