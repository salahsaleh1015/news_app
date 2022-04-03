import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/module/business_screen.dart';
import 'package:news_app/module/science_screen.dart';
import 'package:news_app/module/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(
      label: "business",
      icon: Icon(Icons.business),
    ),
    BottomNavigationBarItem(
      label: "sports",
      icon: Icon(Icons.sports),
    ),
    BottomNavigationBarItem(
      label: "business",
      icon: Icon(Icons.science),
    ),
  ];
  int currentIndex = 0;
  void changeNavState(int value) {
    currentIndex = value;
if(value == 1 ) getSportsData();
if(value==2) getScienceData();
    emit(NewsNavBarState());
  }

  List<dynamic>? business;
  void getBusinessData() {
    emit(GetBusinessDataLoadingState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "business",
      "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
    }).then((value) {
      print(value.data.toString());
      business = value.data['articles'];
      emit(GetBusinessDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetBusinessDataErrorState(error.toString()));
    });
  }
  //============================================================
  List<dynamic>? sports;

  void getSportsData() {
    emit(GetSportsDataLoadingState());

      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "sports",
        "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
      }).then((value) {
        print(value.data.toString());
        sports = value.data['articles'];
        emit(GetSportsDataSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(GetSportsDataErrorState(error.toString()));
      });


  }
  List<dynamic>? science;
  void getScienceData() {
    emit(GetScienceDataLoadingState());

      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "science",
        "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
      }).then((value) {
        print(value.data.toString());
        science = value.data['articles'];
        emit(GetScienceDataSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(GetScienceDataErrorState(error.toString()));
      });


  }
  bool isDark = false;
     changeAppMood(){
    isDark = !isDark;
    emit(AppThemeMoodState());
  }

}
