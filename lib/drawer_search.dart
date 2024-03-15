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
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("搜尋",style: TextStyle(fontSize: 18),),
          SizedBox(
            width: 100,
            height: 50,
            child: TextField(
              controller: controllerSearchWord,
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(fontSize: 14,),
              decoration: const InputDecoration(
                hintText: "搜索文字",
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
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
                icon: const Icon(Icons.close),
              )
          ),
        ],
      ),
    );
  }
}
