import 'package:businessprofile_otp_verification/Presentation/HomeScreen/cubit/home_screen_cubit.dart';
import 'package:businessprofile_otp_verification/Presentation/LoginScreen/Presentation/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Resources/SharedPrefrence.dart';
import '../Resources/IndexPages.dart';
import '../Resources/Resources.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key, required this.token});

  final String token;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(token),
      child: Scaffold(
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
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text("logout"),
                onTap: (){
                  remPrefs();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Loginscreen(),));
                },
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
              final cubit = context.read<HomeScreenCubit>();
              return Column(
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
                        child:
                        CircleAvatar(
                            radius: 60,
                            backgroundImage:NetworkImage(state is ProfileImageUpdated && state.profileUrl.isNotEmpty
                                ? state.profileUrl : cubit.profileUrl.isNotEmpty
                                ?cubit.profileUrl:"https://static.vecteezy.com/system/resources/previews/005/720/408/original/crossed-image-icon-picture-not-available-delete-picture-symbol-free-vector.jpg"),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Name & Role
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children:  [
                          Text(
                           cubit.originalName.isNotEmpty?cubit.originalName:"Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Text( cubit.supplierType.isNotEmpty?cubit.supplierType:"Supplier"),
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
                        children:  [
                          Icon(Icons.apartment),
                          SizedBox(width: 5),
                          Text(cubit.originalCompanyName.isNotEmpty?cubit.originalCompanyName:"Company Name"),
                          SizedBox(width: 40),
                          Icon(Icons.phone),
                          SizedBox(width: 5),
                          Text(cubit.whatsappNumberController.text.isNotEmpty?cubit.whatsappNumberController.text:"Phone Number"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Icon(Icons.mail),
                          SizedBox(width: 5),
                          Text(cubit.originalEmail.isNotEmpty?cubit.originalEmail:"Mail"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProfileButtons(
                              text: "Personal Details",
                              ontap: () {
                                context.read<HomeScreenCubit>().switchScreen(1);
                              },
                              isSelected:
                                  cubit.selectedIndex == 1
                          ),
                          ProfileButtons(
                            text: "Company",
                            ontap: () {
                              context.read<HomeScreenCubit>().switchScreen(2);
                            },
                            isSelected: cubit.selectedIndex == 2,
                          ),
                          ProfileButtons(
                            text: "Security",
                            ontap: () {
                              context.read<HomeScreenCubit>().switchScreen(3);
                            },
                            isSelected: cubit.selectedIndex == 3,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Selected Categories",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),

                      // Category Heading
                      if(cubit.selectedIndex == 1)PersonalDetailsIndex(),
                      if(cubit.selectedIndex == 2)CompanyIndex(),
                      if(cubit.selectedIndex == 3)SecurityIndex(),


                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
