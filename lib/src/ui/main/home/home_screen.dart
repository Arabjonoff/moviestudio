import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:moviestudio/src/ui/drawer/drawer_screen.dart';
import 'package:moviestudio/src/utils/file_import.dart';
import 'package:moviestudio/src/widget/carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bg,
        title: RichText(
          text: TextSpan(
              text: 'home.homeBanner1'.tr(),
              children: <TextSpan>[
                TextSpan(
                    text: 'home.homeBanner'.tr(), style: AppStyle.bodyH2(AppColors.text)),
              ],
              style: AppStyle.bodyH2(AppColors.orange)),
        ),
      ),
      body: Column(
        children: [
          BannerWidget(),
          SizedBox(height: 50.h,),
          CarouselWidget()
        ],
      ),
    );
  }
}
