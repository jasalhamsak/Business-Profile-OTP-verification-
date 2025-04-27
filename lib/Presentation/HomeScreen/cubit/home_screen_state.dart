
part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}



class OTPVerificationState extends HomeScreenState {}


class HomeScreenInitial extends HomeScreenState {
  final int selectedScreen;
  HomeScreenInitial({this.selectedScreen = 1});}

class HomeScreenLoaded extends HomeScreenState {
  final int selectedScreen;
  HomeScreenLoaded({required this.selectedScreen});}

class TextEditable extends HomeScreenState {}

class sacialEditState extends HomeScreenState {
  final int item;
  sacialEditState({required this.item});
}

class EditCanceled extends HomeScreenState {}
class EditSaved extends HomeScreenState {}
