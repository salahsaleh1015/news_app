import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/lay_out/news_lay_out.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/app_states.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit ,AppStates>(
        listener: (context , state){},
       builder: ( context  , state ){
          return MaterialApp(
            theme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    elevation: 20,
                    type: BottomNavigationBarType.fixed,
                    unselectedIconTheme: IconThemeData(color: Colors.grey)),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    actionsIconTheme: IconThemeData(color: Colors.black),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.red,
                    ))),
            darkTheme:ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    elevation: 20,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor:HexColor('333739'),
                    unselectedIconTheme: IconThemeData(color: Colors.grey)),
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                    actionsIconTheme: IconThemeData(color: Colors.white),
                    backgroundColor:HexColor('333739'),
                    elevation: 0.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.red,
                    ))
            ) ,
            themeMode:AppCubit.get(context).isDark?ThemeMode.light:ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            home: NewsLayOut(),
          );
       },


      ),
    );
  }
}
