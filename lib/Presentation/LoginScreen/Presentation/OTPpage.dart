import 'dart:async';

import 'package:businessprofile_otp_verification/Presentation/HomeScreen/Presentation/HomeScreen.dart';
import 'package:businessprofile_otp_verification/Presentation/LoginScreen/cubit/logincubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpPage extends StatelessWidget {
   OtpPage({super.key,});

  final TextEditingController _otpController = TextEditingController();
  final String otp = "1234";

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LogincubitCubit>();
    if (cubit.state is! TimerStartedState) {
      cubit.startTimer();
    }

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: BlocBuilder<LogincubitCubit, LogincubitState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "OTP Verification",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Please enter the OTP sent to your \n email",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 14, color: Colors.blueGrey)),
                    TextFormField(
                      controller: _otpController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          hintText: "Enter OTP",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    state is TimerStartedState
                        ? Text(
                      "Time remaining: ${state.resendTime} ",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600),
                    )
                        : state is TimerStoppedState
                        ? Text("Time is Out! Resend the OTP",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600),)
                        : SizedBox(),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Homescreen(),));

                      },
                      child: Container(
                        width: 280,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff47BA82),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                              "Verify OTP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          state is TimerStoppedState?
                              cubit.startTimer():null;
                        },
                        child: Text("Resend OTP",
                            style: TextStyle(
                                color: state is TimerStoppedState ? Colors
                                    .green : Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600))),
                    TextButton(
                        onPressed: () {
                          cubit.stopTimer();
                          Navigator.pop(context);
                        },
                        child: Text("Cancel",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500))),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
