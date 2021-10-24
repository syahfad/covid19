import 'dart:convert';

import 'package:http/http.dart' as http;

UserModel userModelFromJson(String str) => UserModel.fromJson(jsonDecode(str));
String userModelToJson(UserModel data) => jsonEncode(data.toJson());

class UserModel{
  UserModel({
    // required this.FID,
    required this.Provinsi,
    required this.Kasus_Posi,
  });
  // String FID;
  String Provinsi;
  String Kasus_Posi;

  factory UserModel.fromJson(Map<String,dynamic>json)=> UserModel(
    // FID: json["FID"],
    Provinsi: json["Provinsi"] ,
    Kasus_Posi: json["Kasus_Posi"]
  );
  Map<String,dynamic> toJson()=>{
    // "FID":FID,
    "Provinsi":Provinsi,
    "Kasus_Posi":Kasus_Posi
  };


}