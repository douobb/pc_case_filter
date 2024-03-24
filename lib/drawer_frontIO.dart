import 'package:flutter/material.dart';

late List<bool> isSelectedFrontIO;
List<String> frontIO = ["U3","U2","TYPE-C","HDMI","SD讀卡機"];

class DrawerFrontIO extends StatefulWidget {
  const DrawerFrontIO({super.key});

  @override
  State<DrawerFrontIO> createState() => _DrawerFrontIOState();

}

class _DrawerFrontIOState extends State<DrawerFrontIO> {
  List<Widget> _initFrontIOBottom(Color primaryColor, Color highlightColor, Color textColor, List<bool> isSelected, List<String> frontIO) {
    List<Widget> list = [];
    for(int i = 0; i < isSelected.length; i++){
      list.add(
          SizedBox(
            height: 40,
            child: ToggleButtons(
              color: textColor,
              borderColor: textColor,
              selectedColor: primaryColor,
              fillColor: highlightColor,
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
                  child: Text(frontIO[i],style: const TextStyle(fontSize: 14)),
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
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color textColor = Theme.of(context).primaryColorDark;
    final Color buttonColor = Theme.of(context).primaryColorLight;
    final Color highlightColor = Theme.of(context).highlightColor;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        collapsedIconColor: textColor,
        iconColor: buttonColor,
        shape: const Border(),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.symmetric(vertical: 10),
        title: Text("I/O支援",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),),
        children: [
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _initFrontIOBottom(primaryColor, highlightColor, textColor, isSelectedFrontIO,frontIO),
          )
        ],
      ),
    );
  }
}
