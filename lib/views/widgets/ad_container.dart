import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdContainer extends HookWidget {
  const AdContainer({
    super.key,
    this.width,
    this.adSize = AdSize.fullBanner,
  });

  final double? width;
  final AdSize adSize;

  @override
  Widget build(BuildContext context) {
    final ad = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/2934735716',
      size: adSize,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );

    useEffect(() {
      ad.load();
      return () async => await ad.dispose();
    }, [ad]);

    final adWidget = AdWidget(ad: ad);

    return Container(
      color: Theme.of(context).backgroundColor,
      width: width ?? MediaQuery.of(context).size.width,
      height: ad.size.height.toDouble(),
      child: Center(child: adWidget),
    );
  }
}
