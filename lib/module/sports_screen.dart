import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/reusable.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state){},
      builder: (context , state){
        var list = NewsCubit.get(context).sports;
        return ConditionalBuilder(
          condition: state is! GetSportsDataLoadingState,
          fallback: (context)=>Center(
            child: CircularProgressIndicator(),
          ),
          builder: (context){
            return ListView.separated(
              itemBuilder:(context , i)=> buildArticleItem(list![i] , context) ,
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
      },


    );
  }
}
