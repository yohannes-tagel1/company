import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bookmark_controler.dart';
import '../controller/company_controler.dart';
import 'bookmarke.dart';
import 'company_page.dart';

class CompanyList extends StatelessWidget {
  CompanyList({super.key});

  CompanyController controller = Get.put(CompanyController());
  // final CompanyController controller = Get.find<CompanyController>();
  BookmarkController bookmarkController = Get.put(BookmarkController());
  // BookmarkController bookmarkController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'Company',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Obx(
                () => Badge(
              backgroundColor: Colors.red,
              label: Text('${bookmarkController.bookmarks.length}'),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.to(Bookmark_page());
                  },
                  icon: Icon(Icons.bookmark),
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        return ListView.builder(
          itemCount: controller.companies.length,
          itemBuilder: (context, index) {
            final company = controller.companies[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(company.name[0]),
                backgroundColor: const Color.fromARGB(255, 255, 189, 45),
              ),
              title: Text(company.name),
              subtitle: Text(company.industry),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      bookmarkController.addBookmark(company);
                    },
                    icon: Icon(Icons.bookmark_add),
                  ),

                  IconButton(
                    onPressed: () {
                      Get.to(() => CompanyDetailScreen(company: company));
                    },
                    icon: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}