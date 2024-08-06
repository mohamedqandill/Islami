import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
                context.setLocale(Locale("en"));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "englishTap".tr(),
                    style: TextStyle(color: Color(0xffB7935F), fontSize: 30),
                  ),
                  context.locale == Locale("en")
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
                context.setLocale(Locale("ar"));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "arabicTap".tr(),
                    style: TextStyle(color: Color(0xffB7935F), fontSize: 30),
                  ),
                  // Icon(Icons.done,size: 30,color: Colors.black,)
                  context.locale == Locale("ar")
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
