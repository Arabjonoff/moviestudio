import 'package:moviestudio/src/model/top_movie_model.dart';
import 'package:moviestudio/src/ui/detail_screen.dart';
import 'package:moviestudio/src/utils/file_import.dart';

class BannerWidget extends StatelessWidget {
  final TopMovieModel data;
  const BannerWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 191,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.results.length,
          itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailScreen(id: data.results[index].id);
            }));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            width: MediaQuery.of(context).size.width,
            height: 191.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  height: 191.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child: Image.network("https://image.tmdb.org/t/p/w500/${data.results[index].backdropPath}",fit: BoxFit.cover,)),
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
          ),
        );
      }),
    );
  }
}
