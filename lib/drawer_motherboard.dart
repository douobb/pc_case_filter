import 'package:flutter/material.dart';

late List<bool> isSelectedMotherBoard;
List<String> motherBoardSize = ["EATX","ATX","MATX","ITX"];

class DrawerMotherBoard extends StatefulWidget {
  const DrawerMotherBoard({super.key});

  @override
  State<DrawerMotherBoard> createState() => _DrawerMotherBoardState();

}

class _DrawerMotherBoardState extends State<DrawerMotherBoard> {
  List<Widget> _initMotherBoardBottom(Color primaryColor, Color highlightColor, Color textColor, List<bool> isSelected, List<String> motherBoardSize) {
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
                  child: Text(motherBoardSize[i],style: const TextStyle(fontSize: 14)),
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
        title: Text("主板",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),),
        children: [
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _initMotherBoardBottom(primaryColor, highlightColor, textColor, isSelectedMotherBoard,motherBoardSize),
          )
        ],
      ),
    );
  }
}
