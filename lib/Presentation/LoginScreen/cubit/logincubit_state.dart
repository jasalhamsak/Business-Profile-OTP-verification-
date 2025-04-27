part of 'logincubit_cubit.dart';


sealed class LogincubitState {}

final class LogincubitInitial extends LogincubitState {}
final class TimerStartedState extends LogincubitState {
  final int resendTime;
  TimerStartedState(this.resendTime);
}
final class TimerStoppedState extends LogincubitState {}
