import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:park_and_fly/ui/themes/theme_provider.dart';
import 'package:park_and_fly/providers/application_settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends HookConsumerWidget {
  // bool darkThemeEnabled = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var theme = ref.read(themeProvider);
    //final locale = ref.watch(localeProvider);
    //final localeState = useState(locale.currentLocale.languageCode);
    // final darkThemeEnabled = useState(theme.isDarkThemeEnabled);
    final applicationSettings = ref.watch(applicationSettingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsHeader),
      ),
      // backgroundColor: const Color(0xfff6f6f6),
      body: Center(
        child: Container(
          //constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              _SingleSection(
                title: AppLocalizations.of(context)!.general,
                children: [
                  _CustomListTile(
                    title: AppLocalizations.of(context)!.aboutApp,
                    icon: Icons.phone_android,
                    onClick: () {
                      context.go('/profile/settings/about');
                    },
                  ),
                  _CustomListTile(
                      title: AppLocalizations.of(context)!.darkModeToggle,
                      icon: Icons.nightlight_outlined,
                      trailing: Switch(
                          value: applicationSettings.isDarkModeEnabled,
                          onChanged: (value) {
                            applicationSettings.changeTheme();
                            // darkThemeEnabled.value = value;
                            // darkThemeEnabled.value
                            //     ? theme.toggleDark()
                            //     : theme.toggleLight();
                          })),
                  _CustomListTile(
                    title: AppLocalizations.of(context)!.languageSettings,
                    icon: Icons.language,
                    trailing: DropdownButton<String>(
                      value: applicationSettings.currentLocale.languageCode,
                      items: [
                        DropdownMenuItem<String>(
                            child: Text('🇺🇸 en'), value: 'en'),
                        DropdownMenuItem<String>(
                            child: Text('🇧🇬 bg'), value: 'bg'),
                        DropdownMenuItem<String>(
                            child: Text('🇷🇺 ru'), value: 'ru'),
                      ],
                      onChanged: (Object? value) {
                        // localeState.value = value.toString();
                        applicationSettings.changeLocale(value.toString());
                      },
                    ),
                    // onClick: ()  {
                    //   log('test');
                    //   context.go('/login');},
                  ),
                  _CustomListTile(
                    title: AppLocalizations.of(context)!.logOut,
                    icon: Icons.exit_to_app,
                    onClick: () {
                      log('test');
                      context.go('/login');
                    },
                  ),
                ],
              ),
              // const _SingleSection(
              //   title: "Privacy and Security",
              //   children: [
              //     _CustomListTile(
              //         title: "Multiple Users", icon: Icons.person_2),
              //     _CustomListTile(
              //         title: "Lock Screen", icon: Icons.lock),
              //     _CustomListTile(
              //         title: "Display", icon: Icons.light),
              //     _CustomListTile(
              //         title: "Sound and Vibration",
              //         icon: Icons.speaker),
              //     _CustomListTile(
              //         title: "Themes", icon: Icons.brush)
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final Function()? onClick;

  const _CustomListTile(
      {Key? key,
      required this.title,
      required this.icon,
      this.trailing,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing ?? const Icon(Icons.forward, size: 18),
      onTap: onClick,
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SingleSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title.toUpperCase(),
            style:
                Theme.of(context).textTheme.headline3?.copyWith(fontSize: 16),
          ),
        ),
        Container(
          width: double.infinity,
          // color: Colors.white,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
