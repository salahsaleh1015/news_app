import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsLayOut extends StatelessWidget {
  const NewsLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusinessData()..getSportsData()..getScienceData(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                IconButton(onPressed: () {
                cubit.changeAppMood();
                }, icon: Icon(Icons.brightness_4_rounded)),
              ],
              title: Text(
                "NewsApp",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),

            bottomNavigationBar: BottomNavigationBar(
              items: cubit.navItems,
              onTap: (value) {
                cubit.changeNavState(value);
              },
              currentIndex: cubit.currentIndex,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
