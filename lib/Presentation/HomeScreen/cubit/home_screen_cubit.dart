import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial(selectedScreen: 1));

bool isEditable =false;

//Personal Details

  String companyName = "Demo Company name";
  late TextEditingController companyNameController=TextEditingController(text: companyName);

  String whatsappNumber = "+91 8123458765";
  late TextEditingController whatsappNumberController=TextEditingController(text: whatsappNumber);

  String address = "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016";
  late TextEditingController addressController=TextEditingController(text: address);

  String place = "Rammurthy nagar, Bangalore";
  late TextEditingController placeController=TextEditingController(text: place);

  String district = "Demo District";
  late TextEditingController districtController=TextEditingController(text: district);

  String personState = "Demo State";
  late TextEditingController personStateController=TextEditingController(text: personState);

//Company Details

  String roomFloorBuildingNumber = "Akshya Nagar 1st Block 1st";
  late TextEditingController roomFloorBuildingNumberController=TextEditingController(text: roomFloorBuildingNumber);

  String location = "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016";
  late TextEditingController locationController=TextEditingController(text: location);

  String landmark = "Rammurthy nagar, Bangalore";
  late TextEditingController landmarkController=TextEditingController(text: landmark);

  String pINCode = "873582";
  late TextEditingController pINCodeController=TextEditingController(text: pINCode);

  String city = "Demo District";
  late TextEditingController cityController=TextEditingController(text: city);

  String companyState = "Demo State";
  late TextEditingController companyStateController=TextEditingController(text: companyState);


  //security details

  String gSTNumber = "XXXXXXXXX";
  late TextEditingController gSTNumberController=TextEditingController(text: gSTNumber);

  String accountNumber = "XXXXXXXXXXXXXX016";
  late TextEditingController accountNumberController=TextEditingController(text: accountNumber);

  String iFSCCode = "XXXXX-XXXXX";
  late TextEditingController iFSCCodeController=TextEditingController(text: iFSCCode);



  void switchScreen(int screenNumber) {
    emit(HomeScreenLoaded(selectedScreen: screenNumber));
  }
  void editMode(){
    emit(TextEditable());
  }
  void spacialEdit(item){
    emit(sacialEditState(item: item));
  }


  void cancelEdit(){
    companyNameController.text = companyName;
    whatsappNumberController.text = whatsappNumber;
    addressController.text = address;
    placeController.text = place;
    districtController.text = district;
    companyStateController.text = companyState;

    isEditable =false;
    emit(EditCanceled());
  }
  void saveEdit(){
    companyName = companyNameController.text;
    whatsappNumber = whatsappNumberController.text;
    address = addressController.text;
    place = placeController.text;
    district = districtController.text;
    companyState = companyStateController.text;

    isEditable =false;
    emit(EditSaved());
  }

}
