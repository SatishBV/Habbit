import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habbit/Constants/styles.dart';
import 'authentication.dart';

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  String _email;
  String _password;
  String _errorMessage;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoginForm;
  bool _isLoading;

  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      return false;
    } else {
      _email = _emailController.text;
      _password = _passwordController.text;
      return true;
    }
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Email or password cannot be empty';
      });
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void resetForm() {
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Get started'),
      ),
      body: Stack(
        children: <Widget>[
          _showForm(),
          _showCircularProgress(),
        ],
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _showForm() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 120.0,
          ),
          showErrorMessage(),
          SizedBox(
            height: 20.0,
          ),
          showEmailInput(),
          showPasswordInput(),
          showPrimaryButton(),
          SizedBox(
            height: 20.0,
          ),
          showSecondaryButton(),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.red,
          height: 1.0,
          fontWeight: FontWeight.w300,
        ),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration().copyWith(
          hintText: 'Email',
          icon: new FaIcon(
            FontAwesomeIcons.envelope,
            color: kDarkBlueColor,
          ),
        ),
        controller: _emailController,
        onChanged: (value) {
          setState(() {
            _errorMessage = "";
          });
        },
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Password',
          icon: new FaIcon(
            FontAwesomeIcons.lock,
            color: kDarkBlueColor,
          ),
        ),
        controller: _passwordController,
        onChanged: (value) {
          setState(() {
            _errorMessage = "";
          });
        },
      ),
    );
  }

  Widget showSecondaryButton() {
    return SizedBox(
      height: 50.0,
      width: 300.0,
      child: new RaisedButton(
        elevation: 6.0,
        color: kDarkBlueColor,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        child: new Text(
          _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
          style: new TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: kWhiteColor,
          ),
        ),
        onPressed: toggleFormMode,
      ),
    );
  }

  Widget showPrimaryButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
      child: SizedBox(
        height: 50.0,
        width: 300,
        child: new RaisedButton(
          elevation: 6.0,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          color: kPapayaColor,
          child: new Text(
            _isLoginForm ? 'Login' : 'Create account',
            style: new TextStyle(
              fontSize: 20.0,
              color: kWhiteColor,
            ),
          ),
          onPressed: validateAndSubmit,
        ),
      ),
    );
  }
}
