import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String mode = "Light";
  String language = "Arabic";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "mode",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: 280,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffB7935F),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black45, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.black45, width: 2),
                            )),
                        isExpanded: true,
                        padding: EdgeInsets.all(30),
                        dropdownColor: Color(0xffB7935F),
                        focusColor: Colors.grey.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(30),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 35,
                        ),
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        items: ["Light", "Dark"]
                            .map((e) => DropdownMenuItem(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text("$e"),
                                  ),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            mode = value!;
                          });
                        },
                        value: mode,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Language",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    SizedBox(
                      width: 280,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffB7935F),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black45, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.black45, width: 2),
                            )),
                        isExpanded: true,
                        padding: EdgeInsets.all(30),
                        dropdownColor: Color(0xffB7935F),
                        focusColor: Colors.grey.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(30),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 35,
                        ),
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        items: ["Arabic", "English"]
                            .map((e) => DropdownMenuItem(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text("$e"),
                                  ),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            language = value!;
                          });
                        },
                        value: language,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
