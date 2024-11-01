import 'package:flutter/material.dart';

late bool isATXPowerOnly;
late bool isFanHubInside;
late bool isAllowVerticalGPU;
late bool isBackMotherboard;
late bool isTank;
late bool isSilent;

class DrawerOthers extends StatefulWidget {
  const DrawerOthers({super.key});

  @override
  State<DrawerOthers> createState() => _DrawerOthersState();

}

class _DrawerOthersState extends State<DrawerOthers> {

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
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        title: Text("其他",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),),
        children: [
          Row(
            children: [
              Text("僅允許ATX電供",style: TextStyle(fontSize: 18, color: textColor),),
              Checkbox(
                  side: BorderSide(color: textColor),
                  activeColor: buttonColor,
                  checkColor: primaryColor,
                  value: isATXPowerOnly,
                  onChanged: (value){
                    setState(() {
                      isATXPowerOnly = !isATXPowerOnly;
                    });
                  }
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Text("內附控制器&集線器",style: TextStyle(fontSize: 18, color: textColor),),
              Checkbox(
                  side: BorderSide(color: textColor),
                  activeColor: buttonColor,
                  checkColor: primaryColor,
                  value: isFanHubInside,
                  onChanged: (value){
                    setState(() {
                      isFanHubInside = !isFanHubInside;
                    });
                  }
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Text("支援顯卡垂直安裝",style: TextStyle(fontSize: 18, color: textColor),),
              Checkbox(
                  side: BorderSide(color: textColor),
                  activeColor: buttonColor,
                  checkColor: primaryColor,
                  value: isAllowVerticalGPU,
                  onChanged: (value){
                    setState(() {
                      isAllowVerticalGPU = !isAllowVerticalGPU;
                    });
                  }
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Text("支援背插",style: TextStyle(fontSize: 18, color: textColor),),
              Checkbox(
                  side: BorderSide(color: textColor),
                  activeColor: buttonColor,
                  checkColor: primaryColor,
                  value: isBackMotherboard,
                  onChanged: (value){
                    setState(() {
                      isBackMotherboard = !isBackMotherboard;
                    });
                  }
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Text("全景機殼",style: TextStyle(fontSize: 18, color: textColor),),
              Checkbox(
                  side: BorderSide(color: textColor),
                  activeColor: buttonColor,
                  checkColor: primaryColor,
                  value: isTank,
                  onChanged: (value){
                    setState(() {
                      isTank = !isTank;
                    });
                  }
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Text("靜音機殼",style: TextStyle(fontSize: 18, color: textColor),),
              Checkbox(
                  side: BorderSide(color: textColor),
                  activeColor: buttonColor,
                  checkColor: primaryColor,
                  value: isSilent,
                  onChanged: (value){
                    setState(() {
                      isSilent = !isSilent;
                    });
                  }
              ),
            ],
          ),
        ],
      ),
    );
  }
}
