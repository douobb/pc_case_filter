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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: const Text('網站簡介',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: (){
                Navigator.of(context).pop();
              },
              tooltip: "返回",
            ),
          ),
          const SizedBox(width: 15,),
        ],
        toolbarHeight: 60,
        backgroundColor: const Color.fromARGB(255, 230, 225, 229),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 1000,
          child: DefaultTabController(
            length: myTabs.length,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Material(
                    color: Colors.white,
                    child: TabBar(
                      dividerColor: Colors.black12,
                      indicatorColor: const Color.fromRGBO(103, 80, 164, 1),
                      unselectedLabelColor: Colors.black45,
                      labelColor: const Color.fromRGBO(103, 80, 164, 1),
                      tabs: myTabs,
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
