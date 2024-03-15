import 'package:flutter/material.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text("我是douobb，目前就讀於交大資工，正在學習如何使用flutter建立網站以及APP，希望這一個網站對正在挑選機殼的你有幫助(❁´◡`❁)",style: TextStyle(fontSize: 18, height: 1.5),),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 30,),
            const Text("關於本網站",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
            const Divider(),
            //整理成流程圖
            const Text("本網站的資料是利用Python結合GitHub Action定期在原價屋網站上爬取的，爬取資料之後在Python整理，"
                "整理完成後上傳至Firebase的資料庫保存，網站建立則是使用flutter以及GitHub Pages來實現。",style: TextStyle(fontSize: 18, height: 1.5),),
          ],
        ),
      ),
    );
  }
}
