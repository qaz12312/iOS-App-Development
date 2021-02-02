//
//  GameData.swift
//  RandomGame
//
//  Created by User06 on 2021/1/22.
//

import Foundation

struct Game:Identifiable{
    var id = UUID()
    let name : String
    let describe : String // 遊戲規則
    let persons : String // 人數
    let time : String // 遊戲時間
    let video : String // 玩法影片
}

let games = [
    Game(name:"屁屁偵探-記憶翻翻樂",describe:"隨機抽出一張道具放置於物品卡的空格後，\n再將其他道具依序放上遊戲板，\n接著每位玩家輪流翻牌，推理出缺少的物品為何",persons:"1-4人",time:"15-20分鐘",video:"https://youtu.be/YGw7LIkoM44"),
    Game(name:"駱駝大賽",describe:"玩家除了要有足夠的運氣之外，下注的時機也是獲勝的關鍵。\n通常是看準優勢後下注，\n但你千算萬算也永遠算不到哪隻駱駝會突然被揹著往前走，\n最後跌破大家眼鏡地躍過終點",persons:"2-8人",time:"30分鐘",video:"https://www.youtube.com/watch?v=IsvQDmuAzQU"),
    Game(name:"抓月亮",describe:"每位玩家輪流擲骰子，依照骰子的指示在1～2把梯子上疊放梯子，\n若擺放的梯子滑落時你會得到一顆月亮的眼淚，\n直到眼淚或梯子被取完，看看誰的眼淚最少誰就是最接近月亮的贏家",persons:"2-6人",time:"20分鐘",video:"https://www.youtube.com/watch?v=zy72MbhieW0"),
    Game(name:"妙語偵探社",describe:"用圖片來猜測身分的特殊桌遊，主持人會設定題目並告知大部分的玩家，\n但會有一位倒楣鬼收到一張沒有寫題目的白紙。\n接著玩家們須根據題目，從手上數張圖片卡中選擇與題目有所呼應的卡片放到桌面上，\n而沒有收到題目的玩家只能根據其他人出的圖片來猜測主題",persons:"4-8人",time:"45分鐘",video:"https://www.youtube.com/watch?v=Sy8vKXcgZ_k"),
    Game(name:"黃牌",describe:"台灣原創填詞遊戲，\n看似簡單但其實有一定的難度，\n例如當手中牌面上的單字都無法讓句子通順時，硬是把牌打出來就會出現令人啼笑皆非的排列組合，\n是一款搞笑且綜藝性質高的桌遊",persons:"4-10人",time:"20分鐘",video:"https://www.youtube.com/watch?v=236Ob3rKhzg"),
    Game(name:"矮人礦坑",describe:"將矮人分為好與壞兩個陣營，\n好矮人挖通道找金塊，而壞矮人則要從中妨礙。\n玩家在遊戲結束之前都互相不知道彼此身分，\n但其實從遊戲過程中很容易就能看出來其他玩家所扮演的角色，\n因此影響勝敗的關鍵主要還是看出牌的時機",persons:"3-10人",time:"30分鐘",video:"https://www.youtube.com/watch?v=cm0zNqiBjxM"),
    Game(name:"BANG！",describe:"以美國西部牛仔的場景設計，\n玩家在遊戲中各自扮演警長、副警長、歹徒以及叛徒的角色，\n除了警長之外的其他人都必須隱藏身份，\n互相試探對方並想辦法讓自己與同陣營的人取得勝利，\n是一款需要用盡心機的遊戲",persons:"4-7人",time:"30-40分鐘",video:"https://www.youtube.com/watch?v=eXel1DlunkM"),
    Game(name:"誰是牛頭王",describe:"類似接龍，\n但在排列時若是放到一排中的最後一張就得把整排收走，\n會從自己的分數裡扣掉所有牌上的牛頭數總和，\n只要有一人被扣到0分遊戲就會結束",persons:"3-10人",time:"30-40分鐘",video:"https://www.youtube.com/watch?v=t1E0sidnHFk"),
    Game(name:"傳情畫意",describe:"可說是手繪版的傳話筒，\n一個詞彙或是物品傳到最後有時會出現跟題目八竿子打不著邊的東西",persons:"4-8人",time:"20-30分鐘",video:"https://www.youtube.com/watch?v=uEYERj6fsOQ"),
    Game(name:"犯人在跳舞",describe:"只要照著卡牌上的指示就可以進行遊戲。\n玩家只要在犯人把所有手牌出完之前，\n使用手上的功能牌齊心協力找出誰是犯人就能獲得勝利",persons:"3-8人",time:"20分鐘",video:"https://www.youtube.com/watch?v=LqLkhynNVnM"),
    Game(name:"說書人",describe:"輪流用一句話或一個字描述情境並出牌，\n而其他玩家則要想辦法打出一張與敘述最相近的圖樣，\n洗勻後翻開並從中猜測出題者的牌。\n遊戲的關鍵在於非出題者是否能成功誤導其他玩家選擇自己的牌",persons:"3-6人",time:"45分鐘～１小時",video:"https://www.youtube.com/watch?v=dj72hCUBELs")
]
