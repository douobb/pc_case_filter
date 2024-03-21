import 'package:flutter/material.dart';

late List<bool> isSelectedSidePanel;
List<String> sidePanelType = ["透側","非透側","可替換"];

class DrawerSidePanel extends StatefulWidget {
  const DrawerSidePanel({super.key});

  @override
  State<DrawerSidePanel> createState() => _DrawerSidePanelState();

}

class _DrawerSidePanelState extends State<DrawerSidePanel> {
  List<Widget> _initSidePanelBottom(Color primaryColor, Color textColor, List<bool> isSelected, List<String> sidePanelType) {
    List<Widget> list = [];
    for(int i = 0; i < isSelected.length; i++){
      list.add(
          SizedBox(
            height: 40,
            child: ToggleButtons(
              color: textColor,
              borderColor: textColor,
              selectedColor: primaryColor,
              fillColor: textColor,
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
                  child: Text(sidePanelType[i],style: const TextStyle(fontSize: 14)),
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
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        collapsedIconColor: textColor,
        iconColor: buttonColor,
        shape: const Border(),
        childrenPadding: const EdgeInsets.symmetric(vertical: 10),
        title: Text("側板類型",style: TextStyle(fontSize: 18, color: textColor),),
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 5,
            runSpacing: 5,
            children: _initSidePanelBottom(primaryColor, textColor, isSelectedSidePanel,sidePanelType),
          )
        ],
      ),
    );
  }
}
