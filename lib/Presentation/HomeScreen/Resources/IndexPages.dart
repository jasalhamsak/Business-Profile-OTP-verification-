import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_screen_cubit.dart';
import 'Resources.dart';

class PersonalDetailsIndex extends StatelessWidget {
  const PersonalDetailsIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          final cubit = context.read<HomeScreenCubit>();
          final bool isReadOnly = state is TextEditable ? false : true;
          return Column(
            children: [
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Personal Deatails",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            cubit.editMode();
                          },
                          icon: state is TextEditable
                              ? SizedBox()
                              : Icon(Icons.edit))
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffEEEEEE),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Company Name",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CostmTextFormField(
                            controller: cubit.companyNameController,
                            isReadOnly: isReadOnly,
                          ),
                          Text("Whatsapp Number",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                          CostmTextFormField(
                            controller: cubit.whatsappNumberController,
                            isReadOnly: isReadOnly,
                          ),
                          Text("Address",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                          CostmTextFormField(
                            controller: cubit. addressController,
                            isReadOnly: isReadOnly,
                          ),
                          Text("Place",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                          CostmTextFormField(
                            controller: cubit.placeController,
                            isReadOnly: isReadOnly,
                          ),
                          Text("District",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                          CostmTextFormField(
                            controller: cubit.districtController,
                            isReadOnly: isReadOnly,
                          ),
                          Text("State",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                          CostmTextFormField(
                            controller: cubit.personStateController,
                            isReadOnly: isReadOnly,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              state is TextEditable
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            cubit.cancelEdit();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 5, bottom: 5),
                              child: Text(
                                "Cancel",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            cubit.saveEdit();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, right: 18.0, top: 5, bottom: 5),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : SizedBox()
            ],
          );
        },
      ),
    );
  }
}


class CompanyIndex extends StatelessWidget {
  const CompanyIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          final cubit = context.read<HomeScreenCubit>();
          final bool isReadOnly = state is TextEditable ? false : true;

          return Column(
            children: [
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Company Details",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            cubit.editMode();
                          },
                          icon: state is TextEditable
                              ? SizedBox()
                              : Icon(Icons.edit))
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffEEEEEE),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Room/Floor/Building Number",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CostmTextFormField(
                            controller: cubit.roomFloorBuildingNumberController,
                            isReadOnly: isReadOnly,
                          ),
                          Text("Location/Street",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                          CostmTextFormField(
                            controller: cubit.locationController,
                            isReadOnly: isReadOnly,
                          ),
                          Text("Landmark",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                          CostmTextFormField(
                            controller: cubit. landmarkController,
                            isReadOnly: isReadOnly,
                          ),
                          Text("PIN Code",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                          CostmTextFormField(
                            controller: cubit.pINCodeController,
                            isReadOnly: isReadOnly,
                          ),
                          Text("City",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                          CostmTextFormField(
                            controller: cubit.cityController,
                            isReadOnly: isReadOnly,
                          ),
                          Text("State",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                          CostmTextFormField(
                            controller: cubit.companyStateController,
                            isReadOnly: isReadOnly,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              state is TextEditable
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      cubit.cancelEdit();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 5, bottom: 5),
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      cubit.saveEdit();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, right: 18.0, top: 5, bottom: 5),
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              )
                  : SizedBox()
            ],
          );
        },
      ),
    );
  }
}


class SecurityIndex extends StatelessWidget {
  const SecurityIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          final cubit = context.read<HomeScreenCubit>();

          return Column(
            children: [
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Tax Details",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            cubit.spacialEdit(1);
                          },
                          icon: state is sacialEditState && state.item ==1
                              ? SizedBox()
                              : Icon(Icons.edit))
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffEEEEEE),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "GSTIN Number",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CostmTextFormField(
                            controller: cubit.gSTNumberController,
                            isReadOnly: state is sacialEditState && state.item ==1?false:true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  state is sacialEditState && state.item ==1
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          cubit.cancelEdit();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5, bottom: 5),
                            child: Text(
                              "Cancel",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.saveEdit();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 18.0, right: 18.0, top: 5, bottom: 5),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ):SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Bank Details",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            cubit.spacialEdit(2);
                          },
                          icon: state is TextEditable
                              ? SizedBox()
                              : Icon(Icons.edit))
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffEEEEEE),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Account Number",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CostmTextFormField(
                            controller: cubit.accountNumberController,
                            isReadOnly: state is sacialEditState && state.item ==2?false:true,
                          ),
                          Text(
                            "IFSC Code",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CostmTextFormField(
                            controller: cubit.iFSCCodeController,
                            isReadOnly: state is sacialEditState && state.item ==2?false:true,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              state is sacialEditState && state.item ==2
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      cubit.cancelEdit();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 5, bottom: 5),
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      cubit.saveEdit();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, right: 18.0, top: 5, bottom: 5),
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              )
                  : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Password",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                      },
                      icon:Icon(Icons.keyboard_arrow_right))
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
