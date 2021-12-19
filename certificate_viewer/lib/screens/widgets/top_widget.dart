import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    required this.isCertificate,
    Key? key,
  }) : super(key: key);
  final bool isCertificate;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SvgPicture.asset(
                isCertificate
                    ? "assets/svg/certificateImg.svg"
                    : "assets/svg/img.svg",
                height: 200,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
