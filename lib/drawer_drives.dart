import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late int drives25;
late int drives35;
late int drives525;
late TextEditingController controllerDrives25;
late TextEditingController controllerDrives35;
late TextEditingController controllerDrives525;

class DrawerDrives extends StatefulWidget {
  const DrawerDrives({super.key});

  @override
  State<DrawerDrives> createState() => _DrawerDrivesState();
}

class _DrawerDrivesState extends State<DrawerDrives> {
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
    final Color textColor = Theme.of(context).primaryColorDark;
    final Color buttonColor = Theme.of(context).primaryColorLight;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        collapsedIconColor: textColor,
        iconColor: buttonColor,
        shape: const Border(),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        title: Text("硬碟支援",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),),
        children: [
          Row(
            children: [
              Text("2.5吋：",style: TextStyle(fontSize: 18, color: textColor),),
              SizedBox(
                width: 100,
                height: 50,
                child: TextField(
                  controller: controllerDrives25,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 14, color: textColor),
                  decoration: InputDecoration(
                    hintText: "數量",
                    hintStyle:TextStyle(color: textColor),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Text("3.5吋：",style: TextStyle(fontSize: 18, color: textColor),),
              SizedBox(
                width: 100,
                height: 50,
                child: TextField(
                  controller: controllerDrives35,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 14, color: textColor),
                  decoration: InputDecoration(
                    hintText: "數量",
                    hintStyle:TextStyle(color: textColor),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Text("5.25吋：",style: TextStyle(fontSize: 18, color: textColor),),
              SizedBox(
                width: 100,
                height: 50,
                child: TextField(
                  controller: controllerDrives525,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 14, color: textColor),
                  decoration: InputDecoration(
                    hintText: "數量",
                    hintStyle:TextStyle(color: textColor),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
