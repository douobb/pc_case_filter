import 'package:flutter/material.dart';

class IntroductionSite extends StatelessWidget {
  const IntroductionSite({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color textColor = Theme.of(context).primaryColorDark;
    final Color buttonColor = Theme.of(context).primaryColorLight;
    return SelectionArea(
      child: SingleChildScrollView(
          child: Container(
            color: primaryColor,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15,),
                color: primaryColor,
                width: 1000,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("簡介",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: buttonColor),),
                    const Divider(),
                    Text("本網站建立原因是因為作者發現原價屋的機殼總覽網頁雖然包含了許多機殼，但是在搜索篩選方面並不方便，"
                        "因此希望透過這個網站能讓大家有更好的方法可以去尋找到適合自己需求的機殼。\n\n為了保持資料為最新狀態，"
                        "本網站會從每日的0時開始，每4小時進行一次更新(因為github actions定時可能會有延遲，實際時間可能會晚10~20分鐘)，"
                        "更新資料時會導致網頁資料被刪除，因此需要在約三分鐘之後重新載入頁面以取得最新資料。\n",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                    const Text("* 所有資料均來自「原價屋CASE機殼(+電源)總覽」網頁，實際資料請以該網站為準",style: TextStyle(fontSize: 18, height: 1.5, color: Colors.deepOrange),),
                    const SizedBox(height: 15,),
                    Text("功能",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: buttonColor),),
                    const Divider(),
                    Text("本網站的功能主要包括了原價屋網站上機殼之篩選、搜索以及排序功能，"
                        "其中篩選功能又分為品牌、體積、價格...等細項，而這些功能的介紹也會在底下的教學解釋。",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                    const SizedBox(height: 15,),
                    Text("進入篩選介面",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: buttonColor),),
                    const Divider(),
                    Text("點擊右上角的漏斗圖示即可進入篩選介面，篩選介面的右上角有兩個按鈕，"
                        "當選擇好自己的搜索條件之後別忘了點擊套用按鈕，如果要清除搜索內容則可以點及初始化按鈕，而底下依序是搜索、排序以及篩選功能。",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                    const SizedBox(height: 15,),
                    Text("搜索功能",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: buttonColor),),
                    const Divider(),
                    Text("在「搜尋」欄位的右方有一輸入框，可以輸入想搜尋的文字，右方的打叉按鍵可以把已輸入的文字清除，"
                        "搜索功能必須要文字完全符合(英文大小寫不限)，才能搜尋到結果。",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                    const SizedBox(height: 10,),
                    Image.asset("assert/introduction_search.png",fit: BoxFit.cover, width: 300,),
                    const SizedBox(height: 15,),
                    Text("排序功能",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: buttonColor),),
                    const Divider(),
                    Text("在「排序」欄位的最左邊有一個箭頭按鈕，其箭頭方向代表排序方式由大到小(↓)或由小到大(↑)，"
                        "原始機殼排序方式與原價屋網頁上之相同，右方兩按鈕按下時代表按照價格或容量排序，"
                        "最右方的打叉按鈕可以清除先前的選擇，回到預設排序方式。",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                    const SizedBox(height: 10,),
                    Image.asset("assert/introduction_sort.png",fit: BoxFit.cover, width: 300,),
                    const SizedBox(height: 15,),
                    Text("篩選功能",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: buttonColor),),
                    const Divider(),
                    Text("篩選欄位包含品牌、體積、邊長、價格、GPU長、CPU高、主板、風扇支援、水冷支援、I/O支援、硬碟支援、側板類型以及其他，點擊該欄位即可展開選項。\n\n"
                        "品牌欄位展開後可以看到一個勾選框，可以一次全選或全不選。包含輸入框的欄位有體積、邊長、價格、GPU長、CPU高，"
                        "其中價格欄位可輸入整數，其餘的四個可輸入小數。而「其他」欄位的選項則是使用勾選，剩下的欄位皆為使用按鈕做選擇。",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                    const SizedBox(height: 15,),
                    Text("篩選邏輯",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: buttonColor),),
                    const Divider(),
                    Text("使用or邏輯的欄位：品牌、主板以及側板類型，預設會選擇所有選項，只要有任一選項符合的機殼就會顯示。\n\n"
                        "使用and邏輯的欄位：風扇支援、水冷支援以及I/O支援，預設不會選擇任何選項，必須要所有選項都符合的機殼才會顯示。\n\n"
                        "使用輸入框的體積、價格、GPU長、CPU高欄位必須介於輸入的數值之間才會顯示該機殼，"
                        "邊長欄位要機殼對應邊長小於所輸入的數值(可放入指定空間)才會顯示機殼，"
                        "而硬碟支援必須要機殼的支援硬碟數大於所輸入的數值才會顯示機殼。\n",style: TextStyle(fontSize: 18, height: 1.5, color: textColor),),
                    const Text("* 邊長欄位的最長邊、次長邊、短邊不一定對應機殼的高、深、寬，實際情況請自行判斷。\n"
                        "* 硬碟支援欄位之間會有兼容問題，不一定能同時滿足所有需求，建議只在一個框內輸入數值，實際情況請自行判斷。",style: TextStyle(fontSize: 18, height: 1.5, color: Colors.deepOrange),),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
