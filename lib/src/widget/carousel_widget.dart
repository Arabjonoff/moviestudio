import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:moviestudio/src/model/popular_movie.dart';
import 'package:moviestudio/src/utils/file_import.dart';

class CarouselWidget extends StatelessWidget {
  final PopularMovieModel data;
  const CarouselWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true, enlargeFactor: 0.2, height: 336.0.h,),
      items: data.results.map((i) {
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
                    child: CachedNetworkImage(imageUrl:'https://image.tmdb.org/t/p/w500/${i.backdropPath}',fit: BoxFit.cover,)),
                Positioned(
                  left: 16.w,
                  bottom:16.w,
                  child: Container(
                    alignment: Alignment.center,
                    width: 226.w,
                    height: 76.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(218, 218, 218, 0.3).withOpacity(0.7),
                    ),
                    child: Text(i.title),
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
            color: Color.fromRGBO(218, 218, 218, 0.3).withOpacity(0.7)
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
