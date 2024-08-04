import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:islami/core/widgets/bg_widget.dart';
import 'package:islami/moduels/hadeth_models.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "hadethDetails";

  HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  bool isDark = AppTheme.isDark;

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as hadethModel;

    return bg_widget(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
                setState(() {});
              },
              child: Icon(
                Icons.arrow_back,
              )),
          title: Column(
            children: [
              Text(
                "${model.title}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: isDark ? Color(0xff141A2E) : Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffB7935F),
                  blurRadius: 30,
                  blurStyle: BlurStyle.outer,
                ),
              ],
              border: Border.all(color: Color(0xffB7935F), width: 3)),
          child: ListView.builder(
            itemCount: model.content.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    textDirection: TextDirection.rtl,
                    "${model.content[index]}",
                    style: isDark
                        ? Theme.of(context).textTheme.bodyLarge
                        : Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
