import 'package:flutter/material.dart';

late String searchWord;
late TextEditingController controllerSearchWord;

class DrawerSearch extends StatefulWidget {
  const DrawerSearch({super.key});

  @override
  State<DrawerSearch> createState() => _DrawerSearchState();
}

class _DrawerSearchState extends State<DrawerSearch> {
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
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("搜尋",style: TextStyle(fontSize: 18, color: textColor),),
          SizedBox(
            width: 100,
            height: 50,
            child: TextField(
              controller: controllerSearchWord,
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(fontSize: 14, color: textColor),
              decoration: InputDecoration(
                hintText: "搜索文字",
                hintStyle:TextStyle(color: textColor),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor)),
              ),
            ),
          ),
          SizedBox(
              height: 40,
              child: IconButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: () {
                  setState(() {
                    controllerSearchWord.text = '';
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
