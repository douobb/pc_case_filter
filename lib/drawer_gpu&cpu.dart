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
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        shape: const Border(),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        title: const Text("GPU&CPU",style: TextStyle(fontSize: 18),),
        children: [
          Row(
            children: [
              const Text("GPU：",style: TextStyle(fontSize: 18),),
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
                  style: const TextStyle(fontSize: 14,),
                  decoration: const InputDecoration(
                    hintText: "長度(cm)",
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const Text("CPU：",style: TextStyle(fontSize: 18),),
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
                  style: const TextStyle(fontSize: 14,),
                  decoration: const InputDecoration(
                    hintText: "高度(cm)",
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
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
