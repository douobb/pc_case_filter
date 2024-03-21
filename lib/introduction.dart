import 'package:flutter/material.dart';
import 'introduction_site.dart';
import 'introduction_myself.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<Introduction> {
  final List<Tab> myTabs = <Tab>[
    const Tab(child:Text('功能介紹',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    const Tab(child:Text('關於',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
  ];
  final pages = [const IntroductionSite(), const IntroductionMyself()];
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color textColor = Theme.of(context).primaryColorDark;
    final Color buttonColor = Theme.of(context).primaryColorLight;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Text('網站簡介',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor)),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_forward, color: textColor),
              onPressed: (){
                Navigator.of(context).pop();
              },
              tooltip: "返回",
            ),
          ),
          const SizedBox(width: 15,),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: const Color.fromRGBO(187, 189, 183, 1),
            height: 3.0,
          ),
        ),
        toolbarHeight: 60,
        backgroundColor: primaryColor,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          child: DefaultTabController(
            length: myTabs.length,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Material(
                    color: primaryColor,
                    child: Center(
                      child: SizedBox(
                        width: 1000,
                        child: TabBar(
                          dividerColor: primaryColor,
                          indicatorColor: buttonColor,
                          unselectedLabelColor: const Color.fromRGBO(126, 124, 126, 1),
                          labelColor: buttonColor,
                          tabs: myTabs,
                        ),
                      ),
                    )
                ),
              ),
              body: const TabBarView(
                children: <Widget>[IntroductionSite(), IntroductionMyself()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
