import 'package:firebase_admob/firebase_admob.dart';

class AdvertService {
  static final AdvertService _instance = AdvertService._internal();
  factory AdvertService() => _instance;
  MobileAdTargetingInfo _targetingInfo;
  final String _bannerAd = "ca-app-pub-5597815791177505/3899288736";
  final String _interstitialAd = "ca-app-pub-5597815791177505/8262039723";
  AdvertService._internal() {
    _targetingInfo = MobileAdTargetingInfo(
      // keywords: <String>['malaysia', 'uber', 'sports'],
      // contentUrl: 'https://www.wcrop.com',
      nonPersonalizedAds: true,
    );
  }

  showBanner() {
    BannerAd bannerAd = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.fullBanner,
      // size: AdSize.smartBanner,
      targetingInfo: _targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );

    bannerAd
      ..load()
      ..show(
          // anchorOffset: 50,
          );

    bannerAd.dispose();
  }

  showInterstitial() {
    InterstitialAd interstitialAd = InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: _targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );

    interstitialAd
      ..load()
      ..show();

    interstitialAd.dispose();
  }
}
