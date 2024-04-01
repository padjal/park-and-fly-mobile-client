import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:park_and_fly/ui/controllers/registration_view_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/user.dart';

class RegistrationView extends HookConsumerWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBusy = useState(false);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: !isBusy.value
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.email,
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.password,
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          //Create a user
                          isBusy.value = true;
                          var user = User(
                              email: "tester6@example.com",
                              password: "Password123!");
                          var isLoginSuccessful = await ref
                              .read(registrationViewControllerProvider.notifier)
                              .register(user);
                          if (isLoginSuccessful) {
                            isBusy.value = false;
                            context.go('/parkings');
                          } else {
                            isBusy.value = false;
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Could not register')));
                          }
                        },
                        child: Text(AppLocalizations.of(context)!.register),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                      ),
                    ),
                  ],
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
