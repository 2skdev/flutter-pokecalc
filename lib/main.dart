import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/providers.dart';
import 'screens/parties_screen.dart';
import 'screens/setting_screen.dart';
import 'screens/theories_screen.dart';
import 'theme/theme.dart';
import 'widgets/ad_container_widget.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // AdMob
  MobileAds.instance.initialize();
  // splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  /// Providerの読み込み待ちをする
  Future init(WidgetRef ref) async {
    // final pref = await SharedPreferences.getInstance();
    // pref.clear();

    await ref.read(settingProvider.notifier).init();
    await ref.read(partyListProvider.notifier).init();
    await ref.read(theoryListProvider.notifier).init();
    await ref.read(enemyListProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);

    // 起動時にSharedPreferenceの読み込みを行う
    useEffect(() {
      init(ref).then((value) async {
        // 読み込み完了後、テーマ判明まで待つ
        await Future<void>.delayed(const Duration(milliseconds: 500));
        FlutterNativeSplash.remove();
      });
      return null;
    }, []);

    return MaterialApp(
      title: 'Poke Calc',
      debugShowCheckedModeBanner: false,
      theme: customTheme(ThemeMode.light),
      darkTheme: customTheme(ThemeMode.dark),
      themeMode: settings.theme,
      home: RootPage(),
    );
  }
}

enum Navs {
  home(
    icon: ImageIcon(AssetImage('assets/icon/icon-punch.png')),
    label: 'ポケモン',
    screen: TheoriesScreen(),
  ),

  party(
    icon: ImageIcon(AssetImage('assets/icon/icon-dex.png')),
    label: 'パーティ',
    screen: PartiesScreen(),
  ),

  setting(
    icon: Icon(Icons.settings),
    label: '設定',
    screen: SettingScreen(),
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
        children: [
          ...Navs.values
              .map(
                (nav) => Padding(
                  // バナー広告で隠れるので、下にパディングを入れる
                  padding: const EdgeInsets.only(bottom: 64),
                  child: Offstage(
                    offstage: navState.value != nav,
                    child: Navigator(
                      key: _navigatorKeys[nav],
                      onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => nav.screen,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          const Positioned(
            bottom: 0,
            child: AdContainerWidget(),
          ),
        ],
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
