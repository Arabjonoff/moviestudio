import 'package:carousel_slider/carousel_slider.dart';
import 'package:moviestudio/src/utils/file_import.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true, enlargeFactor: 0.2, height: 336.0.h,),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                    height: double.infinity,
                    width: 258.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.grey),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    )),
                Positioned(
                  left: 16.w,
                  bottom:16.w,
                  child: Container(
                    width: 226.w,
                    height: 76.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.orange
                    ),
                  ),
                ),
                Positioned(
                  right:16.w,
                  top:16.w,
                  child: Container(
                    width: 77.w,
                    height: 46.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.orange
                    ),
                  ),
                )
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
