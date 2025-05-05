import 'package:businessprofile_otp_verification/Presentation/LoginScreen/Presentation/OTPpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../cubit/logincubit_cubit.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LogincubitCubit(),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: BlocListener<LogincubitCubit, LogincubitState>(
                    listener: (context, state) {
                      if (state is LoginStatusLoaded) {
                        final loginCubit = context.read<LogincubitCubit>();
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) =>
                              Dialog(
                                backgroundColor: Colors.transparent,
                                child: BlocProvider.value(
                                  value: loginCubit,
                                  child: SizedBox(
                                    width: 300,
                                    height: 400,
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(15),
                                      child: OtpPage(),
                                    ),
                                  ),
                                ),
                              ),
                        );
                      } else if (state is LoginStatusError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                state.problem),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: BlocBuilder<LogincubitCubit, LogincubitState>(
                      builder: (context, state) {
                        final cubit = context.read<LogincubitCubit>();

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 240,
                                      height: 143,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/logo.png"))),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                      children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Welcome again!",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Please Log into your existing \n account",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )
                                  ]
                                  ),
                                  SizedBox(height: 5),
                                  Column(
                                    children: [
                                      TextFormField(
                                        controller: cubit.emailController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(15)),
                                          filled: true,
                                          fillColor: Color(0xffF4F4F4),
                                          prefixIcon: Icon(
                                            Icons.email_outlined,
                                          ),
                                          hintText: "Email Address",
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 20),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: cubit.passwordController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(15)),
                                          filled: true,
                                          fillColor: Color(0xffF4F4F4),
                                          prefixIcon:
                                          Icon(Icons.lock_outline_rounded),
                                          hintText: "Password",
                                          suffixIcon:
                                          Icon(Icons.visibility_off_outlined),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Forget your password?"),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Click Here",
                                            style: TextStyle(
                                                color: Colors.green),
                                          ))
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      final email = cubit.emailController.text
                                          .trim();
                                      final password =
                                      cubit.passwordController.text.trim();

                                      if (email.isEmpty || password.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                            SnackBar(
                                                behavior: SnackBarBehavior
                                                    .floating,
                                                duration: Duration(seconds: 3),
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                    "Username and Password cant be empty!")));
                                      } else if (!email.contains('@') ||
                                          !email.contains('.')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Please enter a valid email address."),
                                            backgroundColor: Colors.red,
                                            behavior: SnackBarBehavior.floating,
                                          ),
                                        );
                                      } else {
                                        context.read<LogincubitCubit>()
                                            .checkLoginStatus();
                                      }
                                    },
                                    child: Container(
                                      width: 380,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xff47BA82),
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      child: Center(
                                          child: state is LoginStatusLoading
                                              ? CircularProgressIndicator()
                                              : Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text("Don’t have an account yet ?"),
                                    ],
                                  ),
                                  SizedBox(height: 5),

                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 380,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Color(0xff47BA82)),
                                      ),
                                      child: Center(
                                          child: Text(
                                            "Create New Account",
                                            style: TextStyle(
                                                color: Color(0xff47BA82),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 8,)
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
