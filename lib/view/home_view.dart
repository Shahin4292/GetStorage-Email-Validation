import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  var emailEditingController = TextEditingController();
  var storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Get Storage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              // decoration: InputDecoration(
              //   border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              // ),
              controller: emailEditingController,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (GetUtils.isEmail(emailEditingController.text)) {
                    storage.write('email', emailEditingController.text);
                  } else {
                    Get.snackbar(
                      "InCorrect Email",
                      "Provide Email and Valid Format",
                      colorText: Colors.white,
                      backgroundColor: Colors.red,
                      snackPosition: SnackPosition.TOP,
                    );
                  }
                },
                child: const Text("Write"),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  print("The email is ${storage.read('email')}");
                },
                child: const Text("Read"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
