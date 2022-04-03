import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(article , context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage("${article['urlToImage']}"),
                fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  )),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
 Widget articleBuilder(list)=>ConditionalBuilder(
   condition: list!.length >0,
   fallback: (context)=>Center(
     child: CircularProgressIndicator(),
   ),
   builder: (context){
     return ListView.separated(
       itemBuilder:(context , i)=> buildArticleItem(list[i] , context) ,
       itemCount:10 ,
       separatorBuilder:(context , i)=>Padding(
         padding: const EdgeInsets.symmetric(horizontal: 30),
         child: Container(
           height: 2,
           color: Colors.grey,

         ),
       ) ,
       physics: BouncingScrollPhysics(),

     );
   },

 );