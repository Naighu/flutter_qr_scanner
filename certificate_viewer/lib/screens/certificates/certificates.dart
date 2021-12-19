import 'package:certificate_viewer/constants/constants.dart';
import 'package:certificate_viewer/controllers/person_controller.dart';
import 'package:certificate_viewer/screens/widgets/top_widget.dart';
import 'package:certificate_viewer/screens/widgets/user_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Certificate extends StatefulWidget {
  const Certificate({Key? key}) : super(key: key);

  @override
  _CertificateState createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  PersonController personController = Get.put(PersonController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    personController.getUserList();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: CommonPageColors.bgColor,
        padding:
            const EdgeInsets.only(top: 70, right: 16, left: 16, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopWidget(
              isCertificate: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Certificates",
              style: TextStyle(
                color: CommonPageColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            GetBuilder<PersonController>(builder: (context) {
              return Expanded(
                child: !personController.loading
                    ? GridView.count(
                        crossAxisCount: crosAxisCount(size.width),
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 8.0,
                        children: List.generate(
                            personController.userList.length, (index) {
                          return Center(
                            child: HomePaeContainer(
                              size: size,
                              index: index,
                            ),
                          );
                        }),
                      )
                    : SizedBox(),
              );
            }),
          ],
        ),
      ),
    );
  }

  int crosAxisCount(double width) {
    return (2 + ((width + 100) / 200).floor());
  }
}
