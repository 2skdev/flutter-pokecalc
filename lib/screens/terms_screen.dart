import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('利用規約とプライバシーポリシー')),
      body: SingleChildScrollView(
        child: Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'このアプリについて',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text(
                    'PokéCalc（以下、「本アプリ」といいます。）は、個人が運営しているアプリです。データに不具合があった際、損害等に関する保証はされません。'),
                const SizedBox(height: 20),
                Text(
                  'アプリに掲載されている広告について',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text(
                    '本アプリでは、第三者配信の広告サービス（Admob, nend, AdGeneration）を利用しています。このような広告配信業者は、利用者の興味に応じた商品やサービスの広告を表示するため、当アプリや他サイト・アプリへのアクセスに関する情報、Cookieを使用することがあります。'),
                const SizedBox(height: 20),
                Text(
                  '禁止事項',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text('本アプリに不適切な内容、不都合があった場合、開発者はいつでも改変・削除ができるものとします。'),
                const SizedBox(height: 20),
                Text(
                  '1. 個人情報の取り扱いについて',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text(
                    '個人情報とは、個人に関する情報であり、当該情報に含まれる氏名、生年月日その他記述等により個人を識別することができるもの（他の情報と容易に照合することができ、それにより個人を識別することができることとなるものを含む。）を指します。'),
                const Text(
                    'このアプリでは、開発者への送信は一切行いません。お客さまの端末で全て完結するようになっております。よって、開発者はお客様の登録情報は一切もたない設計となります。'),
                const SizedBox(height: 20),
                Text(
                  '2. 個人情報の提供について',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text('アプリ内に収集した個人情報を外部に提供する事は一切ございません。'),
                const SizedBox(height: 20),
                Text(
                  '3. プライバシーポリシーの更新について',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text(
                    '本アプリでは、プライバシーポリシーを変更する場合があります。プライバシーポリシーに関する重要な変更がある場合には、アプリ上での告知を行います。'),
                const SizedBox(height: 20),
                Text(
                  '4. データ解析',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text(
                    'アプリの利便性向上のため、匿名で、個人を特定できない範囲でアクセス解析をしております。例えば、アプリがクラッシュした時、どの部分でクラッシュしたかを匿名で送信し、バグの素早い修正に役立たせております。また、デバイスやアプリバージョンの使用率、特定の機能の使用率などを解析し、アプリの改善に役立てています。'),
                const SizedBox(height: 20),
                Text(
                  '5. 免責条項',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text(
                    '利用者が本アプリを利用して生じた損害に関して、開発者は一切の責任を負わないものとします。万が一のデータの消失なども補填できません。'),
                const SizedBox(height: 20),
                Text(
                  '6. 問い合わせ',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text('問い合わせに関しては、本アプリ内の問い合わせよおりお願いします。'),
                const Text('内容によっては返信いたしかねることもありますので、ご了承ください。'),
                const SizedBox(height: 20),
                Text(
                  '7. アプリ内のコンテンツについて',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text('本アプリで使用しているゲーム画像の著作権および商標権、その他一切の権利は以下に帰属します。'),
                const Text(
                    '©2023 Pokémon. ©1995-2023 Nintendo/Creatures Inc. /GAME FREAK inc.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
