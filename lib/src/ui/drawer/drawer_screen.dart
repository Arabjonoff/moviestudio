import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:moviestudio/src/utils/file_import.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300.w,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.indigo,
          ),
        ),
        Expanded(
            child: Container(
          width: 300.w,
          color: Colors.white,
          child: Column(
            children: [
              ExpansionTile(
                title: Text(
                  'home.language'.tr(),
                  style: AppStyle.bodyContent(AppColors.bg),
                ),
                children: [
                  Wrap(
                    children: [
                      TextButton(
                          onPressed: () {
                            context.setLocale(Locale("uz"));
                          },
                          child: Text("UZ")),
                      TextButton(
                          onPressed: () {
                            context.setLocale(Locale("ru"));
                          },
                          child: Text("RU")),
                      TextButton(
                          onPressed: () {
                            context.setLocale(Locale("en"));
                          },
                          child: Text("ENG")),
                    ],
                  )
                ],
              ),
              CupertinoSwitch(
                  value: true,
                  onChanged: (i) {

                  })
            ],
          ),
        ))
      ],
    );
  }
}
