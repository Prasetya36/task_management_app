import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../../data/controller/auth_controller.dart';

class PeopleYouMayKnow extends StatelessWidget {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        clipBehavior: Clip.antiAlias,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20, right: 20),
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const Image(
                  image: AssetImage(
                    'assets/images/avatar.png',
                  ),
                ),
              ),
              const Positioned(
                  bottom: 5,
                  left: 30,
                  child: Text(
                    'Jhosua Sitorus',
                    style: TextStyle(color: Colors.white),
                  )),
              Positioned(
                bottom: 0,
                right: 0,
                child: SizedBox(
                  height: 36,
                  width: 36,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Ionicons.add_circle_outline,
                    ),
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
