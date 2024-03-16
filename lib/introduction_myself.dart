import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroductionMyself extends StatelessWidget {
  const IntroductionMyself({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network('https://avatars.githubusercontent.com/u/143181701?v=4',width: 150,),
                ),
                const SizedBox(width: 20,),
                const Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("關於我",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
                      Divider(),
                      Text("我是douobb，是一位就讀於交大資工的flutter菜鳥，正在學習如何使用flutter建立網站以及APP，本網頁算是我做的第一個正式項目，希望對正在挑選機殼的你有幫助",style: TextStyle(fontSize: 18, height: 1.5),),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 30,),
            const Text("關於本網站",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
            const Divider(),
            const Text("本網站建立的過程主要可以分成以下幾個階段：",style: TextStyle(fontSize: 18, height: 1.5),),
            const SizedBox(height: 15,),
            Container(
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(230, 223, 239, 1),
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                border: Border.all(width: 1, color: const Color.fromRGBO(103, 80, 164, 1)),
              ),
              child: const Column(
                children: [
                  Text("資料蒐集",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
                  Divider(indent: 30, endIndent: 30,),
                  Text("Python + GitHub Action 定期在原價屋網站上爬取",style: TextStyle(fontSize: 16, height: 1.5),),
                ],
              )
            ),
            const SizedBox(
              height: 40,
              width: 300,
              child: Center(
                child: Icon(Icons.arrow_downward),
              )
            ),
            Container(
                width: 300,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(230, 223, 239, 1),
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  border: Border.all(width: 1, color: const Color.fromRGBO(103, 80, 164, 1)),
                ),
                child: const Column(
                  children: [
                    Text("資料儲存",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
                    Divider(indent: 30, endIndent: 30,),
                    Text("Python中整理為數個List，之後上傳到Firebase的資料庫保存",style: TextStyle(fontSize: 16, height: 1.5),),
                  ],
                )
            ),
            const SizedBox(
                height: 40,
                width: 300,
                child: Center(
                  child: Icon(Icons.arrow_downward),
                )
            ),
            Container(
                width: 300,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(230, 223, 239, 1),
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  border: Border.all(width: 1, color: const Color.fromRGBO(103, 80, 164, 1)),
                ),
                child: const Column(
                  children: [
                    Text("網站建立",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
                    Divider(indent: 30, endIndent: 30,),
                    Text("使用flutter + GitHub Pages部署到Github上",style: TextStyle(fontSize: 16, height: 1.5),),
                  ],
                )
            ),
            const SizedBox(height: 30,),
            const Text("並且在這過程中我在Github上建立了兩個專案，如果對於程式碼有興趣的可以到以下的專案內看看：",style: TextStyle(fontSize: 18, height: 1.5),),
            const SizedBox(height: 15,),
            ElevatedButton(
              style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(103, 80, 164, 1)),
              ),
              onPressed: (){
                launchUrl(Uri.parse('https://github.com/douobb/pc_case_data'), mode:LaunchMode.externalApplication);
              },
              child: const Text("pc_case_data",style: TextStyle(fontSize: 16, color: Colors.white),),
            ),
            const SizedBox(height: 10,),
            const Text("定期爬取資料，使用Python語言編寫",style: TextStyle(fontSize: 18, height: 1.5),),
            const SizedBox(height: 15,),
            ElevatedButton(
              style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(103, 80, 164, 1)),
              ),
              onPressed: (){
                launchUrl(Uri.parse('https://github.com/douobb/pc_case_filter'), mode:LaunchMode.externalApplication);
              },
              child: const Text("pc_case_filter",style: TextStyle(fontSize: 16, color: Colors.white),),
            ),
            const SizedBox(height: 10,),
            const Text("本網站的主體，使用Flutter(Dart)語言編寫",style: TextStyle(fontSize: 18, height: 1.5),),
          ],
        ),
      ),
    );
  }
}
