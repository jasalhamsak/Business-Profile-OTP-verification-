import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/scheduler.dart'; // 👈 Important import for Ticker

part 'logincubit_state.dart'; // Assuming you have a state file

class LogincubitCubit extends Cubit<LogincubitState> {
  Ticker? _ticker;
  int _resendTime = 60; // 30 seconds OTP timer

  LogincubitCubit() : super(LogincubitInitial());

  void startTimer() {
    _ticker?.dispose();  // Dispose old ticker if any
    _resendTime = 60;    // Reset timer to 30 seconds
    emit(TimerStartedState(_resendTime));  // Emit the initial state

    int lastElapsedSeconds = 0;  // Track the last second update
    _ticker = Ticker((Duration elapsed) {
      // Check if one full second has passed
      int elapsedSeconds = elapsed.inSeconds;

      // Only update once every second
      if (elapsedSeconds > lastElapsedSeconds) {
        lastElapsedSeconds = elapsedSeconds;

        if (_resendTime > 0) {
          _resendTime--;
          emit(TimerStartedState(_resendTime));  // Emit the state
        } else {
          stopTimer(); 
          emit(TimerStoppedState());// Stop the timer once the countdown is over
        }
      }
    });

    _ticker?.start();  // Start the Ticker
  }

  void stopTimer() {
    _ticker?.dispose();
    emit(TimerStoppedState());
  }

  @override
  Future<void> close() {
    _ticker?.dispose(); // Always dispose Ticker when Cubit closes
    return super.close();
  }


}










// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'logincubit_state.dart';
//
// class LogincubitCubit extends Cubit<LogincubitState> {
//   LogincubitCubit() : super(LogincubitInitial());
//
//
//
//   int resendTime = 60;
//   Timer? countdownTimer;
//
//   startTimer(){
//     print("timer Started");
//     emit(TimerStartedState(resendTime));
//     countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer){
//       resendTime = resendTime -1;
//       emit(TimerStartedState(resendTime));
//       if(resendTime < 1){
//         countdownTimer?.cancel();
//         emit(TimerStoppedState());
//         print("timer Stoped");
//       }
//     });
//   }
//
//   stopTimer(){
//     if(countdownTimer?.isActive ?? false){
//       countdownTimer?.cancel();
//       emit(TimerStoppedState());
//       print("timer CAnceled");
//     }
//   }
//
//
// }
