import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../constants/strings.dart';
import '../providers/providers.dart';
import 'terms_screen.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    final version = useState('');

    useEffect(() {
      // アプリのバージョンを取得する
      PackageInfo.fromPlatform().then((info) => version.value = info.version);
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SettingsList(
        lightTheme: SettingsThemeData(
          titleTextColor: Theme.of(context).textTheme.caption?.color,
          settingsTileTextColor: Theme.of(context).textTheme.bodyText1?.color,
          settingsListBackground: Theme.of(context).backgroundColor,
          settingsSectionBackground: Theme.of(context).cardColor,
          dividerColor: Theme.of(context).backgroundColor,
        ),
        sections: [
          SettingsSection(
            title: const Text('アプリ設定'),
            tiles: [
              SettingsTile(
                title: const Text('テーマ'),
                value: Icon(settings.theme == ThemeMode.light
                    ? Icons.light_mode
                    : Icons.dark_mode),
                onPressed: (context) =>
                    ref.read(settingProvider.notifier).toggleTheme(),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('要望・感想など'),
            tiles: [
              SettingsTile.navigation(
                title: const Text('アプリをレビュー'),
                // TODO: アプリIDを登録する
                onPressed: (context) => LaunchReview.launch(),
              ),
              SettingsTile.navigation(
                title: const Text('問い合わせ'),
                onPressed: (context) async {
                  if (await canLaunchUrlString(kGoogleFormURL)) {
                    await launchUrlString(kGoogleFormURL);
                  }
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text('アプリについて'),
            tiles: [
              SettingsTile(
                title: const Text('バージョン'),
                value: Text(version.value),
              ),
              SettingsTile.navigation(
                title: const Text('利用規約・プライバシーポリシー'),
                onPressed: (context) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsScreen(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
