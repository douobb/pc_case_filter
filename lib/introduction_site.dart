import 'package:flutter/material.dart';

class IntroductionSite extends StatelessWidget {
  const IntroductionSite({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15,),
      child: Center(
        child: SizedBox(
          width: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("簡介",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
              const Divider(),
              const Text("本網站建立原因是因為作者發現原價屋的機殼總覽網頁雖然包含了許多機殼，但是在搜索篩選方面並不方便，"
                  "因此希望透過這個網站能讓大家有更好的方法可以去尋找到適合自己需求的機殼。\n\n為了保持資料為最新狀態，"
                  "本網站會從每日的0時開始，每4小時進行一次更新(因為github actions定時可能會有延遲，實際時間可能會晚10~20分鐘)，"
                  "更新資料時會導致網頁資料被刪除，因此請稍待約三分鐘之後重新載入頁面以取得最新資料。\n",style: TextStyle(fontSize: 18, height: 1.5),),
              const Text("* 所有資料均來自「原價屋CASE機殼(+電源)總覽」網頁，實際資料請以該網站為準",style: TextStyle(fontSize: 18, height: 1.5, color: Colors.deepOrange),),
              const SizedBox(height: 15,),
              const Text("功能",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
              const Divider(),
              const Text("本網站的功能主要包括了原價屋網站上機殼之篩選、搜索以及排序功能，"
                  "其中篩選功能又分為品牌、體積、價格...等細項，而這些功能的介紹也會在底下的教學解釋。",style: TextStyle(fontSize: 18, height: 1.5),),
              const SizedBox(height: 15,),
              const Text("進入篩選介面",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
              const Divider(),
              const Text("點擊右上角的漏斗圖示即可進入篩選介面，篩選介面的右上角有「套用」以及「初始化」兩個按鈕，功能分別為底下搜索條件的使用以及清除，"
                  "當選擇好自己的搜索條件之後別忘了點擊套用按鈕。而底下依序是搜索、排序以及篩選的功能，只要點擊想要使用的功能就可以進行輸入以及選擇。",style: TextStyle(fontSize: 18, height: 1.5),),
              const SizedBox(height: 10,),
              Image.asset("assert/introduction_open_filter.gif",width: (MediaQuery.of(context).size.width > 1000? 960 : MediaQuery.of(context).size.width-40),),
              const SizedBox(height: 15,),
              const Text("搜索功能",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
              const Divider(),
              const Text("在「搜尋」欄位的右方有一輸入框，可以輸入想搜尋的文字，右方的打叉按鍵可以把已輸入的文字清除，"
                  "搜索功能必須要文字完全符合(英文大小寫不限)，才能搜尋到結果。",style: TextStyle(fontSize: 18, height: 1.5),),
              Image.asset("assert/introduction_search.png",fit: BoxFit.cover, width: 300,),
              const SizedBox(height: 15,),
              const Text("排序功能",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
              const Divider(),
              const Text("在「排序」欄位的右方有一個箭頭按鈕，其箭頭方向代表排序方式由大到小(↓)或由小到大(↑)，"
                  "僅有在右方兩個按鈕有其中一個按下時才有作用，否則排序方式與原價屋網頁上之相同，右方兩按鈕代表按照價格或容量排序，"
                  "最右方的打叉按鈕可以清除先前的選擇，回到預設排序方式。",style: TextStyle(fontSize: 18, height: 1.5),),
              Image.asset("assert/introduction_sort.png",fit: BoxFit.cover, width: 300,),
              const SizedBox(height: 15,),
              const Text("篩選功能",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
              const Divider(),
              const Text("除了「搜尋」與「排序」欄位之外，底下的欄位皆為篩選欄位，包含品牌、體積、價格、GPU&CPU、主板、"
                  "風扇支援、水冷支援、I/O支援、硬碟支援、側板類型以及其他，點擊該欄位即可展開選項。\n\n"
                  "品牌欄位展開後可以看到一個勾選框，可以一次全選或全不選，包含輸入框的欄位有體積、價格以及GPU&CPU，"
                  "其中價格欄位可輸入整數，其餘的兩個可輸入小數，而「其他」欄位的選項則是使用勾選，剩下的欄位皆為使用按鈕做選擇。",style: TextStyle(fontSize: 18, height: 1.5),),
              const SizedBox(height: 15,),
              const Text("篩選邏輯",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
              const Divider(),
              const Text("本篩選器中每個欄位之間的關係是and邏輯，而每個欄位中選項的關係主要有兩種，分別是使用and以及or邏輯。\n\n"
                  "使用or邏輯的欄位有：品牌、主板以及側板類型，預設會選擇所有選項，只要有任一選項符合的機殼就會顯示。"
                  "使用and邏輯的欄位有：風扇支援、水冷支援、I/O支援以及硬碟支援，預設不會選擇任何選項，必須要所有選項都符合的機殼才會顯示。\n\n"
                  "使用輸入框的體積、價格欄位必須介於輸入的數值之間才會顯示該機殼，並且可以只輸入最大或最小值，"
                  "CPU&GPU欄位則要大於所輸入的數值(可容納顯卡及散熱器)才會顯示機殼。",style: TextStyle(fontSize: 18, height: 1.5),),
            ],
          ),
        ),
      )
    );
  }
}
