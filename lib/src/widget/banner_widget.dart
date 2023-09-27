import 'package:moviestudio/src/utils/file_import.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      width: MediaQuery.of(context).size.width,
      height: 191.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 191.h,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Container(
              height: 62.h,
              width: 211.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.orange
              ),
            ),
          )
        ],
      ),
    );
  }
}
