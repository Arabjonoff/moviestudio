import 'package:carousel_slider/carousel_slider.dart';
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
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bg,
        title: RichText(
          text: TextSpan(
              text: 'Steam',
              children: <TextSpan>[
                TextSpan(
                    text: 'Everywhere', style: AppStyle.bodyH2(AppColors.text)),
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
