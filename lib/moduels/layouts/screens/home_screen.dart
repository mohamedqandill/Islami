import 'package:flutter/material.dart';
import 'package:islami/core/widgets/bg_widget.dart';
import 'package:islami/moduels/layouts/screens/azkarSabah.dart';
import 'package:islami/moduels/layouts/screens/azkar_masaa.dart';
import 'package:islami/moduels/layouts/screens/nabi_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/my_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> doaa = [
    """اللهم إني أعوذ بك من زوال نعمتك، وتحول عافيتك وفجاءة نقمتك، وجميع سخطك”. أخرجه مسلم""",
    """اللهم إني أعوذ بك من البرص والجنون والجذام ومن سيئ الأسقام”. أخرجه أبو داود والنسائي"""
        """اللهم إني أعوذ بك من الفقر والقلة والذلة وأعوذ بك من أن أظلم أو أظلم”. أخرجه أبو داود والنسائي""",
    """اللهم إني أسألك بأني أشهد أنك أنت الله لا إله إلا أنت الأحد الصمد الذي لم يلد ولم يولد ولم يكن له كفوا أحد”. أخرجه الترمذي وابن ماجه""",
    """اللهم اجعل في قلبي نورا، وفي بصري نورا، وفي سمعي نورا، وعن يميني نورا، وعن يساري نورا، وفوقي نورا، وتحتي نورا، وأمامي نورا، وخلفي نورا، وعظم لي نورا”. أخرجه مسلم""",
    """اللهم أصلح لي ديني الذي هو عصمة أمري، وأصلح لي دنياي التي فيها معاشي، وأصلح لي آخرتي التي فيها معادي، واجعل الحياة زيادة لي في كل خير، واجعل الموت راحة لي من كل شر”. أخرجه مسلم""",
  ];

  int index = 0;
  double width = 200;

  @override
  Widget build(BuildContext context) {
    // bool isDark = AppTheme.isDark;
    var pro = Provider.of<MyProvider>(context);

    return bg_widget(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, left: 10, right: 10),
              padding: EdgeInsets.all(15),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  color: pro.mode == ThemeMode.dark
                      ? Colors.black12
                      : Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(60),
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffB7935F),
                      blurRadius: 30,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                  border: Border.all(color: Color(0xffB7935F), width: 3)),
              child: Expanded(
                  child: SingleChildScrollView(
                      child: Text(
                "${doaa[index]}",
                style: Theme.of(context).textTheme.bodyMedium,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ))),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(width, 60),
                  backgroundColor: pro.mode == ThemeMode.dark
                      ? Color(0xffFACC1D).withOpacity(0.5)
                      : Color(0xffB7935F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  elevation: 8,
                  shadowColor: Colors.amber),
              onPressed: () {
                index++;
                if (index == 5) {
                  index = 0;
                }
                setState(() {});
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "تغيير الدعاء",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Image(
                    image: AssetImage(
                      "assets/icons/icons8-swap-50.png",
                    ),
                    width: 40,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 120 / 50,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 20),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 50),
                          backgroundColor: pro.mode == ThemeMode.dark
                              ? Color(0xffFACC1D).withOpacity(0.5)
                              : Color(0xffB7935F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          elevation: 8,
                          shadowColor: Colors.amber),
                      onPressed: () {
                        Navigator.pushNamed(context, AzkarSabah.routeName);
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "اذكار الصباح ",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          // Image(image: AssetImage("assets/icons/icons8-swap-50.png",),width: 40,),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 50),
                        backgroundColor: pro.mode == ThemeMode.dark
                            ? Color(0xffFACC1D).withOpacity(0.5)
                            : Color(0xffB7935F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        elevation: 8,
                        shadowColor: Colors.amber),
                    onPressed: () {
                      Navigator.pushNamed(context, NabiScreen.routeName);
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "الصلاه علي النبي",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        // Image(image: AssetImage("assets/icons/icons8-swap-50.png",),width: 40,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 50),
                          backgroundColor: pro.mode == ThemeMode.dark
                              ? Color(0xffFACC1D).withOpacity(0.5)
                              : Color(0xffB7935F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          elevation: 8,
                          shadowColor: Colors.amber),
                      onPressed: () {
                        index++;
                        if (index == 5) {
                          index = 0;
                        }
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "مواقيت الصلاه",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          // Image(image: AssetImage("assets/icons/icons8-swap-50.png",),width: 40,),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 50),
                          backgroundColor: pro.mode == ThemeMode.dark
                              ? Color(0xffFACC1D).withOpacity(0.5)
                              : Color(0xffB7935F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          elevation: 8,
                          shadowColor: Colors.amber),
                      onPressed: () {
                        Navigator.pushNamed(context, AzkarMasaa.routeName);
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "اذكار المساء",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          // Image(image: AssetImage("assets/icons/icons8-swap-50.png",),width: 40,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
