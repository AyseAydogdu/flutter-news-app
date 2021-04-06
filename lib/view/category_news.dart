import 'package:flutter/material.dart';
import 'package:news_app/api/news_api.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/news_tile.dart';
import 'package:news_app/provider/category_provider.dart';
import 'package:news_app/services/advert_services.dart';
import 'package:provider/provider.dart';

class CategoryNews extends StatefulWidget {
  final Category newsCategory;

  CategoryNews(this.newsCategory);

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newslist;
  bool _loading = true;
  AdvertService advertService = AdvertService();
  //NewsForCategorie news = NewsForCategorie();
  // Category category = dataProvider.getCurrentCategories();
  @override
  void initState() {
    getNews();

    super.initState();
    advertService.showBanner();
  }

  void getNews() async {
    //final DataProvider dataProvider = Provider.of<DataProvider>(context);
    NewsForCategorie news = NewsForCategorie();
    // Category category = dataProvider.getCurrentCategories();
    await news.getNewsForCategory(widget.newsCategory.id);

    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DataProvider dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.newsCategory.name)),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Container(
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
              ),
            ),
    );
  }
}
