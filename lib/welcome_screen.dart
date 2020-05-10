import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:habbit/Views/text_field_view.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<Tab> authTabs = <Tab>[
    Tab(text: 'Sign in'),
    Tab(text: 'Sign up'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: authTabs.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text("Get started"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: authTabs,
          controller: _tabController,
          indicatorColor: Colors.white,
        ),
        bottomOpacity: 1,
      ),
      body: Center(
        child: AuthenticationForm(isSignIn: _tabController.index == 0),
      ),
    );
  }

  _handleTabSelection() {
    setState(() {});
  }
}

class AuthenticationForm extends StatelessWidget {
  final bool isSignIn;
  final emailTextController = TextEditingController();
  final passwordController = TextEditingController();

  AuthenticationForm({@required this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        HabbitTextField(
          borderColor: kGreenColor,
          controller: emailTextController,
          placeHolder: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 10.0,
        ),
        HabbitTextField(
          borderColor: kGreenColor,
          controller: passwordController,
          placeHolder: 'Password',
          obscureText: true,
        ),
        SizedBox(
          height: 40.0,
        ),
        RaisedButton(
          color: kGreenColor,
          child: isSignIn ? Text('Sign in') : Text('Sign up'),
          onPressed: () {},
        ),
        SizedBox(
          height: 20.0,
        ),
        Text('-OR-'),
        SizedBox(
          height: 20.0,
        ),
        _googleAuthentication()
      ],
    );
  }

  Widget _googleAuthentication() {
    final String buttonText =
        isSignIn ? 'Sign in with Google' : 'Sign up with Google';

    return OutlineButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: BorderSide(color: kGreenColor)
      ),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
          ],
        ),
      ),
    );
  }
}
