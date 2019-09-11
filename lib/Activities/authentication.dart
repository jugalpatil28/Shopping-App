import 'package:devasthan_flutter_app/Models/auth_mode.dart';
import 'package:devasthan_flutter_app/StateRebuilder/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class Auth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  AuthMode _authMode = AuthMode.Login;

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'E-Mail', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      controller: _controller,
      validator: (value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password invalid';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Confirm Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      validator: (String value) {
        if (_controller.text != value) {
          return 'Confirm Password not matching';
        } else {
          return null;
        }
      },
    );
  }

  void _submitForm(Function authenticate) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Map<String, dynamic> successInformation;
    successInformation = await authenticate(
        _formData['email'], _formData['password'], _authMode);
    if (successInformation['success']) {
      Navigator.pushReplacementNamed(context, '/homepage');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('An Error Occurred!'),
            content: Text(successInformation['message']),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: buildAuthenticationPage(targetWidth),
    );
  }

  Center buildAuthenticationPage(double targetWidth) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: targetWidth,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _buildEmailTextField(),
                SizedBox(
                  height: 10.0,
                ),
                _buildPasswordTextField(),
                SizedBox(
                  height: 10.0,
                ),
                _authMode == AuthMode.Login
                    ? Container()
                    : _buildConfirmPasswordTextField(),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  child: Text(
                      'Switch to ${_authMode == AuthMode.Login ? 'SignUp' : 'Login'}'),
                  onPressed: () {
                    setState(
                      () {
                        _authMode = _authMode == AuthMode.Login
                            ? AuthMode.SignUp
                            : AuthMode.Login;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                StateBuilder(
                  tag: 'authenticate',
                  blocs: [mainBloc],
                  builder: (BuildContext context, String tagId) {
                    return mainBloc.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          )
                        : RaisedButton(
                            textColor: Colors.white,
                            child: Text(_authMode == AuthMode.Login
                                ? 'LOGIN'
                                : 'SIGNUP'),
                            onPressed: () => _submitForm(mainBloc.authenticate),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
