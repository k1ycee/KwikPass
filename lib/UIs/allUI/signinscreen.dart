import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:road_to_flutter/UIs/sharedUI/buttonUi.dart';
import 'package:road_to_flutter/shared/inputDecor.dart';
import 'package:road_to_flutter/shared/uihelpers.dart';
import 'package:road_to_flutter/view_models/sign_in_view_model.dart';



class SignIn extends StatelessWidget {
  Widget build(BuildContext context) {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    

    return ViewModelProvider<SignInViewModel>.withConsumer(
      viewModel: SignInViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InputField(
                  placeholder: 'Email',
                  controller: emailController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Password',
                  password: true,
                  controller: passwordController,
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BusyButton(
                      title: 'Login',
                      busy: model.busy,
                      onPressed: () {
                        model.signIn(emailController.text, passwordController.text);
                    },
                  )
                ],
              )
            ]
          ),
        )
      )
    );
  }
}