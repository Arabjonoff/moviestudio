import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailShimmer extends StatelessWidget {
  const DetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(baseColor: Colors.white, highlightColor: Colors.grey, child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          color: Colors.grey,
        ),
        SizedBox(height: 20,),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 20,
          color: Colors.grey,
        ),
        SizedBox(height: 8,),
        Container(
          width: 300,
          height: 20,
          color: Colors.grey,
        ),
        SizedBox(height: 8,),
        Expanded(
            child:ListView.builder(itemBuilder: (context,i){
              return  Container(
                margin: EdgeInsets.symmetric(vertical: 4,),
                width: MediaQuery.of(context).size.width,
                height: 25,
                color: Colors.grey,
              );
            })
        ),

      ],
    ));
  }
}
