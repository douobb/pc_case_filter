import 'package:flutter/material.dart';

late List<bool> isSelectedFans;
List<String> fansPosition = ["前","後","上","下","側"];

class DrawerFans extends StatefulWidget {
  const DrawerFans({super.key});

  @override
  State<DrawerFans> createState() => _DrawerFansState();

}

class _DrawerFansState extends State<DrawerFans> {
  List<Widget> _initfansBottom(Color primaryColor, Color highlightColor, Color textColor, List<bool> isSelected, List<String> fansPosition) {
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
                  child: Text(fansPosition[i],style: const TextStyle(fontSize: 14)),
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
        title: Text("風扇支援",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),),
        children: [
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _initfansBottom(primaryColor, highlightColor, textColor, isSelectedFans,fansPosition),
          )
        ],
      ),
    );
  }
}
