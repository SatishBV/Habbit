import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:habbit/Views/text_field_view.dart';
import 'package:habbit/home_page.dart';

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
      appBar: new AppBar(
        title: new Text("Get started"),
        bottom: TabBar(
          unselectedLabelColor: kWhiteColor,
          labelColor: kPapayaColor,
          tabs: authTabs,
          controller: _tabController,
          indicatorColor: kPapayaColor,
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
          height: 15.0,
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
        SizedBox(
          height: 60.0,
          width: 200.0,
          child: RaisedButton(
            elevation: 2.0,
            color: kGreenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: isSignIn
                ? Text('Sign in', style: kHomePageCardTitle)
                : Text('Sign up', style: kHomePageCardTitle),
            onPressed: () {
              Navigator.pushNamed(context, HomePage.id);
            },
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        _googleAuthentication()
      ],
    );
  }

  Widget _googleAuthentication() {
    final String buttonText = isSignIn ? 'Sign in with ' : 'Sign up with ';

    return SizedBox(
      width: 200.0,
      height: 60.0,
      child: OutlineButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: kPapayaColor),
        ),
        highlightElevation: 4,
        borderSide: BorderSide(color: kBlackColor),
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
                  ),
                ),
              ),
              Image(
                image: AssetImage("assets/google_logo.png"),
                height: 35.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
