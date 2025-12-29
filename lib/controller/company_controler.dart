import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../service/api_data.dart';
import '../model/model_page.dart';

class CompanyController extends GetxController {
  final Company_service service = Company_service();

  var companies = <Company>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // loadCompaniesFromPrefs();
    fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    try {
      isLoading.value = true;
      final result = await service.fetchCompanies();
      companies.value = result;
      saveCompaniesToPrefs(result);
    } catch (e) {
      errorMessage.value = 'Failed to load companies';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveCompaniesToPrefs(List<Company> companyList) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString = jsonEncode(
      companyList.map((e) => e.toJson()).toList(),
    );
    await prefs.setString('companies', jsonString);
  }

// Future<void> loadCompaniesFromPrefs() async {
//   final prefs = await SharedPreferences.getInstance();
//   final String? jsonString = prefs.getString('companies');

//   if (jsonString != null) {
//     final List<dynamic> jsonList = jsonDecode(jsonString);
//     companies.value = jsonList.map((e) => Company.fromJson(e)).toList();
//   }
// }
}