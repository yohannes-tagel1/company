import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'company_list.dart';
import 'company_page.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text("company image "),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   child:Image.asset(
              //       'assets/images/componye.jpg'),
              // ),
              Container(
                child: Image.network("https://th.bing.com/th/id/OIP.pyUDznf5hZJSKWKcTOt7vAHaE7?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3"),
              height: 300,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed:(){
                    Get.to(CompanyList());
                  },
                  child: Text("Find Service"))
            ],
          ),

      ),
    );
  }
}
