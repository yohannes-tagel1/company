import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model_page.dart';
import 'FeedbackScreen.dart';

class CompanyDetailScreen extends StatelessWidget {
  final Company company;

  const CompanyDetailScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 246, 234, 215),
      appBar: AppBar(
        title: Text(
          company.name,
          style: TextStyle(
            // color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: const Icon(Icons.business, size: 80)),
            const SizedBox(height: 16),

            Text(
              company.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text("CEO: ${company.ceoName}"),
            Text("Industry: ${company.industry}"),
            Text("Employees: ${company.employeeCount}"),
            Text("Market Cap: \$${company.marketCap}"),
            Text("Country: ${company.country}"),
            Text("Address: ${company.address}"),
            Text("ZIP: ${company.zip}"),
            Text("Domain: ${company.domain}"),
            SizedBox(height: 45),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                ),
                onPressed: () {
                  Get.to(FeedbackScreen());
                },
                child: const Text("Send Feedback"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}