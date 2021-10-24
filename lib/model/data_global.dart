import 'dart:convert';

import 'package:http/http.dart' as http;

DataGlobal userModelFromJson(String str) => DataGlobal.fromJson(jsonDecode(str));
String userModelToJson(DataGlobal data) => jsonEncode(data.toJson());

class DataGlobal{
  DataGlobal({
    // required this.FID,
    required this.Country_Region,
    required this.Confirmed,
    required this.Deaths
  });
  // String FID;
  String Country_Region;
  String Confirmed;
  String Deaths;

  factory DataGlobal.fromJson(Map<String,dynamic>json)=> DataGlobal(
    // FID: json["FID"],
      Country_Region: json["Country_Region"] ,
      Confirmed: json["Confirmed"],
      Deaths: json["Deaths"]
  );
  Map<String,dynamic> toJson()=>{
    // "FID":FID,
    "Country_Region":Country_Region,
    "Confirmed":Confirmed,
    "Deaths":Deaths
  };


}