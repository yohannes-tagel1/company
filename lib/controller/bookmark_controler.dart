import 'package:get/get.dart';
// import 'package:qwee/controllers/company_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../model/model_page.dart';

class BookmarkController extends GetxController {
  var bookmarks = <Company>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  void addBookmark(Company company) {
    if (!bookmarks.any((c) => c.id == company.id)) {
      bookmarks.add(company);
      saveBookmarks();
    }
  }

  void removeBookmark(Company company) {
    bookmarks.removeWhere((c) => c.id == company.id);
    saveBookmarks();
  }

  Future<void> saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'bookmarks',
      jsonEncode(bookmarks.map((e) => e.toJson()).toList()),
    );
  }

  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('bookmarks');
    if (data != null) {
      bookmarks.value = (jsonDecode(data) as List)
          .map((e) => Company.fromJson(e))
          .toList();
    }
  }
}