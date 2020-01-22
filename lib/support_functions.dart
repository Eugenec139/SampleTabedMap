import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


Future<http.Response> callWebServiceFoaddfavorites(slug ,context,scaffoldKey) async {
  //final scaffoldKey = homescaffoldKey;

  final String urlsignup =  'https://kupeza.co.zm/api/addfavorites';

  var  paramDic = {

    "slug":slug,
  };

  var headers = {
    'Authorization':'Bearer '+ authorization_value,
    'Accept': 'application/json'

  };

  print(paramDic);

  final loginData = await http.post(
      urlsignup ,  // change with your API
      body: paramDic,headers: headers
  );


  if (loginData.statusCode == 200) {


    final snackbar = SnackBar(
      content: Container(

          margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
          //padding: const EdgeInsets.all(8.0),

          child:  Text('You have added '+ slug +' to favorites',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:Colors.white,
          ))),

    );

    scaffoldKey.currentState.showSnackBar(snackbar);



    return loginData;
  }

  else if (loginData.statusCode == 201) {

    final snackbar = SnackBar(
      content: Container(

          margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
          //padding: const EdgeInsets.all(8.0),

          child:  Text('You have removed '+ slug +' from favorites',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:Colors.white,
          ))),

    );

    scaffoldKey.currentState.showSnackBar(snackbar);


    return loginData;
  }

  else if (loginData.statusCode == 401) {

    final snackbar = SnackBar(
      content: Container(

          margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
          //padding: const EdgeInsets.all(8.0),

          child:  Text('Your action could not be processed, try again later',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:Colors.white,
          ))),

    );

    scaffoldKey.currentState.showSnackBar(snackbar);


    return loginData;
  }
  else
  {

    final snackbar = SnackBar(
      content:Container(

          margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
          //padding: const EdgeInsets.all(8.0),

          child:   Text('Failed due to network, try again later',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:Colors.white,
          ))),

    );

    scaffoldKey.currentState.showSnackBar(snackbar);

    return loginData;

  }

}

Future<http.Response> callWebServiceFoaddfavorite(slug ,context,scaffoldKey) async {
  //final scaffoldKey = homescaffoldKey;

  final String urlsignup =  'https://kupeza.co.zm/api/addfavorites';

  var  paramDic = {

    "slug":slug,
  };

  var headers = {
    'Authorization':'Bearer '+ authorization_value,
    'Accept': 'application/json'

  };

  print(paramDic);

  final loginData = await http.post(
      urlsignup ,  // change with your API
      body: paramDic,headers: headers
  );


  if (loginData.statusCode == 200) {


    final snackbar = SnackBar(
      content: Container(

          margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
          //padding: const EdgeInsets.all(8.0),

          child:  Text('You have added '+ slug +' to favorites',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:Colors.white,
          ))),

    );

    scaffoldKey.currentState.showSnackBar(snackbar);



    return loginData;
  }

  else if (loginData.statusCode == 201) {

    final snackbar = SnackBar(
      content: Container(

          margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
          //padding: const EdgeInsets.all(8.0),

          child:  Text('You have removed '+ slug +' from favorites',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:Colors.white,
          ))),

    );

    scaffoldKey.currentState.showSnackBar(snackbar);


    return loginData;
  }

  else if (loginData.statusCode == 401) {

    final snackbar = SnackBar(
      content: Container(

          margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
          //padding: const EdgeInsets.all(8.0),

          child:  Text('Your action could not be processed, try again later',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:Colors.white,
          ))),

    );

    scaffoldKey.currentState.showSnackBar(snackbar);


    return loginData;
  }
  else
  {

    final snackbar = SnackBar(
      content:Container(

          margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
          //padding: const EdgeInsets.all(8.0),

          child:   Text('Failed due to network, try again later',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:Colors.white,
          ))),

    );

    scaffoldKey.currentState.showSnackBar(snackbar);

    return loginData;

  }

}

String toTitleCal(priceunit,squarefeet) {
  var mor = ((double.parse( priceunit.replaceAll(RegExp(',') , '') ) * double.parse(squarefeet.replaceAll(RegExp(',') , ''))));
  var mor1 = mor.floor();
  final formatter = new NumberFormat("#,###");

  return "K"+ formatter.format(mor1);

}

String toFormat(priceunit) {
  var mor =   priceunit;
  var mor1 = mor.floor();
  final formatter = new NumberFormat("#,###");
  return formatter.format(mor1);

}
String toTitleCase(str) {
  if(str =='commercial_space'){

    return 'Commercial Space';

  }

  return str[0].toUpperCase() + str.substring(1).toLowerCase();

}
String stripMargin(String s) {
  return s.splitMapJoin(
    RegExp(r'^', multiLine: true),
    onMatch: (_) => ' ',
  );
}
String truncateWithEllipsis(int cutoff, String myString) {
  return (myString.length <= cutoff)
      ? myString
      : '${myString.substring(0, cutoff)}...';
}

String titleCase(str) {
  var splitStr = str.toLowerCase().split(' ');
  for (var i = 0; i < splitStr.length; i++) {
    // You do not need to check if i is larger than splitStr length, as your for does that for you
    // Assign it back to the array
    String james = splitStr[i] ;
    if (james != "") {

      splitStr[i] = james[0].toUpperCase() + splitStr[i].substring(1);

    }

  }
  return splitStr.join(' ');
}