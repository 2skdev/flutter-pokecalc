import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'theme/theme.dart';
import 'views/pages/manage_theories.dart';
import 'views/pages/setting.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke Calc',
      debugShowCheckedModeBanner: false,
      theme: customTheme(ThemeMode.light),
      darkTheme: customTheme(ThemeMode.dark),
      themeMode: ThemeMode.dark,
      home: RootPage(),
    );
  }
}

enum Navs {
  home(
    icon: ImageIcon(AssetImage('assets/icon/icon-punch.png')),
    label: 'ポケモン',
    screen: ManageTheoriesPage(),
  ),

  setting(
    icon: Icon(Icons.settings),
    label: '設定',
    screen: SettingPage(),
  );

  const Navs({
    required this.icon,
    required this.label,
    required this.screen,
  });

  final Widget icon;
  final String label;
  final Widget screen;
}

class RootPage extends HookConsumerWidget {
  final _navigatorKeys = <Navs, GlobalKey<NavigatorState>>{};

  RootPage({super.key}) {
    for (var element in Navs.values) {
      _navigatorKeys[element] = GlobalKey<NavigatorState>();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navState = useState(Navs.home);

    return Scaffold(
      body: Stack(
        children: Navs.values
            .map(
              (nav) => Offstage(
                offstage: navState.value != nav,
                child: Navigator(
                  key: _navigatorKeys[nav],
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => nav.screen,
                  ),
                ),
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: Navs.values.indexOf(navState.value),
        items: Navs.values
            .map(
              (nav) => BottomNavigationBarItem(
                icon: nav.icon,
                label: nav.label,
              ),
            )
            .toList(),
        onTap: (index) {
          final newnav = Navs.values[index];

          if (newnav == navState.value) {
            _navigatorKeys[newnav]
                ?.currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            navState.value = newnav;
          }
        },
      ),
    );
  }
}
