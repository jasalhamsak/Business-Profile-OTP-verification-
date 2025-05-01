// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String status;
  String message;
  Data data;

  ProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  SupplierProfile supplierProfile;
  PickupDetails pickupDetails;
  BankAccount bankAccount;
  GstinVerification gstinVerification;

  Data({
    required this.supplierProfile,
    required this.pickupDetails,
    required this.bankAccount,
    required this.gstinVerification,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    supplierProfile: SupplierProfile.fromJson(json["supplier_profile"]),
    pickupDetails: PickupDetails.fromJson(json["pickup_details"]),
    bankAccount: BankAccount.fromJson(json["bank_account"]),
    gstinVerification: GstinVerification.fromJson(json["gstin_verification"]),
  );

  Map<String, dynamic> toJson() => {
    "supplier_profile": supplierProfile.toJson(),
    "pickup_details": pickupDetails.toJson(),
    "bank_account": bankAccount.toJson(),
    "gstin_verification": gstinVerification.toJson(),
  };
}

class BankAccount {
  int user;
  String accountNumber;
  String ifscCode;

  BankAccount({
    required this.user,
    required this.accountNumber,
    required this.ifscCode,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) => BankAccount(
    user: json["user"],
    accountNumber: json["account_number"],
    ifscCode: json["ifsc_code"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "account_number": accountNumber,
    "ifsc_code": ifscCode,
  };
}

class GstinVerification {
  int user;
  String gstin;

  GstinVerification({
    required this.user,
    required this.gstin,
  });

  factory GstinVerification.fromJson(Map<String, dynamic> json) => GstinVerification(
    user: json["user"],
    gstin: json["gstin"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "gstin": gstin,
  };
}

class PickupDetails {
  int id;
  User user;
  String roomFloorBuildNumber;
  double latitude;
  double longitude;
  String location;
  String landmark;
  String pinCode;
  String city;
  String state;

  PickupDetails({
    required this.id,
    required this.user,
    required this.roomFloorBuildNumber,
    required this.latitude,
    required this.longitude,
    required this.location,
    required this.landmark,
    required this.pinCode,
    required this.city,
    required this.state,
  });

  factory PickupDetails.fromJson(Map<String, dynamic> json) => PickupDetails(
    id: json["id"],
    user: User.fromJson(json["user"]),
    roomFloorBuildNumber: json["room_floor_build_number"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    location: json["location"],
    landmark: json["landmark"],
    pinCode: json["pin_code"],
    city: json["city"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user.toJson(),
    "room_floor_build_number": roomFloorBuildNumber,
    "latitude": latitude,
    "longitude": longitude,
    "location": location,
    "landmark": landmark,
    "pin_code": pinCode,
    "city": city,
    "state": state,
  };
}

class User {
  String email;
  int fkRole;
  int id;

  User({
    required this.email,
    required this.fkRole,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    fkRole: json["fk_role"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "fk_role": fkRole,
    "id": id,
  };
}

class SupplierProfile {
  int id;
  List<Category> categories;
  String uploadPhoto;
  String supplierName;
  String companyName;
  String address;
  String place;
  String district;
  String state;
  String supplierId;
  String supplierType;
  String whatsappNumber;
  int user;

  SupplierProfile({
    required this.id,
    required this.categories,
    required this.uploadPhoto,
    required this.supplierName,
    required this.companyName,
    required this.address,
    required this.place,
    required this.district,
    required this.state,
    required this.supplierId,
    required this.supplierType,
    required this.whatsappNumber,
    required this.user,
  });

  factory SupplierProfile.fromJson(Map<String, dynamic> json) => SupplierProfile(
    id: json["id"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    uploadPhoto: json["upload_photo"],
    supplierName: json["supplier_name"],
    companyName: json["company_name"],
    address: json["address"],
    place: json["place"],
    district: json["district"],
    state: json["state"],
    supplierId: json["supplier_id"],
    supplierType: json["supplier_type"],
    whatsappNumber: json["whatsapp_number"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "upload_photo": uploadPhoto,
    "supplier_name": supplierName,
    "company_name": companyName,
    "address": address,
    "place": place,
    "district": district,
    "state": state,
    "supplier_id": supplierId,
    "supplier_type": supplierType,
    "whatsapp_number": whatsappNumber,
    "user": user,
  };
}

class Category {
  int categoryId;
  String categoryName;

  Category({
    required this.categoryId,
    required this.categoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
  };
}
