abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class NewsNavBarState extends NewsStates{}
class AppThemeMoodState extends NewsStates{}
class GetBusinessDataLoadingState extends NewsStates{}
class GetBusinessDataSuccessState extends NewsStates{}
class GetBusinessDataErrorState extends NewsStates{
  late final String error;
  GetBusinessDataErrorState(this.error);
}
class GetSportsDataLoadingState extends NewsStates{}
class GetSportsDataSuccessState extends NewsStates{}
class GetSportsDataErrorState extends NewsStates{
  late final String error;
  GetSportsDataErrorState(this.error);
}
class GetScienceDataLoadingState extends NewsStates{}
class GetScienceDataSuccessState extends NewsStates{}
class GetScienceDataErrorState extends NewsStates{
  late final String error;
  GetScienceDataErrorState(this.error);
}
