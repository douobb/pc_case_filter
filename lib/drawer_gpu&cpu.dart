import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late double gpuLengthMin;
late double cpuHeightMin;
late TextEditingController controllerGpuMin;
late TextEditingController controllerCpuMin;

class DrawerGpuCpu extends StatefulWidget {
  const DrawerGpuCpu({super.key});

  @override
  State<DrawerGpuCpu> createState() => _DrawerGpuCpuState();
}

class _DrawerGpuCpuState extends State<DrawerGpuCpu> {
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
        title: Text("GPU&CPU",style: TextStyle(fontSize: 18, color: textColor),),
        children: [
          Row(
            children: [
              Text("GPU：",style: TextStyle(fontSize: 18, color: textColor),),
              SizedBox(
                width: 100,
                height: 50,
                child: TextField(
                  controller: controllerGpuMin,
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
              Text("CPU：",style: TextStyle(fontSize: 18, color: textColor),),
              SizedBox(
                width: 100,
                height: 50,
                child: TextField(
                  controller: controllerCpuMin,
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
