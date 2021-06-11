
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:musicvic/core/api/api.dart';
import 'package:musicvic/core/api/endpoints.dart';


class AuthService extends GetxController {
  var headers = {
    //'pk': 'here_a_private_key',
  //  'authorization': 'Basic ' + base64Encode(utf8.encode('${URLS.USERNAME}:${URLS.PASSWORD}')),
    "Accept": "application/json"
  };
  Future<int> orderAssign(AuthToken) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.home_component);
    final response = await http.get(uri,headers:  {
      'Content-type': 'application/json',
      "Authorization": 'Bearer $AuthToken',
      "Accept": "application/json"
    });
    int status = response.statusCode;
    return status;
  }
  Future<http.Response> login( String email,  String password) async {
    var uri = Uri.parse(Api.$BaseUrl + Endpoints.login );
    Map body = {
      "user_email": email,
      "user_password": password,

    };
    final response = await http.post(
      uri,body:body
       // headers:headers

    );
    print(response.body);
    int status = response.statusCode;
    return response;
  }
  Future<http.Response> createAccount(firstName,email, password, phone) async {
    var uri = Uri.parse(Api.$BaseUrl+ Endpoints.create );
    Map body = {
      "user_email": email,
      "user_password": password,
      "user_name":firstName,
      "user_token":"aa",
      "user_phone":phone
    };
    final response = await http.post(
      uri,body: body
    );
    print(response.body);
    int status = response.statusCode;
    return response;
  }
  // ignore: non_constant_identifier_names
  Future<int> SocialAuth(firstName, lastName, gender, email, password, phone) async {
    var uri = Uri.parse(Api.$BaseUrl +
        Endpoints.socialauth +
        "?first_name=$firstName&last_name=$lastName&gender=$gender&email=$email&password=$password&phone=$phone");
    // Map body = {"email": email, "password": password};
    final response = await http.post(
      uri,
    );
    int status = response.statusCode;
    return status;
  }
  Future<int> Socallogin(firstName, lastName, gender, email, password, phone) async {
    var uri = Uri.parse(Api.$BaseUrl +
        Endpoints.sociallogin +
        "?first_name=$firstName&last_name=$lastName&gender=$gender&email=$email&password=$password&phone=$phone");
    // Map body = {"email": email, "password": password};
    final response = await http.post(
      uri,
    );
    int status = response.statusCode;
    return status;
  }
  Future<int> ForgotPassWord(email) async {
    var uri = Uri.parse(Api.$BaseUrl +
        Endpoints.forgotpass +
        "?email=$email");
     Map body = {"email": email,};
    final response = await http.post(
      uri,body: body
    );
    int status = response.statusCode;
    return status;
  }
  Future<int> RessetPassword( email, Token, ) async {
    var uri = Uri.parse(Api.$BaseUrl +
        Endpoints.resetpassword +
        "?email=$email&Token=$Token");
    Map body = {"email": email, "Token": Token};
    final response = await http.post(
      uri,body: body
    );
    int status = response.statusCode;
    return status;
  }
  /////////////////////////////////
  Future<http.Response> homecomp() async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.home_component);
    Map body = {

     // "phone":Phone
    };
    final response = await http.post(
        uri,

    );
    print(response.body);
    int status = response.statusCode;
    return response;
  }
  Future<http.Response> verify( email,Token,) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.verifiy);
    Map body = {"user_email": email,
      "verification_code": Token,};
    final response = await http.post(
        uri,body: jsonEncode(body),headers: headers
    );
    int status = response.statusCode;
    return response;
  }/*
  Future<int> generate_mobile_pin(  @required String Phone,) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.generate_mobile_pin);
    Map body = {

      "phone":Phone
    };
    final response = await http.post(
        uri,body: body,
        headers: headers
    );
    print(response.body);
    int status = response.statusCode;
    return status;
  }
  Future<http.Response> GoOnline( firbasetoken,Mapid,AuthToken,) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.goonline);
    Map body = {"firebase_token": firbasetoken,
      "gmap_id":Mapid,};
    Map<String, String >  Mheader= {"Content-type": "application/json",
      "Authorization": 'Bearer $AuthToken', "Accept":"application/json"
    };
    final response = await http.post(
        uri,body: jsonEncode(body),headers:Mheader
    );

    int status = response.statusCode;
    print(status);
    return response;
  }
  Future<int> GoOffline( firbasetoken,Mapid ,AuthToken,) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.gooffline);
    Map body = {
      "firebase_token": firbasetoken,
      "gmap_id":Mapid,
    };
    final response = await http.post(
        uri,body: jsonEncode(body),headers:  {'Content-type': 'application/json',
      "Authorization": 'Bearer $AuthToken', "Accept": "application/json"
    }
    );
    int status = response.statusCode;
    return status;
  }
  Future<int> save_lat_long( Lat,Long, AuthToken,) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.save_lat_long);
    Map body = {
      "lat": Lat,
      "longs":Long,
    };
    final response = await http.post(
        uri,body: jsonEncode(body),headers: {'Content-type': 'application/json',
      "Authorization": 'Bearer $AuthToken', "Accept": "application/json"
    }
    );
    int status = response.statusCode;
    return status;
  }
  Future<int> RejectRequest( OrderId ,AuthToken,) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.orderReject);
    Map body = {
      "orderId": OrderId,
    };
    final response = await http.post(
        uri,body: jsonEncode(body),headers: {'Content-type': 'application/json',
      "Authorization": 'Bearer $AuthToken', "Accept": "application/json"
    }
    );

    int status = response.statusCode;
    print(status);
    return status;
  }
  Future<http.Response> AcceptRequest( OrderId,AuthToken,) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.orderAccept);
    Map body = {
      "orderId": OrderId,
    //  "gmap_id":Mapid,
    };
    final response = await http.post(
        uri,body: jsonEncode(body),headers:{'Content-type':'application/json',
      "Authorization": 'Bearer $AuthToken', "Accept": "application/json"
    }
    );
    int status = response.statusCode;
    print(status);
    return response;
  }
  Future<http.Response> OrderAssign(AuthToken,) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.orderAssign);
    Map body = {
      //"orderId": OrderId,
      };
    final response = await http.get(
        uri,headers: {
      "Authorization": 'Bearer $AuthToken'
    }
    );
    int status = response.statusCode;
    print(status);
    return response;
  }
  Future<http.Response> OrderOnGoing(AuthToken,) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.getOngoingOrder);
    Map body = {
      //"orderId": OrderId,
    };
    final response = await http.get(
        uri,headers: {
      "Authorization": 'Bearer $AuthToken'
    }
    );
    int status = response.statusCode;
    print(status);
    return response;
  }
  Future<http.Response> OrderCompleted(AuthToken,) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.getCompletedOrder);
    Map body = {
      //"orderId": OrderId,
    };
    final response = await http.get(
        uri,headers: {
      "Authorization": 'Bearer $AuthToken'
    }
    );
    int status = response.statusCode;
    print(status);
    return response;
  }

  Future<int> estimateDelivery(EstimateTime,OrderId, AuthToken, ) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.estimateDelivery);
    Map body = {
      "orderId": OrderId,
      "estimateTime":EstimateTime,
    };
    final response = await http.post(
        uri,body: jsonEncode(body),headers:  {'Content-type': 'application/json',
      "Authorization": 'Bearer $AuthToken', "Accept": "application/json"
    }
    );
    int status = response.statusCode;
    return status;
  }
  Future<int> estimatePickup( EstimateTime,OrderId, AuthToken,) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.estimatePickup);
    Map body = {
      "orderId": OrderId,
      "estimateTime":EstimateTime,
    };
    final response = await http.post(
        uri,body: jsonEncode(body),headers:  {'Content-type': 'application/json',
      "Authorization": 'Bearer $AuthToken', "Accept": "application/json"
    }
    );
    int status = response.statusCode;
    return status;
  }
  Future<int> pinVerification( Pin,OrderId, AuthToken, ) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.pinVerification);
    Map body = {
      "orderId": OrderId,
      "pin":Pin,
    };
    final response = await http.post(
        uri,body: jsonEncode(body),headers:  {'Content-type': 'application/json',
      "Authorization": 'Bearer $AuthToken', "Accept": "application/json"
    }
    );
    int status = response.statusCode;
    return status;
  }
  Future<int> orderDelivered( OrderId, AuthToken, ) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.orderDelivered);
    Map body = {
      "orderId":OrderId,};
    final response = await http.post(
        uri,body: jsonEncode(body),headers:  {'Content-type': 'application/json',
      "Authorization": 'Bearer $AuthToken', "Accept": "application/json"
    }
    );
    int status = response.statusCode;
    return status;
  }
  Future<int> orderDispach( OrderId,AuthToken,) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.orderDispach);
    Map body = {
      "orderId":OrderId,
    };
    final response = await http.post(
        uri,body: jsonEncode(body),headers:  {'Content-type': 'application/json',
      "Authorization": 'Bearer $AuthToken', "Accept": "application/json"
    }
    );
    int status = response.statusCode;
    return status;
  }
  Future<int> transportChoice(TransportChoice, AuthToken, ) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.transportChoice);
    Map body = {
      "transportChoice": TransportChoice,

    };
    final response = await http.post(uri,body:jsonEncode(body),headers:  {'Content-type': 'application/json',
      "Authorization": 'Bearer $AuthToken', "Accept": "application/json"
    }
    );
    int status = response.statusCode;
    return status;
  }
  Future<int> orderAssign(AuthToken) async {
    var uri = Uri.parse(Api.$BaseUrl+Endpoints.orderAssign);
    final response = await http.get(uri,headers:  {
          'Content-type': 'application/json',
      "Authorization": 'Bearer $AuthToken',
      "Accept": "application/json"
    });
    int status = response.statusCode;
    return status;
  }
  */


}
