import 'package:easy_localization/easy_localization.dart';
import 'package:moviestudio/src/bloc/popular_bloc.dart';
import 'package:moviestudio/src/bloc/top_movie_bloc.dart';
import 'package:moviestudio/src/model/popular_movie.dart';
import 'package:moviestudio/src/model/top_movie_model.dart';
import 'package:moviestudio/src/ui/drawer/drawer_screen.dart';
import 'package:moviestudio/src/ui/main/search_screen.dart';
import 'package:moviestudio/src/utils/file_import.dart';
import 'package:moviestudio/src/widget/carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
popularBloc.getPopularMovie();
tobBloc.getTopMovie();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        actions: [
      IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SearchScreen();
        }));
      }, icon: Icon(Icons.search))
        ],
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
          StreamBuilder<TopMovieModel>(
            stream: tobBloc.topGetMovie,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return BannerWidget(data: snapshot.data!,);
              }
              return Center(child: CircularProgressIndicator());
            }
          ),
          SizedBox(height: 50.h,),
          StreamBuilder<PopularMovieModel>(
            stream: popularBloc.popularGetMovie,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return CarouselWidget(data: snapshot.data!,);
              }
              return Center(child: CircularProgressIndicator());
            }
          )
        ],
      ),
    );
  }
}
