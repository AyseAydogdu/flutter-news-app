import 'package:flutter/cupertino.dart';
import 'package:news_app/model/category.dart';

class DataProvider extends ChangeNotifier {
  List<Category> categories = [];
  Category category;
  Category _currentCategory;

  setCategories(List<Category> value) {
    categories = value;
    notifyListeners();
  }

  setCurrentCategories(Category categry) {
    _currentCategory = categry;
    notifyListeners();
  }

  getCategories() {
    return categories;
  }

  getCurrentCategories() {
    return _currentCategory;
  }

  getCategoriesFromApi() {
    List<Category> category = getCategories();

    setCategories(category);
  }
}
