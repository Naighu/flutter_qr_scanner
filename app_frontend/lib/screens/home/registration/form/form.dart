import 'package:flutter/material.dart';
import 'package:scanner/constants/constants.dart';
import 'package:scanner/screens/home/registration/form/textfield.dart';

class FormFieldCustom extends StatefulWidget {
  const FormFieldCustom({Key? key}) : super(key: key);

  @override
  _FormFieldCustomState createState() => _FormFieldCustomState();
}

class _FormFieldCustomState extends State<FormFieldCustom> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 310,
      width: size.width - defaultPadding * 2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultPadding),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ]),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 60,
              width: size.width - defaultPadding * 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultPadding),
                    topRight: Radius.circular(defaultPadding)),
              ),
              child: TextFieldCustom(
                id: 0,
                isPass: false,
                prefixSvg: "assets/svg/user.svg",
                padding: defaultPadding,
                hintText: "name",
                width: size.width - defaultPadding * 2,
              )),
          Container(
              color: Colors.black.withOpacity(0.05),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 60,
              width: size.width - defaultPadding * 2,
              child: TextFieldCustom(
                id: 1,
                isPass: true,
                prefixSvg: "assets/svg/sem.svg",
                padding: defaultPadding,
                hintText: "sem",
                width: size.width - defaultPadding * 2,
              )),
          Container(
              // color: Colors.black.withOpacity(0.05),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 60,
              width: size.width - defaultPadding * 2,
              child: TextFieldCustom(
                id: 2,
                isPass: true,
                prefixSvg: "assets/svg/department.svg",
                padding: defaultPadding,
                hintText: "department",
                width: size.width - defaultPadding * 2,
              )),
          Container(
              color: Colors.black.withOpacity(0.05),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 60,
              width: size.width - defaultPadding * 2,
              child: TextFieldCustom(
                id: 3,
                isPass: true,
                prefixSvg: "assets/svg/college.svg",
                padding: defaultPadding,
                hintText: "college",
                width: size.width - defaultPadding * 2,
              )),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 60,
              width: size.width - defaultPadding * 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(defaultPadding),
                    bottomRight: Radius.circular(defaultPadding)),
              ),
              child: TextFieldCustom(
                id: 4,
                isPass: true,
                prefixSvg: "assets/svg/mobile.svg",
                padding: defaultPadding,
                hintText: "mobile",
                width: size.width - defaultPadding * 2,
              )),
        ],
      ),
    );
  }
}
