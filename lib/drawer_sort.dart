import 'package:flutter/material.dart';

late List<bool> isSelectedSortMethod;
List<String> sortMethod = ["價格","容量"];
class DrawerSort extends StatefulWidget {
  const DrawerSort({super.key});

  @override
  State<DrawerSort> createState() => _DrawerSortState();

}

class _DrawerSortState extends State<DrawerSort> {
  List<Widget> _initSortBottom(Color primaryColor, Color textColor, List<bool> isSelected, List<String> sortMethod) {
    List<Widget> list = [];
    for(int i = 0; i < 2; i++){
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
                  if(!isSelected[i]){
                    isSelected[i] = !isSelected[i];
                    isSelected[1-i] = false;
                  }
                });
              },
              borderRadius: BorderRadius.circular(20),
              splashColor: Colors.transparent,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(sortMethod[i],style: const TextStyle(fontSize: 14)),
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
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("排序",style: TextStyle(fontSize: 18, color: textColor),),
          SizedBox(
            height: 40,
            child: IconButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                ),
                isSelected: isSelectedSortMethod[2],
                onPressed: () {
                  setState(() {
                    isSelectedSortMethod[2] = !isSelectedSortMethod[2];
                  });
                },
                icon: ((isSelectedSortMethod[2])? Icon(Icons.arrow_upward, color: textColor) : Icon(Icons.arrow_downward, color: textColor))),
          ),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _initSortBottom(primaryColor, textColor, isSelectedSortMethod,sortMethod),
          ),
          SizedBox(
              height: 40,
              child: IconButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: () {
                  setState(() {
                    isSelectedSortMethod[0] = false;
                    isSelectedSortMethod[1] = false;
                  });
                },
                icon: Icon(Icons.close, color: textColor),
              )
          ),
        ],
      ),
    );
  }
}
