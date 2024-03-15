import 'package:flutter/material.dart';

late List<bool> isSelectedSidePanel;
List<String> sidePanelType = ["透側","非透側","可替換"];

class DrawerSidePanel extends StatefulWidget {
  const DrawerSidePanel({super.key});

  @override
  State<DrawerSidePanel> createState() => _DrawerSidePanelState();

}

class _DrawerSidePanelState extends State<DrawerSidePanel> {
  List<Widget> _initSidePanelBottom(List<bool> isSelected, List<String> sidePanelType) {
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
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        shape: const Border(),
        childrenPadding: const EdgeInsets.symmetric(vertical: 10),
        title: const Text("側板類型",style: TextStyle(fontSize: 18),),
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 5,
            runSpacing: 5,
            children: _initSidePanelBottom(isSelectedSidePanel,sidePanelType),
          )
        ],
      ),
    );
  }
}
