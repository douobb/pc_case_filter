import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pc_case_filter/drawer_price.dart';
import 'package:pc_case_filter/introduction.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'EnterExitRoute.dart';
import 'drawer_search.dart';
import 'drawer_sort.dart';
import 'filter_drawer.dart';
import 'drawer_brand.dart';
import 'drawer_drives.dart';
import 'drawer_fans.dart';
import 'drawer_frontIO.dart';
import 'drawer_liquidCooling.dart';
import 'drawer_motherboard.dart';
import 'drawer_others.dart';
import 'drawer_sidePanel.dart';
import 'drawer_volume.dart';
import 'drawer_gpu&cpu.dart';
import 'package:firebase_database/firebase_database.dart';

List<PcCase> pcCaseFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, PcCase>(k, PcCase.fromJson(v))).entries.map((e) => e.value).toList();
class PcCase {
  String titles;
  String brands;
  double volume;
  double gpuLength;
  double cpuHeight;
  int motherboardCompatibility;
  int sfxPsu;
  int fansInsideCount;
  int fanSupportFront;
  int fanSupportBack;
  int fanSupportTop;
  int fanSupportBottom;
  int fanSupportSide;
  int lc120;
  int lc140;
  int lc240;
  int lc280;
  int lc360;
  int lc420;
  int ioU3;
  int ioU2;
  int ioTypeC;
  int ioHdmi;
  int ioSdReader;
  int drivesSupport25;
  int drivesSupport35;
  int cdSupport;
  int sidePanel;
  int fanHub;
  int verticalGPU;
  String images;
  String links;
  String gift;
  int price;
  String detail;

  PcCase({
    required this.titles,
    required this.brands,
    required this.volume,
    required this.gpuLength,
    required this.cpuHeight,
    required this.motherboardCompatibility,
    required this.sfxPsu,
    required this.fansInsideCount,
    required this.fanSupportFront,
    required this.fanSupportBack,
    required this.fanSupportTop,
    required this.fanSupportBottom,
    required this.fanSupportSide,
    required this.lc120,
    required this.lc140,
    required this.lc240,
    required this.lc280,
    required this.lc360,
    required this.lc420,
    required this.ioU3,
    required this.ioU2,
    required this.ioTypeC,
    required this.ioHdmi,
    required this.ioSdReader,
    required this.drivesSupport25,
    required this.drivesSupport35,
    required this.cdSupport,
    required this.sidePanel,
    required this.fanHub,
    required this.verticalGPU,
    required this.images,
    required this.links,
    required this.gift,
    required this.price,
    required this.detail,
  });

