import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scanner/backend/convert_csv.dart';
import 'package:scanner/constants/constants.dart';
import 'package:scanner/controller/registration_controller.dart';
import 'package:scanner/screens/certificates/certificates.dart';
import 'package:scanner/screens/food/fooddetails.dart';
import 'package:scanner/screens/home/registration/form/form.dart';
import 'package:scanner/screens/home/top_widget.dart';
import 'package:scanner/controller/person_controller.dart';
import 'package:scanner/screens/scanningPage/scanning_page.dart';
import 'package:scanner/widgets/user_container.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  PersonController personController = Get.put(PersonController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    personController.getUserList();
  }

  RegistrationController registrationController =
      Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: CommonPageColors.bgColor,
          padding:
              const EdgeInsets.only(top: 70, right: 16, left: 16, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopWidget(
                isCertificate: false,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "registeration page",
                style: TextStyle(
                  color: CommonPageColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const FormFieldCustom(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    registrationController.submit();
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: CommonPageColors.primaryBlue),
                    child: const Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
