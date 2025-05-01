
part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}



class GetDetailsLoading extends HomeScreenState {}
class GetDetailsLoaded extends HomeScreenState {
  final ProfileModel data;
  GetDetailsLoaded({required this.data,});}
class ProfileImageUpdated extends HomeScreenState {
  final String profileUrl;
  ProfileImageUpdated({required this.profileUrl});
}
class GetDetailsError extends HomeScreenState {}

class PutDetailsSuccess extends HomeScreenState {}
class PutDetailsError extends HomeScreenState {}











class OTPVerificationState extends HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {
  final int selectedScreen;
  HomeScreenInitial({this.selectedScreen = 1});}

class HomeScreenLoaded extends HomeScreenState {
  final int selectedScreen;
  HomeScreenLoaded({required this.selectedScreen});}

class HomeScreenImagePicked extends HomeScreenState {
  final File image;
  HomeScreenImagePicked(this.image);
}




class TextEditable extends HomeScreenState {}

class sacialEditState extends HomeScreenState {
  final int item;
  sacialEditState({required this.item});
}

class EditCanceled extends HomeScreenState {}
class EditSaved extends HomeScreenState {}
