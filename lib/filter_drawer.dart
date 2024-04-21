import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pc_case_filter/drawer_gpu.dart';
import 'package:pc_case_filter/drawer_length.dart';
import 'drawer_brand.dart';
import 'drawer_fansInside.dart';
import 'drawer_cpu.dart';
import 'drawer_price.dart';
import 'drawer_sort.dart';
import 'drawer_volume.dart';
import 'drawer_motherboard.dart';
import 'drawer_fans.dart';
import 'drawer_liquidCooling.dart';
import 'drawer_frontIO.dart';
import 'drawer_drives.dart';
import 'drawer_sidePanel.dart';
import 'drawer_others.dart';
import 'drawer_search.dart';

class FilterDrawer extends StatefulWidget {
  final Function() applyFilter;
  final Function() initFilter;
  const FilterDrawer({super.key, required this.applyFilter, required this.initFilter});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();

}

class _FilterDrawerState extends State<FilterDrawer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color textColor = Theme.of(context).primaryColorDark;
    final Color buttonColor = Theme.of(context).primaryColorLight;
    final Color dividerColor = Theme.of(context).dividerColor;
    return Drawer(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DrawerSearch(),
                    DrawerSort(),
                    DrawerBrand(),
                    DrawerVolume(),
                    DrawerLength(),
                    DrawerPrice(),
                    DrawerCpu(),
                    DrawerGpu(),
                    DrawerMotherBoard(),
                    DrawerFans(),
                    DrawerLiquidCooling(),
                    DrawerFrontIO(),
                    DrawerDrives(),
                    DrawerSidePanel(),
                    DrawerFansInside(),
                    DrawerOthers()
                  ],
                ),
              )
            ),
            SizedBox(
              height: 60,
              child: Scaffold(
                appBar: AppBar(
                  scrolledUnderElevation: 0,
                  title: Row(
                    children: [
                      const SizedBox(width: 10,),
                      Text("篩選",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor),),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(dividerColor),
                      ),
                      onPressed: (){
                        searchWord = controllerSearchWord.text;
                        try{
                          if(controllerVolumeMin.text != '') {
                            volumeMin = double.parse(controllerVolumeMin.text);
                          } else {
                            volumeMin = 0;
                          }
                        }catch(error){
                          controllerVolumeMin.text = '';
                          Fluttertoast.showToast(
                              msg: "請輸入有效數字 -體積 min",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              fontSize: 14.0,
                              webBgColor: "linear-gradient(to right, #6750a4, #6750a4)",
                              webPosition: "center"
                          );
                        }
                        try{
                          if(controllerVolumeMax.text != '') {
                            volumeMax = double.parse(controllerVolumeMax.text);
                          } else {
                            volumeMax = 1000000;
                          }
                        }catch(error){
                          controllerVolumeMax.text = '';
                          Fluttertoast.showToast(
                              msg: "請輸入有效數字 -體積 max",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              fontSize: 14.0,
                              webBgColor: "linear-gradient(to right, #6750a4, #6750a4)",
                              webPosition: "center"
                          );
                        }
                        try{
                          if(controllerGpuMin.text != '') {
                            gpuLengthMin = double.parse(controllerGpuMin.text);
                          } else {
                            gpuLengthMin = 0;
                          }
                        }catch(error){
                          controllerGpuMin.text = '';
                          Fluttertoast.showToast(
                              msg: "請輸入有效數字 -GPU min",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              fontSize: 14.0,
                              webBgColor: "linear-gradient(to right, #6750a4, #6750a4)",
                              webPosition: "center"
                          );
                        }
                        try{
                          if(controllerGpuMax.text != '') {
                            gpuLengthMax = double.parse(controllerGpuMax.text);
                          } else {
                            gpuLengthMax = 100;
                          }
                        }catch(error){
                          controllerGpuMax.text = '';
                          Fluttertoast.showToast(
                              msg: "請輸入有效數字 -GPU max",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              fontSize: 14.0,
                              webBgColor: "linear-gradient(to right, #6750a4, #6750a4)",
                              webPosition: "center"
                          );
                        }
                        try{
                          if(controllerCpuMin.text != '') {
                            cpuHeightMin = double.parse(controllerCpuMin.text);
                          } else {
                            cpuHeightMin = 0;
                          }
                        }catch(error){
                          controllerCpuMin.text = '';
                          Fluttertoast.showToast(
                              msg: "請輸入有效數字 -CPU min",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              fontSize: 14.0,
                              webBgColor: "linear-gradient(to right, #6750a4, #6750a4)",
                              webPosition: "center"
                          );
                        }
                        try{
                          if(controllerCpuMax.text != '') {
                            cpuHeightMax = double.parse(controllerCpuMax.text);
                          } else {
                            cpuHeightMax = 100;
                          }
                        }catch(error){
                          controllerCpuMax.text = '';
                          Fluttertoast.showToast(
                              msg: "請輸入有效數字 -CPU max",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              fontSize: 14.0,
                              webBgColor: "linear-gradient(to right, #6750a4, #6750a4)",
                              webPosition: "center"
                          );
                        }
                        try{
                          if(controllerlenght1Max.text != '') {
                            lenght1Max = double.parse(controllerlenght1Max.text);
                          } else {
                            lenght1Max = 100;
                          }
                        }catch(error){
                          controllerlenght1Max.text = '';
                          Fluttertoast.showToast(
                              msg: "請輸入有效數字 -最長邊",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              fontSize: 14.0,
                              webBgColor: "linear-gradient(to right, #6750a4, #6750a4)",
                              webPosition: "center"
                          );
                        }
                        try{
                          if(controllerlenght2Max.text != '') {
                            lenght2Max = double.parse(controllerlenght2Max.text);
                          } else {
                            lenght2Max = 100;
                          }
                        }catch(error){
                          controllerlenght2Max.text = '';
                          Fluttertoast.showToast(
                              msg: "請輸入有效數字 -次長邊",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              fontSize: 14.0,
                              webBgColor: "linear-gradient(to right, #6750a4, #6750a4)",
                              webPosition: "center"
                          );
                        }
                        try{
                          if(controllerlenght3Max.text != '') {
                            lenght3Max = double.parse(controllerlenght3Max.text);
                          } else {
                            lenght3Max = 100;
                          }
                        }catch(error){
                          controllerlenght3Max.text = '';
                          Fluttertoast.showToast(
                              msg: "請輸入有效數字 -短邊",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              fontSize: 14.0,
                              webBgColor: "linear-gradient(to right, #6750a4, #6750a4)",
                              webPosition: "center"
                          );
                        }
                        if(controllerPriceMin.text != '') {
                          priceMin = int.parse(controllerPriceMin.text);
                        } else {
                          priceMin = 0;
                        }
                        if(controllerPriceMax.text != '') {
                          priceMax = int.parse(controllerPriceMax.text);
                        } else {
                          priceMax = 1000000;
                        }
                        if(controllerDrives25.text != '') {
                          drives25 = int.parse(controllerDrives25.text);
                        } else {
                          drives25 = 0;
                        }
                        if(controllerDrives35.text != '') {
                          drives35 = int.parse(controllerDrives35.text);
                        } else {
                          drives35 = 0;
                        }
                        if(controllerDrives525.text != '') {
                          drives525 = int.parse(controllerDrives525.text);
                        } else {
                          drives525 = 0;
                        }
                        widget.applyFilter();
                        Navigator.pop(context);
                      },
                      child: Text("套用",style: TextStyle(fontSize: 16, color: buttonColor),),
                    ),
                    const SizedBox(width: 10,),
                    ElevatedButton(
                      style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(dividerColor),
                      ),
                      onPressed: (){
                        widget.initFilter();
                        Navigator.pop(context);
                      },
                      child: Text("初始化",style: TextStyle(fontSize: 16, color: buttonColor),),
                    ),
                    const SizedBox(width: 10,),
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
              ),
            )
          ],
        )
    );
  }
}
