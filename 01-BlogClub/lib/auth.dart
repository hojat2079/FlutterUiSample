import 'package:advance_ui_sevenlearn/gen/assets.gen.dart';
import 'package:advance_ui_sevenlearn/home.dart';
import 'package:advance_ui_sevenlearn/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  static const loginState = 0;
  static const signupState = 1;
  var selectAuthState = loginState;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 32),
              child: Assets.img.icons.logo.svg(width: 110),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: _themeData.colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              if (selectAuthState != loginState) {
                                setState(() {
                                  selectAuthState = loginState;
                                });
                              }
                            },
                            child: Text(
                              'Login'.toUpperCase(),
                              style: _themeData.textTheme.headline6?.apply(
                                  color: selectAuthState == loginState
                                      ? _themeData.colorScheme.onPrimary
                                      : _themeData.colorScheme.onPrimary
                                          .withAlpha(0x8A)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (selectAuthState != signupState) {
                                setState(() {
                                  selectAuthState = signupState;
                                });
                              }
                            },
                            child: Text('Sign up'.toUpperCase(),
                                style: _themeData.textTheme.headline6?.apply(
                                    color: selectAuthState == signupState
                                        ? _themeData.colorScheme.onPrimary
                                        : _themeData.colorScheme.onPrimary
                                            .withAlpha(0x8A))),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: _themeData.colorScheme.surface,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            )),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                            child: selectAuthState == loginState
                                ? _Login(themeData: _themeData)
                                : _SignUp(themeData: _themeData),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
    required ThemeData themeData,
  })  : _themeData = themeData,
        super(key: key);

  final ThemeData _themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back',
          style: _themeData.textTheme.headline4,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Sign in with your account',
          style: _themeData.textTheme.subtitle1?.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(
                  MediaQuery.of(context).size.width,
                  60,
                ),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          child: Text(
            'Login'.toUpperCase(),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forget your password?',
              style: _themeData.textTheme.subtitle1?.apply(fontSizeFactor: 0.8),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Reset here',
                style: _themeData.textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 0.8 * 18,
                    color: _themeData.colorScheme.primary),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            'or sign in with'.toUpperCase(),
            style: _themeData.textTheme.subtitle1?.apply(fontSizeFactor: 0.7),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    Key? key,
    required ThemeData themeData,
  })  : _themeData = themeData,
        super(key: key);

  final ThemeData _themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to Blog App',
          style: _themeData.textTheme.headline4,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Please Enter information for sign up',
          style: _themeData.textTheme.subtitle1?.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('Fullname'),
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(
                  MediaQuery.of(context).size.width,
                  60,
                ),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          child: Text(
            'Login'.toUpperCase(),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            'or sign up with'.toUpperCase(),
            style: _themeData.textTheme.subtitle1?.apply(fontSizeFactor: 0.7),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      enableSuggestions: false,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: const Text('Password'),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Text(
            obscureText ? 'Show' : 'Hide',
            style: TextStyle(
                fontSize: 14, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
