import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokecalc/providers/providers.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNofifier);

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
                    ref.read(settingsNofifier.notifier).toggleTheme(),
              ),
              SettingsTile.navigation(
                title: const Text('サブスクリプション'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('要望・感想など'),
            tiles: [
              SettingsTile.navigation(
                title: const Text('アプリをレビュー'),
              ),
              SettingsTile.navigation(
                title: const Text('問い合わせ'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('アプリについて'),
            tiles: [
              SettingsTile(
                title: const Text('バージョン'),
                value: const Text('1.0.0'),
              ),
              SettingsTile.navigation(
                title: const Text('利用規約'),
              ),
              SettingsTile.navigation(
                title: const Text('プライバシーポリシー'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
