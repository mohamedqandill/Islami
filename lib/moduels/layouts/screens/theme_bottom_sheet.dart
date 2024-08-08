import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = false;
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        // width: double.infinity,
        height: 180,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                pro.changeTheme(ThemeMode.light);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'light'.tr(),
                    style: TextStyle(
                        color: pro.mode == ThemeMode.light
                            ? Color(0xffB7935F)
                            : Colors.black,
                        fontSize: 30),
                  ),
                  pro.mode == ThemeMode.light
                      ? Icon(
                          Icons.done,
                          size: 30,
                          color: Colors.black,
                        )
                      : SizedBox()
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                pro.changeTheme(ThemeMode.dark);
                dark = true;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'darkTap'.tr(),
                    style: TextStyle(
                        color: pro.mode == ThemeMode.dark
                            ? Color(0xffB7935F)
                            : Colors.black,
                        fontSize: 30),
                  ),
                  pro.mode == ThemeMode.dark
                      ? Icon(
                          Icons.done,
                          size: 30,
                          color: Colors.black,
                        )
                      : SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
