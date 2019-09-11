import 'dart:convert';

import 'package:devasthan_flutter_app/Models/auth_mode.dart';
import 'package:devasthan_flutter_app/Models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:http/http.dart' as http;

mixin ConnectedBloc on StatesRebuilder {
  User _authenticatedUser;
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  User get authenticateUser {
    return _authenticatedUser;
  }

  String loginurl =
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyA_TXGbvx5bm1w3OTVmM5al9MS87BLeI7k';
  String signUpUrl =
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyA_TXGbvx5bm1w3OTVmM5al9MS87BLeI7k';
}

mixin AuthenticationBloc on ConnectedBloc {
  Future<Map<String, dynamic>> authenticate(String email, String password,
      [AuthMode mode = AuthMode.Login]) async {
    _isLoading = true;
    rebuildStates(['authenticate']);
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    http.Response response;
    if (mode == AuthMode.Login) {
      response = await http.post(
        loginurl,
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'},
      );
    } else {
      response = await http.post(
        signUpUrl,
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'},
      );
    }

    final Map<String, dynamic> responseData = json.decode(response.body);
    bool hasError = true;
    String message = 'Something went wrong.';
    print(responseData);
    if (responseData.containsKey('idToken')) {
      hasError = false;
      message = 'Authentication succeeded!';
      _authenticatedUser = User(
          id: responseData['loginId'],
          email: email,
          token: responseData['idToken']);
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', responseData['idToken']);
      sharedPreferences.setString('email', email);
      sharedPreferences.setString('userID', responseData['localId']);
    } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
      message = 'This email already exists.';
    } else if (responseData['error']['message'] == 'EMAIL_NOT_FOUND') {
      message = 'This email was not found.';
    } else if (responseData['error']['message'] == 'INVALID_PASSWORD') {
      message = 'The password is invalid.';
    }
    _isLoading = false;
    rebuildStates(['authenticate']);
    return {'success': !hasError, 'message': message};
  }

  void autoAuthenticate() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String token = sharedPreferences.getString('token');
    if (token != null) {
      final String email = sharedPreferences.getString('email');
      final String userID = sharedPreferences.getString('userId');
      _authenticatedUser = User(id: userID, email: email, token: token);
      rebuildStates(['auth']);
    }
  }
}

mixin Read on ConnectedBloc {
  List<String> _readTitles = [
    "p.pu.shri ramkrushn kshirsagar maharaj",
    "Shri Ramkruhn Uvach",
    "vedant vidypith",
    "ved",
    "granthsampda",
    "Shri dutt devstan trust"
  ];

  List<String> get readTitles {
    return this._readTitles;
  }
}

mixin Listen on ConnectedBloc {
  List<String> _listenTitles = ["Namsmaran", "Strotre"];

  List<String> get listenTitles {
    return this._listenTitles;
  }
}

mixin Watch on ConnectedBloc {
  List<Map<String, String>> _watchList = [
    {
      'title': 'Shrimad Bhagvat Saptah',
      'part': 'Part 11',
      'author': 've. mu. shri. shrikrushnashatri,',
      'date': '12 march 2019'
    }
  ];

  List<Map<String, String>> get watchList {
    return this._watchList;
  }
}
