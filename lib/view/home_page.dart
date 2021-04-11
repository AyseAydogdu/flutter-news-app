import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/news_api.dart';
import 'package:news_app/view/category_news.dart';
import 'package:news_app/data/category_data.dart';
import 'package:news_app/view/news_tile.dart';
import 'package:news_app/provider/category_provider.dart';
import 'package:news_app/services/advert_services.dart';
import 'package:provider/provider.dart';

import '../model/category.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading;
  var newslist;
  final AdvertService _advertService = AdvertService();

  List<Category> categories = List<Category>();
  Category category;
  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;

    //DataProvider dataProvider = Provider.of<DataProvider>(context);
    //dataProvider.getCategoriesFromApi();
    setState(() {
      categories = getCategories();
    });

    getNews();
    super.initState();
    _advertService.showBanner();
    /* FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-5597815791177505~8828181786");
    _bannerAd = myBanner
      ..load()
      ..show(anchorType: AnchorType.bottom);*/
  }

  @override
  void dispose() {
    // _bannerAd.dispose();
    // myInterstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DataProvider dataProvider = Provider.of<DataProvider>(context);
    //dataProvider.getCategoriesFromApi();
    dataProvider.setCategories(categories);
    List<Category> category = dataProvider.getCategories();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Haberler",
              style: TextStyle(
                  color: Colors.blue[900], fontWeight: FontWeight.w600),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 70,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: category.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  dataProvider
                                      .setCurrentCategories(category[index]);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryNews(category[index])));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 14),
                                  child: Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        /*child: Container(
                                          width: 150,
                                          height: 60,
                                          child: Image.network(
                                            
                                              category[index].imageUrl),
                                        ),*/
                                        child: CachedNetworkImage(
                                          imageUrl: category[index].imageUrl,
                                          height: 60,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 60,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.black26),
                                        child: Text(
                                          category[index].name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              // return CategoryCard(
                              // category[index],
                              // imageAssetUrl: categories[index].imageUrl,
                              // categoryName: categories[index].name,
                              //  categoryId: categories[index].id,
                              //);
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: newslist.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                imgUrl: newslist[index].urlToImage ?? "",
                                title: newslist[index].title ?? "",
                                desc: newslist[index].description ?? "",
                                content: newslist[index].content ?? "",
                                posturl: newslist[index].url ?? "",
                              );
                            }),
                      ),
                      /*Container(
                        height: 90,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: NativeAdmob(
                          // Your ad unit id
                          adUnitID: _adUnitID,
                          numberAds: 3,
                          controller: _nativeAdController,
                          type: NativeAdmobType.banner,
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  // final String imageAssetUrl, categoryName, categoryId;
  Category categor;
//  CategoryCard({this.imageAssetUrl, this.categoryName, this.categoryId});
  CategoryCard(this.categor);
  @override
  Widget build(BuildContext context) {
    final DataProvider dataProvider = Provider.of<DataProvider>(context);
    dataProvider.getCategoriesFromApi();
    List<Category> category = dataProvider.getCategories();
    return GestureDetector(
      onTap: () {
        dataProvider.setCurrentCategories(categor);
        // Navigator.push(
        //   context, MaterialPageRoute(builder: (context) => CategoryNews()));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(categor.imageUrl),
              /* child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),*/
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: Text(
                categor.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
