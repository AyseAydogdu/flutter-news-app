import 'package:news_app/model/category.dart';

List<Category> getCategories() {
  List<Category> categories = List<Category>();
  Category category;

  category = new Category();
  category.id = "business";
  category.name = "İş";
  category.imageUrl =
      "https://c.pxhere.com/images/72/46/5b459796371164025822cd717deb-1447017.jpg!d";
  categories.add(category);

  category = new Category();
  category.id = "entertainment";
  category.name = "Eğlence";
  category.imageUrl =
      "https://c.pxhere.com/photos/d7/40/audience_crowd_dancing_facial_expression_fashion_girls_group_happy-1553797.jpg!d";
  categories.add(category);

  category = new Category();
  category.id = "health";
  category.name = "Sağlık";
  category.imageUrl =
      "https://cdn.pixabay.com/photo/2017/08/20/16/18/health-2662312_960_720.jpg";
  categories.add(category);

  category = new Category();
  category.id = "science";
  category.name = "Bilim";
  category.imageUrl =
      "https://cdn.pixabay.com/photo/2016/02/06/09/56/science-1182713_960_720.jpg";
  categories.add(category);

  category = new Category();
  category.id = "sports";
  category.name = "Spor";
  category.imageUrl =
      "https://cdn.pixabay.com/photo/2017/08/13/08/32/sports-2636539_960_720.jpg";
  categories.add(category);

  category = new Category();
  category.name = "technology";
  category.name = "Teknoloji";
  category.imageUrl =
      "https://cdn.pixabay.com/photo/2019/03/30/16/06/technology-4091432_960_720.png";
  categories.add(category);

  return categories;
}
