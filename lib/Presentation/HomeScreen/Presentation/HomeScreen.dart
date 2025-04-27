import 'package:businessprofile_otp_verification/Presentation/HomeScreen/cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Resources/IndexPages.dart';
import '../Resources/Resources.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, size: 33),
          )
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile Image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green,
                      width: 4,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Name & Role
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Text(
                      "Richardson Davis",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    Text("Supplier"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Contact Row
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.apartment),
                    SizedBox(width: 5),
                    Text("Company Name"),
                    SizedBox(width: 40),
                    Icon(Icons.phone),
                    SizedBox(width: 5),
                    Text("70343199400"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.mail),
                    SizedBox(width: 5),
                    Text("abc123@gmail.com"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            BlocProvider(
              create: (context) => HomeScreenCubit()..switchScreen(1),
              child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProfileButtons(
                            text: "Personal Details",
                            ontap: () {
                              context.read<HomeScreenCubit>().switchScreen(1);
                            },
                            isSelected: state is HomeScreenLoaded &&
                                state.selectedScreen == 1,
                          ),
                          ProfileButtons(
                            text: "Company",
                            ontap: () {
                              context.read<HomeScreenCubit>().switchScreen(2);
                            },
                            isSelected: state is HomeScreenLoaded &&
                                state.selectedScreen == 2,
                          ),
                          ProfileButtons(
                            text: "Security",
                            ontap: () {
                              context.read<HomeScreenCubit>().switchScreen(3);
                            },
                            isSelected: state is HomeScreenLoaded &&
                                state.selectedScreen == 3,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Category Heading

                          if(state is HomeScreenLoaded)...[
                      if(state.selectedScreen == 1)PersonalDetailsIndex(),
                      if(state.selectedScreen == 2)CompanyIndex(),
                      if(state.selectedScreen == 3)SecurityIndex(),
                          ]

                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
