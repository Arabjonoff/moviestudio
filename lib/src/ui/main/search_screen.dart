import 'package:flutter/material.dart';
import 'package:moviestudio/src/bloc/serach_bloc.dart';
import 'package:moviestudio/src/model/popular_movie.dart';
import 'package:moviestudio/src/theme/app_colors.dart';
import 'package:moviestudio/src/utils/file_import.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      searchBloc.getSearchMovie(controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        title: TextField(
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Serach movie',
              hintStyle: TextStyle(color: Colors.grey)),
          controller: controller,
        ),
      ),
      body: StreamBuilder<PopularMovieModel>(
          stream: searchBloc.searchGetMovie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text('${controller.text} ga oid ${snapshot.data!.results.length} ta film topildi!' ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data!.totalResults.bitLength,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                            height: 154.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                        'https://image.tmdb.org/t/p/w500/${snapshot.data!.results[index].backdropPath}',fit: BoxFit.cover,),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(snapshot.data!.results[index].title)
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