  factory PcCase.fromJson(Map<String, dynamic> json) => PcCase(
    titles: json["titles"],
    brands: json["brands"],
    volume: json["volume"].toDouble(),
    gpuLength: json["GPULength"].toDouble(),
    cpuHeight: json["CPUHeight"].toDouble(),
    motherboardCompatibility: json["motherboardCompatibility"],
    sfxPsu: json["sfxPSU"],
    fansInsideCount: json["fansInsideCount"],
    fanSupportFront: json["fanSupportFront"],
    fanSupportBack: json["fanSupportBack"],
    fanSupportTop: json["fanSupportTop"],
    fanSupportBottom: json["fanSupportBottom"],
    fanSupportSide: json["fanSupportSide"],
    lc120: json["LC120"],
    lc140: json["LC140"],
    lc240: json["LC240"],
    lc280: json["LC280"],
    lc360: json["LC360"],
    lc420: json["LC420"],
    ioU3: json["IO_U3"],
    ioU2: json["IO_U2"],
    ioTypeC: json["IO_TYPE_C"],
    ioHdmi: json["IO_HDMI"],
    ioSdReader: json["IO_SDReader"],
    drivesSupport25: json["drivesSupport25"],
    drivesSupport35: json["drivesSupport35"],
    cdSupport: json["CDSupport"],
    sidePanel: json["sidePanel"],
    fanHub: json["fanHub"],
    verticalGPU: json["verticalGPU"],
    images: json["images"],
    links: json["links"],
    gift: json["gift"],
    price: json["price"],
    detail: json["detail"],
  );
}
late List<PcCase> allCase;
List<PcCase> filterCase = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();
  FirebaseDatabase database = FirebaseDatabase.instance;

  Future<void> initCaseData() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.get();
    allCase = pcCaseFromJson(jsonEncode(snapshot.value));
  }

  void initFilterData(){
    searchWord = '';
    controllerSearchWord = TextEditingController();
    isSelectedSortMethod = [false, false, true];
    isSelectedBrand = List.generate(37, (index) => true);
    volumeMin = 0;
    volumeMax = 1000000;
    controllerVolumeMin = TextEditingController();
    controllerVolumeMax = TextEditingController();
    priceMin = 0;
    priceMax = 1000000;
    controllerPriceMin = TextEditingController();
    controllerPriceMax = TextEditingController();
    gpuLengthMin = 0;
    cpuHeightMin = 0;
    controllerGpuMin = TextEditingController();
    controllerCpuMin = TextEditingController();
    isSelectedMotherBoard = List.generate(4, (index) => true);
    isSelectedFans = List.generate(5, (index) => false);
    isSelectedLiquidCooling = List.generate(6, (index) => false);
    isSelectedFrontIO = List.generate(5, (index) => false);
    isSelectedDrives = List.generate(3, (index) => false);
    isSelectedSidePanel = List.generate(3, (index) => true);
    isATXPowerOnly = false;
    isFansInside = false;
    isFanHubInside = false;
    isAllowVerticalGPU = false;
  }

  Future<void> initAll() async {
    await initCaseData();
    initFilterData();
    filterCase = allCase;
    setState(() {});
  }

  void applyFilter(){
    setState(() {
      filterCase = filterCard(allCase, searchWord,isSelectedSortMethod, isSelectedBrand, volumeMin, volumeMax, priceMin, priceMax, gpuLengthMin, cpuHeightMin, isSelectedMotherBoard, isSelectedFans, isSelectedLiquidCooling, isSelectedFrontIO, isSelectedDrives, isSelectedSidePanel, isATXPowerOnly, isFansInside, isAllowVerticalGPU, isFanHubInside);
    });
  }

  void initFilter(){
    Fluttertoast.showToast(
        msg: "初始化",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        fontSize: 14.0,
        webBgColor: "linear-gradient(to right, #9a89c2, #9a89c2)",
        webPosition: "center"
    );
    initFilterData();
    setState(() {
      filterCase = allCase;
    });
  }

  List<PcCase> filterCard(List<PcCase> allCases, searchWord, isSelectedSortMethod, isSelectedBrand, volumeMin, volumeMax, priceMin, priceMax, gpuLengthMin, cpuHeightMin, isSelectedMotherBoard, isSelectedFans, isSelectedLiquidCooling, isSelectedFrontIO, isSelectedDrives, isSelectedSidePanel, isATXPowerOnly, isFansInside, isAllowVerticalGPU, isFanHubInside){
    List<PcCase> list = [];
    for (int i = 0; i < allCases.length; i++) {
      if((allCases[i].titles.toUpperCase()).contains(searchWord.toUpperCase())){
        if(isSelectedBrand[brandNames.indexOf(allCases[i].brands)]) {
          if(allCases[i].volume >= volumeMin && allCases[i].volume <= volumeMax) {
            if(allCases[i].price >= priceMin && allCases[i].price <= priceMax) {
              if(allCases[i].gpuLength >= gpuLengthMin && allCases[i].cpuHeight >= cpuHeightMin) {
                if(allCases[i].gpuLength >= gpuLengthMin && allCases[i].cpuHeight >= cpuHeightMin) {
                  if(isSelectedMotherBoard[allCases[i].motherboardCompatibility]) {
                    if(!((isSelectedFans[0] && allCases[i].fanSupportFront == 0)
                        || (isSelectedFans[1] && allCases[i].fanSupportBack == 0)
                        || (isSelectedFans[2] && allCases[i].fanSupportTop == 0)
                        || (isSelectedFans[3] && allCases[i].fanSupportBottom == 0)
                        || (isSelectedFans[4] && allCases[i].fanSupportSide == 0))) {
                      if(!((isSelectedLiquidCooling[0] && allCases[i].lc120 == 0)
                          || (isSelectedLiquidCooling[1] && allCases[i].lc140 == 0)
                          || (isSelectedLiquidCooling[2] && allCases[i].lc240 == 0)
                          || (isSelectedLiquidCooling[3] && allCases[i].lc280 == 0)
                          || (isSelectedLiquidCooling[4] && allCases[i].lc360 == 0)
                          || (isSelectedLiquidCooling[5] && allCases[i].lc420 == 0))) {
                        if(!((isSelectedFrontIO[0] && allCases[i].ioU3 == 0)
                            || (isSelectedFrontIO[1] && allCases[i].ioU2 == 0)
                            || (isSelectedFrontIO[2] && allCases[i].ioTypeC == 0)
                            || (isSelectedFrontIO[3] && allCases[i].ioHdmi == 0)
                            || (isSelectedFrontIO[4] && allCases[i].ioSdReader == 0))) {
                          if(!((isSelectedDrives[0] && allCases[i].drivesSupport35 == 0)
                              || (isSelectedDrives[1] && allCases[i].drivesSupport25 == 0)
                              || (isSelectedDrives[2] && allCases[i].cdSupport == 0))) {
                            if(isSelectedSidePanel[allCases[i].sidePanel]) {
                              if(!(isATXPowerOnly && allCases[i].sfxPsu == 1)) {
                                if(!(isFansInside && allCases[i].fansInsideCount == 0)) {
                                  if(!(isFanHubInside && allCases[i].fanHub == 0)) {
                                    if(!(isAllowVerticalGPU && allCases[i].verticalGPU == 0)) {
                                      list.add(allCases[i]);
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    if(isSelectedSortMethod[0]){
      if(isSelectedSortMethod[2]){
        list.sort((a, b) => a.price.compareTo(b.price));
      }else{
        list.sort((a, b) => b.price.compareTo(a.price));
      }
    }else if(isSelectedSortMethod[1]){
      if(isSelectedSortMethod[2]){
        list.sort((a, b) => a.volume.compareTo(b.volume));
      }else{
        list.sort((a, b) => b.volume.compareTo(a.volume));
      }
    }
    Fluttertoast.showToast(
        msg: "找到 ${list.length} 個機殼",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        fontSize: 14.0,
        webBgColor: "linear-gradient(to right, #9a89c2, #9a89c2)",
        webPosition: "center"
    );
    return list;
  }

  List<Widget> initCaseCard(List<PcCase> cases) {
    List<Widget> list = [];
    for (int i = 0; i < cases.length; i++) {
      list.add(SizedBox(
        child: Card(
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.all(10),
          elevation: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width < 500? (MediaQuery.of(context).size.width)/3 : 160),
                margin: const EdgeInsets.all(5),
                child: AspectRatio(
                  aspectRatio: 5 / 9,
                  child: Image.network(
                    cases[i].images,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        cases[i].titles,
                        style: const TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        cases[i].detail,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("價格：${cases[i].price}", style: const TextStyle(fontSize: 16),),
                              SizedBox(
                                child: (cases[i].links == "無" ? null
                                    : (MediaQuery.of(context).size.width < 500 ?
                                SizedBox(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(padding: EdgeInsets.zero,),
                                    child: const FaIcon(FontAwesomeIcons.boxOpen),
                                    onPressed: () {
                                      launchUrl(Uri.parse(cases[i].links), mode:LaunchMode.externalApplication);
                                    },
                                  ),
                                ) : SizedBox(
                                  child: OutlinedButton.icon(
                                    label: const Text("開箱討論"),
                                    icon: const FaIcon(FontAwesomeIcons.boxOpen),
                                    onPressed: () {
                                      launchUrl(Uri.parse(cases[i].links), mode: LaunchMode.externalApplication);
                                    },
                                  ),
                                ))),
                              )
                            ],
                          )
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: (cases[i].gift == "無"? null : Text( "* ${cases[i].gift}",style: const TextStyle(fontSize: 12),)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    }
    return list;
  }

  @override
  void initState() {
    initAll();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text('機殼篩選',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.filter_alt_outlined),
                onPressed: (){
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: "篩選條件",
              ),
            ),
            const SizedBox(width: 5,),
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: (){
                  Navigator.push(context,EnterExitRoute(exitPage: const HomePage(), enterPage: const Introduction()));
                },
                tooltip: "網站簡介",
              ),
            ),
            const SizedBox(width: 15,)
          ],
          toolbarHeight: 60,
          backgroundColor: const Color.fromARGB(255, 230, 225, 229),
        ),
        endDrawer: FilterDrawer(applyFilter:applyFilter, initFilter:initFilter),
        body: Align(
          child: SizedBox(
            child: ResponsiveGridList(
              controller: controller,
              desiredItemWidth: 500,
              children: initCaseCard(filterCase),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(side: BorderSide(color: Colors.transparent)),
          onPressed: () {
            controller.jumpTo(0);
          },
          tooltip: "移至頂端",
          child: const Icon(Icons.arrow_upward),
        )
    );
  }
}
