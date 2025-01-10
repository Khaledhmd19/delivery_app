import 'package:delivery_app/controllers/account_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AccountSetup extends StatelessWidget {
  AccountSetup({super.key});
  final AccountSetupCotroller controller = Get.put((AccountSetupCotroller()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Account Setup",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              Center(
                child: Stack(children: [
                  Obx(() {
                    return CircleAvatar(
                    radius: 80,
                    backgroundImage: controller.selectedImage.value != null
                        ? FileImage(controller.selectedImage.value!)
                        : null,
                    backgroundColor: Colors.black,
                  );
                  }),
                  
                  const Padding(
                      padding: EdgeInsets.only(top: 108.0, left: 118.0),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 110.0, left: 120.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0xffF87C47),
                      child: IconButton(
                        onPressed: controller.pickImage,
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      GetBuilder<AccountSetupCotroller>(builder: (_) {
                        return TextFormField(
                          controller: controller.firstNameController,
                          decoration: InputDecoration(
                              labelText: "First Name",
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              hintText: "First name",
                              errorText: controller.errorFristName.value),
                          
                        );
                      }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GetBuilder<AccountSetupCotroller>(builder: (_) {
                        return TextFormField(
                          controller: controller.lastNameController,
                          decoration: InputDecoration(
                              labelText: "Last Name",
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              hintText: "Last Name",
                              errorText: controller.errorLastName.value),
                          
                        );
                      }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GetBuilder<AccountSetupCotroller>(builder: (_) {
                        return TextFormField(
                          controller: controller.locationController,
                          decoration: InputDecoration(
                              labelText: "Location",
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              hintText: "Damascus",
                              errorText: controller.errorLocation.value),
                          
                        );
                      }),
                      const SizedBox(
                        height: 30.0,
                      ),
                       ElevatedButton(
                            onPressed: controller.validateInput,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffF87C47),
                                minimumSize: const Size(double.infinity, 60),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                )),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            )),
                      
                    ],
                  )),
            ]),
          ),
        ));
  }
}
