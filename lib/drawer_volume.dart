import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late double volumeMin;
late double volumeMax;
late TextEditingController controllerVolumeMin;
late TextEditingController controllerVolumeMax;

class DrawerVolume extends StatefulWidget {
  const DrawerVolume({super.key});

  @override
  State<DrawerVolume> createState() => _DrawerVolumeState();
}

class _DrawerVolumeState extends State<DrawerVolume> {
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
        childrenPadding: const EdgeInsets.symmetric(vertical: 10),
        title: Text("體積",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 50,
                child: TextField(
                  controller: controllerVolumeMin,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                  ],
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 14, color: textColor),
                  decoration: InputDecoration(
                    hintText: "最小值",
                    hintStyle:TextStyle(color: textColor),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: 80,
                child: const Divider(),
              ),
              SizedBox(
                width: 80,
                height: 50,
                child: TextField(
                  controller: controllerVolumeMax,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                  ],
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 14, color: textColor),
                  decoration: InputDecoration(
                    hintText: "最大值",
                    hintStyle:TextStyle(color: textColor),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
