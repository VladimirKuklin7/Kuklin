import 'package:flutter/material.dart';
import 'router_utils.dart';
import 'package:flutter_app/auth_form_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APP_PAGE.auth.routePageTitle)),
      body:
      // Safe area prevents safe gards widgets to go beyond device edges
       SafeArea(
        //===========//
        // to dismiss keyword on tap outside use listener
        child: Listener(
          onPointerDown: (PointerDownEvent event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          //===========//
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(children: [
                // Display a welcome user image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/cat.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
                const AuthFormWidget()
              ]),
            ),
          ),
        ),
      ),
    );
  }
}