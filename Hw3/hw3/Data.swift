//
//  Data.swift
//  hw3
//
//  Created by User03 on 2020/10/27.
//

import Foundation

struct Movie:Identifiable{
    var id = UUID()
    let name : String
    let time : String
}

struct Place{
    let site : String
    let latitude : Double
    let longitude : Double
}

//蠟筆小新：
let movies=[
    Movie(name: "動感超人大戰泳裝魔王",time:"1993年7月24日"),
    Movie(name: "不理不理王國的秘寶",time:"1994年4月23日"),
    Movie(name: "雲黑齋的野心",time:"1995年4月15日"),
    Movie(name: "搞怪遊樂園大冒險",time:"1996年4月13日"),
    Movie(name: "黑暗珠珠大追擊",time:"1997年4月19日"),
    Movie(name: "電擊！豬蹄大作戰",time:"1998年4月18日"),
    Movie(name: "爆發！溫泉激烈大決戰",time:"1999年4月17日"),
    Movie(name: "風起雲湧的叢林冒險",time:"2000年4月22日"),
    Movie(name: "風起雲湧_猛烈！大人帝國的反擊",time:"2001年4月21日"),/*ダメダメのうた*/
    Movie(name: "風起雲湧_壯烈！戰國大會戰",time:"2002年4月20日"),
    Movie(name: "風起雲湧_光榮燒肉之路",time:"2003年4月19日"),/*PLEASURE*/
    Movie(name: "風起雲湧！夕陽下的春日部男孩",time:"2004年4月17日"),
    Movie(name: "3分鐘百變大進擊",time:"2005年4月16日"),/*ユルユルでDE-O!*/
    Movie(name: "Amigo！森巴入侵計劃",time:"2006年4月15日"),
    Movie(name: "小白的屁屁炸彈",time:"2007年4月21日"),
    Movie(name: "風起雲湧的金矛勇者",time:"2008年4月19日"),
    Movie(name: "春日部野生王國",time:"2009年4月18日"),
    Movie(name: "我的超時空新娘",time:"2010年4月17日"),/*ハピハピ*/
    Movie(name: "黃金間諜大作戰",time:"2011年4月16日"),/*T.W.L*/
    Movie(name: "我和我的宇宙公主",time:"2012年4月14日"),/*『希望山脈』（ポニーキャニオン）*/
    Movie(name: "B級美食大逃亡",time:"2013年4月20日"),/*キミに100パーセント*/
    Movie(name: "大對決！機械人爸爸的反擊",time:"2014年4月19日"),
    Movie(name: "我的搬家物語 仙人掌大襲擊",time:"2015年4月18日"),/*100%傳達給你*/
    Movie(name: "爆睡！夢世界大作戰",time:"2016年4月16日"),
    Movie(name: "宇宙人Pi力來襲！！",time:"2017年4月15日"),
    Movie(name: "功夫小子〜拉麵大亂鬥〜",time:"2018年4月13日"),
    Movie(name: "新婚旅行風暴〜奪回廣志大作戰〜",time:"2019年4月19日"),/*麝香葡萄*/
    Movie(name: "激戰！塗鴉王國與差不多四勇者",time:"2020年9月11日")
]

let movieYears=[1993...2020]
