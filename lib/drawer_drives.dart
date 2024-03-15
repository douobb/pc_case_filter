import 'package:flutter/material.dart';

late List<bool> isSelectedDrives;
List<String> drivesType = ["2.5","3.5","5.25"];

class DrawerDrives extends StatefulWidget {
  const DrawerDrives({super.key});

  @override
  State<DrawerDrives> createState() => _DrawerDrivesState();

}

class _DrawerDrivesState extends State<DrawerDrives> {
  List<Widget> _initDrivesBottom(List<bool> isSelected, List<String> drivesType) {
    List<Widget> list = [];
    for(int i = 0; i < isSelected.length; i++){
      list.add(
          SizedBox(
            height: 40,
            child: ToggleButtons(
              isSelected: [
                isSelected[i]
              ],
              onPressed: (int index) {
                setState(() {
                  isSelected[i] =
                  !isSelected[i];
                });
              },
              borderRadius: BorderRadius.circular(20),
              splashColor: Colors.transparent,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(drivesType[i],style: const TextStyle(fontSize: 14)),
                )
              ],
            ),
          )
      );
    }
    return list;
  }

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
        childrenPadding: const EdgeInsets.symmetric(vertical: 10),
        title: const Text("硬碟支援",style: TextStyle(fontSize: 18),),
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 5,
            runSpacing: 5,
            children: _initDrivesBottom(isSelectedDrives,drivesType),
          )
        ],
      ),
    );
  }
}
