import 'package:flutter/material.dart';

late double fansInsideCountMin;
late double fansInsideCountMax;

class DrawerFansInside extends StatefulWidget {
  const DrawerFansInside({super.key});

  @override
  State<DrawerFansInside> createState() => _DrawerFansInsideState();

}

class _DrawerFansInsideState extends State<DrawerFansInside> {

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
    final Color textColor = Theme.of(context).primaryColorDark;
    final Color buttonColor = Theme.of(context).primaryColorLight;
    final Color dividerColor = Theme.of(context).dividerColor;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        collapsedIconColor: textColor,
        iconColor: buttonColor,
        shape: const Border(),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        title: Text("內附風扇數",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),),
        children: [
          RangeSlider(
            min: 0,
            max: 7,
            divisions: 7,
            inactiveColor: dividerColor,
            activeColor: buttonColor,
            labels: RangeLabels('min：$fansInsideCountMin', 'max：$fansInsideCountMax'),
            values: RangeValues(fansInsideCountMin, fansInsideCountMax),
            onChanged: (newValue) {
              setState(() {
                fansInsideCountMin = newValue.start;
                fansInsideCountMax = newValue.end;
              });
            },
            onChangeEnd: (newValue) {
              setState(() {
                fansInsideCountMin = newValue.start;
                fansInsideCountMax = newValue.end;
              });
            },
          )
        ],
      ),
    );
  }
}
