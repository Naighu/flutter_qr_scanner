import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scanner/constants/constants.dart';
import 'package:scanner/controller/registration_controller.dart';
import 'package:get/get.dart';
import 'package:scanner/screens/home/registration/registration.dart';

class TextFieldCustom extends StatefulWidget {
  final double? width;
  final String? hintText;
  final String? prefixSvg;
  final double? padding;
  final String? rules;
  final bool isPass;
  final int id;
  // final String Function(String?)? validateFun;
  const TextFieldCustom({
    required this.prefixSvg,
    this.padding,
    //this.validateFun,
    this.rules = "",
    this.hintText,
    this.width,
    Key? key,
    required this.isPass,
    required this.id,
  }) : super(key: key);

  @override
  TextFieldCustomState createState() => TextFieldCustomState();
}

class TextFieldCustomState extends State<TextFieldCustom> {
  final myController = TextEditingController();
  String text = "";
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  RegistrationController registrationController =
      Get.find<RegistrationController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        SvgPicture.asset(
          widget.prefixSvg!,
          height: 18,
          color: Theme.of(context).textTheme.bodyText1?.color,
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          width: widget.width == null
              ? size.width - 2 * widget.padding! - 70
              : widget.width! - 70,
          child: TextFormField(
            obscureText: widget.isPass,
            controller: myController,
            validator: (value) {
              if (value!.isEmpty) {
                print("empty");
                return 'Error Message';
              }
              return null;
            },
            onChanged: (value) {
              if (widget.id == 0) {
                registrationController.name = value.toString();
              } else if (widget.id == 1) {
                registrationController.sem = value.toString();
              } else if (widget.id == 2) {
                registrationController.department = value.toString();
              } else if (widget.id == 3) {
                registrationController.college = value.toString();
              } else if (widget.id == 4) {
                registrationController.mobile = value.toString();
              }
            },
            //validator: widget.validateFun!,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 16.sp),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
