import 'package:certificate_viewer/constants/constants.dart';
import 'package:certificate_viewer/controllers/person_controller.dart';
import 'package:certificate_viewer/screens/certificates/certificate_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePaeContainer extends StatelessWidget {
  HomePaeContainer({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);

  final Size size;
  final int index;

  @override
  PersonController personController = Get.find<PersonController>();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(CerficatePreview(user: personController.userList[index]));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: size.width / 3.6,
        width: size.width / 3.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CommonPageColors.white,
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(.05))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.width / (3.6 * 2) - 30,
            ),
            Text(
              personController.userList[index].name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CommonPageColors.textColor,
                fontSize: 13,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              personController.userList[index].college,
              style: TextStyle(
                color: CommonPageColors.textColor,
                decoration: TextDecoration.none,
                fontSize: 10,
              ),
            ),
            const Spacer(),
            Container(
              width: size.width / 3.6 - 50,
              height: 4,
              decoration: BoxDecoration(
                  color: const Color(0xffFF0236),
                  borderRadius: BorderRadius.circular(2)),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
