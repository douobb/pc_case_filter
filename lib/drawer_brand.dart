import 'package:flutter/material.dart';

late List<bool> isSelectedBrand;
List<String> brandNames = [
  "Fractal Design",
  "COUGAR",
  "曜越",
  "Apexgaming",
  "SAMA",
  "銀欣",
  "台鼎環球",
  "樹昌",
  "B-Team",
  "聯力",
  "酷碼",
  "Phanteks",
  "全漢",
  "darkFlash",
  "abee",
  "華碩",
  "Montech",
  "視博通",
  "微星",
  "技嘉",
  "亞碩",
  "旋剛",
  "1st Player",
  "Antec",
  "BitFenix",
  "HYTE",
  "be quiet!",
  "NZXT",
  "賽德斯",
  "喬思伯",
  "迎廣",
  "SSUPD",
  "XPG",
  "保銳",
  "海盜船",
  "海韻",
  "i-CoolTw",
  "DEEPCOOL",
  "安耐美",
  "YAMA",
  "Mavoly"
];

class DrawerBrand extends StatefulWidget {
  const DrawerBrand({super.key});

  @override
  State<DrawerBrand> createState() => _DrawerBrandState();

}

class _DrawerBrandState extends State<DrawerBrand> {
  bool isSelectAllBrand = true;
  List<Widget> _initBrandsBottom(Color primaryColor, Color textColor, Color highlightColor, List<bool> isSelected, List<String> brands) {
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
                  child: Text(brands[i],style: const TextStyle(fontSize: 14)),
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
        title: Text("品牌",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),),
        children: [
          Checkbox(
              side: BorderSide(color: textColor),
              activeColor: buttonColor,
              checkColor: primaryColor,
              value: isSelectAllBrand,
              onChanged: (value){
                setState(() {
                  isSelectedBrand = List.generate(brandNames.length, (index) => (isSelectAllBrand == true? false : true));
                  isSelectAllBrand = !isSelectAllBrand;
                });
              }
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _initBrandsBottom(primaryColor, textColor, highlightColor, isSelectedBrand, brandNames),
          )
        ],
      ),
    );
  }
}
