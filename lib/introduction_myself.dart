import 'package:flutter/material.dart';
import 'main.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroductionMyself extends StatelessWidget {
  const IntroductionMyself({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color textColor = Theme.of(context).primaryColorDark;
    final Color buttonColor = Theme.of(context).primaryColorLight;
    final Color dividerColor = Theme.of(context).dividerColor;
    return SelectionArea(
      child: SingleChildScrollView(
          child: Container(
            color: primaryColor,
            child:Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15,),
                color: primaryColor,
                width: 1000,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Stack(
                            children: [
                              Image.network('https://avatars.githubusercontent.com/u/143181701?v=4',width: (MediaQuery.of(context).size.width < 600? (MediaQuery.of(context).size.width)/4 : 150),),
                              Container(
                                width: (MediaQuery.of(context).size.width < 600? (MediaQuery.of(context).size.width)/4 : 150),
                                height: (MediaQuery.of(context).size.width < 600? (MediaQuery.of(context).size.width)/4 : 150),
                                color: Colors.black.withOpacity((isDarkMode? 0.25:0)),
                              ),
                            ],
                          )
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("關於我",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: buttonColor),),
                              const Divider(),
                              Text("我是douobb，目前正在學習如何使用flutter建立網站以及APP，本網頁算是我做的第一個正式項目，"
                                  "希望對正在挑選機殼的你有幫助，如果在使用過程中有遇到問題或有其他建議都歡迎提出。",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Text("關於本網站",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: buttonColor),),
                    const Divider(),
                    Text("本網站建立的過程主要可以分成以下幾個階段：",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                    const SizedBox(height: 15,),
                    Container(
                        width: 300,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: dividerColor,
                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                          border: Border.all(width: 1, color: buttonColor),
                        ),
                        child: Column(
                          children: [
                            Text("資料蒐集",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: buttonColor),),
                            const Divider(indent: 30, endIndent: 30,),
                            Text("Python + GitHub Action 定期在原價屋網站上爬取。",style: TextStyle(fontSize: 16, height: 1.5, color: textColor),),
                          ],
                        )
                    ),
                    SizedBox(
                        height: 40,
                        width: 300,
                        child: Center(
                          child: Icon(Icons.arrow_downward, color: textColor),
                        )
                    ),
                    Container(
                        width: 300,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: dividerColor,
                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                          border: Border.all(width: 1, color: buttonColor),
                        ),
                        child: Column(
                          children: [
                            Text("資料儲存",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: buttonColor),),
                            const Divider(indent: 30, endIndent: 30,),
                            Text("在Python中整理資料，之後上傳到Firebase的資料庫保存。",style: TextStyle(fontSize: 16, height: 1.5, color: textColor),),
                          ],
                        )
                    ),
                    SizedBox(
                        height: 40,
                        width: 300,
                        child: Center(
                          child: Icon(Icons.arrow_downward, color: textColor),
                        )
                    ),
                    Container(
                        width: 300,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: dividerColor,
                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                          border: Border.all(width: 1, color: buttonColor),
                        ),
                        child: Column(
                          children: [
                            Text("網站建立",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: buttonColor),),
                            const Divider(indent: 30, endIndent: 30,),
                            Text("使用flutter + GitHub Pages部署到Github上。",style: TextStyle(fontSize: 16, height: 1.5, color: textColor),),
                          ],
                        )
                    ),
                    const SizedBox(height: 30,),
                    Text("並且在這過程中我在Github上建立了兩個專案，如果對於程式碼有興趣的可以到以下的專案內看看：",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                    const SizedBox(height: 15,),
                    ElevatedButton(
                      style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(dividerColor),
                      ),
                      onPressed: (){
                        launchUrl(Uri.parse('https://github.com/douobb/pc_case_data'), mode:LaunchMode.externalApplication);
                      },
                      child: Text("pc_case_data",style: TextStyle(fontSize: 16, color: buttonColor),),
                    ),
                    const SizedBox(height: 10,),
                    Text("定期爬取資料，使用Python語言編寫。",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                    const SizedBox(height: 15,),
                    ElevatedButton(
                      style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(dividerColor),
                      ),
                      onPressed: (){
                        launchUrl(Uri.parse('https://github.com/douobb/pc_case_filter'), mode:LaunchMode.externalApplication);
                      },
                      child: Text("pc_case_filter",style: TextStyle(fontSize: 16, color: buttonColor),),
                    ),
                    const SizedBox(height: 10,),
                    Text("本網站的主體，使用Flutter(Dart)語言編寫。",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                    const SizedBox(height: 30,),
                    Text("開發紀錄&心得：",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                    const SizedBox(height: 15,),
                    ElevatedButton(
                      style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(dividerColor),
                      ),
                      onPressed: (){
                        launchUrl(Uri.parse('https://douobb.github.io/2024/04/18/Flutter%E9%96%8B%E7%99%BC-%E6%A9%9F%E6%AE%BC%E7%AF%A9%E9%81%B8%E7%B6%B2%E9%A0%81/'), mode:LaunchMode.externalApplication);
                      },
                      child: Text("Flutter開發-機殼篩選網頁",style: TextStyle(fontSize: 16, color: buttonColor),),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
