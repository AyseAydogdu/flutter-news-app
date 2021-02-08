import 'package:news_app/model/category.dart';

List<Category> getCategories() {
  List<Category> categories = List<Category>();
  Category category;

  category = new Category();
  category.name = "business";
  category.imageUrl = "images/is.jpg";
  categories.add(category);

  category = new Category();
  category.name = "entertainment";
  category.imageUrl = "images/eglence.jpg";
  categories.add(category);

  category = new Category();
  category.name = "health";
  category.imageUrl = "images/saglik.jpg";
  categories.add(category);

  category = new Category();
  category.name = "science";
  category.imageUrl = "images/bilim.jpg";
  categories.add(category);

  category = new Category();
  category.name = "sports";
  category.imageUrl = "images/spor.jpg";
  categories.add(category);

  category = new Category();
  category.name = "technology";
  category.imageUrl = "images/teknoloji.jpg";
  categories.add(category);

  return categories;
}
