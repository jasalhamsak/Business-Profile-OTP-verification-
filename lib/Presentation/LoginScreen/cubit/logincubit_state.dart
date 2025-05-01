part of 'logincubit_cubit.dart';


sealed class LogincubitState {}

final class LogincubitInitial extends LogincubitState {}

final class LoginStatusLoading extends LogincubitState {}
final class LoginStatusLoaded extends LogincubitState {
}
final class LoginStatusError extends LogincubitState {}



final class MainTokenLoading extends LogincubitState {}
final class MainTokenLoaded extends LogincubitState {
}
final class MainTokenError extends LogincubitState {}



//OTP timer
final class TimerStartedState extends LogincubitState {
  final int resendTime;
  TimerStartedState(this.resendTime);}
final class TimerStoppedState extends LogincubitState {}
