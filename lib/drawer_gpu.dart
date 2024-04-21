import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late double gpuLengthMin;
late double gpuLengthMax;
late TextEditingController controllerGpuMin;
late TextEditingController controllerGpuMax;

class DrawerGpu extends StatefulWidget {
  const DrawerGpu({super.key});

  @override
  State<DrawerGpu> createState() => _DrawerGpuState();
}

class _DrawerGpuState extends State<DrawerGpu> {
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
        title: Text("GPU長",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 50,
                child: TextField(
                  controller: controllerGpuMin,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
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
                  controller: controllerGpuMax,
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
