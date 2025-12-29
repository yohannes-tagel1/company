import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bookmark_controler.dart';


class Bookmark_page extends StatelessWidget {
  final BookmarkController controller = Get.put(BookmarkController());
  // final BookmarkController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: Obx(() {
        if (controller.bookmarks.isEmpty) {
          return const Center(child: Text('No bookmarks'));
        }

        return ListView.builder(
          itemCount: controller.bookmarks.length,
          itemBuilder: (context, index) {
            final company = controller.bookmarks[index];
            return ListTile(
              title: Text(company.name),
              subtitle: Text(company.industry),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  controller.removeBookmark(company);
                },
              ),
            );
          },
        );
      }),
    );
  }
}