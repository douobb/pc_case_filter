import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late double lenght1Max;
late double lenght2Max;
late double lenght3Max;
late TextEditingController controllerlenght1Max;
late TextEditingController controllerlenght2Max;
late TextEditingController controllerlenght3Max;

class DrawerLength extends StatefulWidget {
  const DrawerLength({super.key});

  @override
  State<DrawerLength> createState() => _DrawerLengthState();
}

class _DrawerLengthState extends State<DrawerLength> {
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
        title: Text("邊長",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),),
        children: [
          Row(
            children: [
              Text("最長邊：",style: TextStyle(fontSize: 18, color: textColor),),
              SizedBox(
                width: 100,
                height: 50,
                child: TextField(
                  controller: controllerlenght1Max,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                  ],
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 14, color: textColor),
                  decoration: InputDecoration(
                    hintText: "長度(cm)",
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
              Text("次長邊：",style: TextStyle(fontSize: 18, color: textColor),),
              SizedBox(
                width: 100,
                height: 50,
                child: TextField(
                  controller: controllerlenght2Max,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                  ],
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 14, color: textColor),
                  decoration: InputDecoration(
                    hintText: "高度(cm)",
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
              Text("短邊：",style: TextStyle(fontSize: 18, color: textColor),),
              SizedBox(
                width: 100,
                height: 50,
                child: TextField(
                  controller: controllerlenght3Max,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                  ],
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 14, color: textColor),
                  decoration: InputDecoration(
                    hintText: "高度(cm)",
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
