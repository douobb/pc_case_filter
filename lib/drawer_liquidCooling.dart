import 'package:flutter/material.dart';

late List<bool> isSelectedLiquidCooling;
List<String> liquidCooling = ["120","140","240","280","360","420"];

class DrawerLiquidCooling extends StatefulWidget {
  const DrawerLiquidCooling({super.key});

  @override
  State<DrawerLiquidCooling> createState() => _DrawerLiquidCoolingState();

}

class _DrawerLiquidCoolingState extends State<DrawerLiquidCooling> {
  List<Widget> _initLiquidCoolingBottom(Color primaryColor, Color highlightColor, Color textColor, List<bool> isSelected, List<String> liquidCooling) {
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
                  child: Text(liquidCooling[i],style: const TextStyle(fontSize: 14)),
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
        title: Text("水冷支援",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),),
        children: [
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _initLiquidCoolingBottom(primaryColor, highlightColor, textColor, isSelectedLiquidCooling,liquidCooling),
          )
        ],
      ),
    );
  }
}
