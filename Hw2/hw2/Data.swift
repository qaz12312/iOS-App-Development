//
//  Data.swift
//  hw2
//
//  Created by 林湘羚 on 2020/10/19.
//

import Foundation

//
let cartoons=[
    Cartoon(id:0,name:"蠟筆小新",author:"臼井儀人",source:"日本",isEnd:false),
    Cartoon(id:1,name:"海綿寶寶",author:"史蒂芬·海倫伯格",source:"美國",isEnd:false),
    Cartoon(id:2,name:"辛普森家庭",author:"馬特·格朗寧",source:"美國",isEnd:false),
    Cartoon(id:3,name:"豆豆先生",author:"",source:"英國",isEnd:false),
    Cartoon(id:4,name:"哆啦Ａ夢",author:"藤子·F·不二雄",source:"日本",isEnd:true),
    Cartoon(id:5,name:"熊熊遇見你",author:"Daniel Chong",source:"美國",isEnd:false),
    Cartoon(id:6,name:"名偵探柯南",author:"青山剛昌",source:"日本",isEnd:false),
    Cartoon(id:7,name:"魔法阿媽",author:"麥仁杰",source:"台灣",isEnd:true),
    Cartoon(id:8,name:"我們這一家",author:"螻榮子",source:"日本",isEnd:true),
    Cartoon(id:9,name:"麵包超人",author:"柳瀨嵩",source:"日本",isEnd:false)
]


// photo-info:self.idx+cartoon.key+"info"
// photo:arr[i]
let infos=[
    CartoonInfo(key:"蠟筆小新",kind:"商品聯名",time:"10/18(日)開始",others:["蠟筆小新 Original_Design系列新品","#滿額最高折NT200元","為你的生活灌溉滿滿元氣與感動","被粉絲們問爆的 #睡衣毛毯 #真空壓縮袋8件組\n#摺疊收納箱、#72K便條本，熱騰騰開賣","< 睡 衣 毛 毯 >\n⇨ 冷氣房工作、午休小憩、窩沙發追劇～\n走到哪蓋到哪，人人必備居家好物😴\n/ 觸感細緻好滑順\n/ 蓬鬆柔軟更親膚\n/ 輕盈保暖不厚重","維妙維肖的人物圖案，\n讓整部卡通的回憶都湧上心頭😻\n小新控真的必收藏一波！"],photos:["0p1","0p2","0p3","0p4","0p5","0p6"],film:[WebPage(name:"購物網站-Norns",url:"https://bit.ly/2SSEXBh")]),
    CartoonInfo(key:"哆啦Ａ夢",kind:"商品",time:"10/16(五)起in7-ELEVEN門市",others:["「哆啦A夢-縮小燈icash2.0」2020/10/21起7-ELEVEN門市開始販售~首批8,000張!","產品特色：\n日本授權獨家設計哆啦A夢!\n哆啦A夢道具篇-縮小燈"],photos:["1a1","1a2"],film:[WebPage(name:"icash官網",url:"https://www.icash.com.tw/Home/NewsDetail/10311")]),
    CartoonInfo(key:"哆啦Ａ夢",kind:"商品聯名",time:"10/7(三)開始in麥當勞",others:["DORAEMON愛作夢抱枕限量熱賣！","每人限購2個，不適用於歡樂送、得來速、McCafé專屬櫃檯、數位自助點餐機及點心站\n於麥當勞店內購買任一套餐加299元，即可獲得「2020 DORAEMON 愛作夢抱枕」乙個(單買329元)，每份套餐限加購乙個，每人每次消費限購兩個","「2020 DORAEMON 愛作夢抱枕」全套共四款，限量80,000個","「友誼鈴鐺抱枕、記憶麵包抱枕」自2020年10月7日上午11:00開始販售至2020年11月3日或售完為止","「經典哆啦A夢抱枕、療癒銅鑼燒抱枕」自2020年10月14日上午11:00開始販售至2020年11月3日或售完為止"],photos:["0a1","0a2","0a3"],film:[WebPage(name:"麥當勞官網",url:"https://www.mcdonalds.com/tw/zh-tw/whats-hot/20201007_DORAEMON.html")]),
    CartoonInfo(key:"蠟筆小新",kind:"電影版",time:"9/11(五)上映",others:["台灣影史最賣座小新系列電影紀錄","《蠟筆小新 電影：激戰！塗鴉王國與差不多四勇者》","YAHOO奇摩電影 滿意度4.5高分！","蠟筆小新漫畫連載 30週年紀念電影"],photos:["p1","p2","p3","p4","p5","p6"] ,film:[WebPage(name:"預告片",url:"https://www.youtube.com/watch?v=SgTRUdjpoSc&feature=youtu.be&ab_channel=Muse%E9%97%94%E5%AE%B6%E6%AD%A1")]),
    CartoonInfo(key:"海綿寶寶",kind:"購買、打卡",time:"08/28(五)全台的威秀影城影城",others:["08/28(五)起到全台威秀影城影城！購買中杯可樂，就可用299元加購造型杯","除了2款萌版造型杯，威秀影城再加碼要送出超豪華「深海大鳳梨爆米花桶場景組」，只送不賣！","只要購買2款造型杯子、拍照打卡上傳威秀粉絲團，就有機會能帶他們回家！！"],photos:["0s1","0s2","0s3","0s4"],film:[])
]

let profiles=[
    CartoonProfile(key:"蠟筆小新",tags:["日本","臼井儀人","搞笑","單元劇"],cont:"描寫一戶家庭日常生活的寫照，小新最大的魅力在于他以儿童的纯真眼光略带调侃地看待世界,也是人们喜爱小新重要原因,但调皮捣蛋的性格總是讓人頭疼不已,總是搞不清楚狀況而出的差錯、惹人發笑",roles:[Role(relation:"小新的媽媽", name: "野原美冴", info:"熊本縣阿蘇市出身，本姓小山，是家中排行老二，全職的家庭主婦。結婚前是個上班族自稱24歲個性大而化之且性急暴力且愛慕虛榮，喜歡買名貴的珠寶首飾、衣裝與化妝用品以及高級沐浴乳還有減肥食品，而給廣志與小新則買便宜貨酒量奇差，光是喝啤酒就會發酒瘋"),Role(relation:"小新的爸爸", name: "野原廣志", info:"外表特徵是長條面形，有濃重的鬍鬚根以及災難級的腳臭\n個性有點好色，每當看見陌生女子稍有姿色均會情不自禁地搭訕，有時還會看電視的低級節目，為此常常挨美冴的拳頭\n好喝啤酒，喜愛觀看棒球賽，是巨人隊的頭號粉絲\n工作月薪有30多萬日元，雖然有房貸但擁有都市近郊的獨棟洋房、車子和180公分的身高，被現實讀者認為其實是個高富帥"),Role(relation:"主角", name: "野原新之助", info:"特徵是濃密的眉毛以及短短的和尚髮型，與祖父野原銀之介十分相似\n名字是廣志於小新出生前，特地和其他候選名字寫在一張白紙上，但由於小新誕生當天忽然落下滂沱大雨，當廣志抵達醫院見到剛出世的小新並掏出口袋中的字條時，字條的筆跡已被雨淋至模糊，僅剩下「新」、「之」、「助」三字可辨識，廣志和美冴故為此將小新正式命名為「新之助」\n喜歡的對象基準是在高中生以上，常常以「喜歡喝牛奶嗎」或是「喜歡吃青椒嗎」等語上前搭訕；在興奮到極點時，會如同蒸氣火車般的冒煙與發出氣笛聲。在劇中亦有幾次試圖在深夜觀看成人電視節目，或是在圖書中暗夾寫真集的舉動。和爺爺銀之介格外合拍\n常將話說顛倒，遺忘事情的速度也十分快速，但是不會忘記喜歡的女星的三圍資料\n就讀雙葉幼稚園向日葵班"),Role(relation:"小新的妹妹", name: "野原向日葵", info:"暱稱小葵\n還不會說話，說的話，只有小新跟小白聽得懂\n性格上遺傳媽媽的頑固，想得到的就會爭取到底\n極為聰明，在同年齡的嬰兒中會做出老大般的架式\n對美男子和亮晶晶的東西非常感興趣"),Role(relation:"小新家養的狗", name: "野原小白", info:"小新撿到的,雄性、毛色為雪白、體型似棉花球，在動畫中品種不明，野原美冴曾說小白是雪納瑞或是喜樂蒂牧羊犬，小新則曾說小白是雜種狗，官方設定為米克斯犬（泛指一般雜種狗）\n很聰明，但經常成為小新的代罪羔羊"),Role(relation:"小新的同學", name: "風間徹", info:"5歲。9月28日生，血型A型。常自稱春日部防衛隊隊長。有上英語補習班，立志進名門私立小學"),Role(relation:"小新的同學", name: "阿呆", info:"5歲。5月23日生，血型A型。總是流鼻涕，但是他的鼻涕並不尋常。嗜好是收集各種石頭。"),Role(relation:"小新的同學", name: "櫻田妮妮", info:"5歲。6月5日生，血型A型。常要求春日部防衛隊隊員一起玩「超真實扮家家酒」"),Role(relation:"小新的同學", name: "佐藤正男", info:"5歲。3月7日生，血型O型。頭型像飯糰一樣，住家位置經常被小新記錯")],music:[Music(name:"Hey baby!",url:"https://www.youtube.com/watch?v=-iyphX2M8Mo&list=PLN_r3O6fS_LUDIxCKMFWW-0F4iOw6Ts8s&index=1"),Music(name: "希望山脈", url: "https://www.youtube.com/watch?v=cZ5zAuS_S8I&list=PLN_r3O6fS_LUDIxCKMFWW-0F4iOw6Ts8s&index=2")],others:[WebPage(name:"fb粉絲專",url:"https://www.facebook.com/shinchan.movie.muse/?hc_ref=ARRqaALXZvpsGaAVRbqcZ6RLvCYkwpSiBbya7r_7qYGxT9yATTGRChiT-vw_wS2nPF0&fref=nf&__tn__=kC-R"),WebPage(name:"fb部落客",url:"https://www.facebook.com/jackcrayonsc/")]),
    CartoonProfile(key:"海綿寶寶",tags:["美國","史蒂芬·海倫伯格","喜劇"],cont:"剧情場景設定於太平洋中，一座稱為比奇堡（Bikini Bottom）的城市。\n",roles:[Role(relation:"主角之一",name:"海綿寶寶 ",info:"全名為SpongeBob SquarePants\n特徵為黃色的方形海綿，具有再生能力，也擁有伸縮能力，即使身體被四分五裂皆可恢復原狀\n 穿著棕色短褲、白色襯衫、紅色領帶和黑色皮鞋\n居住在作品虛設城市「比奇堡」郊區的鳳梨屋，並擔任當地著名快餐店蟹堡王餐廳的主廚，是蟹老闆的最佳員工\n有隻寵物蝸牛小蝸，最好的朋友是派大星\n生日是1986年7月14日"),Role(relation:"主角之一",name:"派大星",info:"全名為Patrick Star\n粉紅色的海星,擁有再生能力，手斷了還可以長回來，但是斷肢還會再長回整個身體\n是海绵宝宝最好的朋友，也是章魚哥討厭的對象之一\n身上穿著一條紫色花朵的海灘短褲，在本劇裡總是跟海綿寶寶一起鬧出不少笑話\n沒有工作，是蟹堡王的忠實老主顧，但也有時候會去蟹堡王或海之霸工作，但是都只是去當一日員工"),Role(relation:"蟹堡王餐廳的收銀員",name:"章魚哥",info:"章魚哥（Squidward Quincy Tentacles，通稱Squidward Tentacles）是淺藍色的章魚，男性，有一顆大大的腦袋以及大大的鼻子，被認為是難看的象徵，還有兩隻手、四隻腳和一個光頭。穿著是一件簡單的土色上衣，沒穿褲子。住在比奇堡郊區，他最討厭的兩個人：海綿寶寶和派大星家之間的復活島人像屋裡。\n章魚哥是極度憤世嫉俗的人，痛恨海綿寶寶和派大星的愚蠢行為，還有蟹老闆的吝嗇小氣，對於比奇堡其他人也非常冷淡，經常是板著一張臉。在節目中通常是悲劇角色，但有時也會空前的成功"),Role(relation:"蟹堡王餐廳的老闆",name:"蟹老闆",info:"蟹阿金（Eugene Krabs）是紅色螃蟹，男性，比奇堡著名快餐店蟹堡王餐廳的老闆，故常稱之為蟹老闆（Mr. Krabs），視錢如命，非常吝嗇。和女兒珍珍一起住在比奇堡的船錨屋。身材肥胖，身穿淺藍上衣、藍紫色褲子和腰帶。最喜歡的東西就是錢，沒有什麼比錢都還要重要，對所有人（包括自己的女兒）都相當吝嗇小氣。有個青春期的鯨魚女兒-珍珍，因為這個喜愛流行時尚的女兒而常常感到傷腦筋。"),Role(relation:"海綿寶寶養的蝸牛",name:"小蝸",info:"小蝸（Gary the Snail），男性，外殼為粉紅底色和紫色圓斑及暗紅條紋，擁有兩隻眼以及一個底盤構造。小蝸唯一的表達方式是喵喵叫，但絕大部分的人都聽的懂他在說什麼。小蝸也能理解自然語言。小蝸非常討厭洗澡，討厭有人伸手進入摸他的底盤。小蝸曾經因為派大星身上的一塊餅乾而在派大星身上爬，讓海綿寶寶一度以為小蝸喜歡派大星。"),Role(relation:"主角們的朋友",name:"珊迪",info:"珊迪（Sandy Cheeks）是一隻來自德州的地松鼠，女性，因不明原因搬到比奇堡居住。在海底，她常身穿太空服裝以維持呼吸，家是一棟球型玻璃建築，裡面完全模仿陸地環境，因此在家裡牠通常只穿著一件紫色胸罩和短裙。此外她還有一對暴牙。為人樂觀開朗，相較於古板的章魚哥，她非常能夠適應海綿寶寶和派大星愚蠢，並和他們保持非常親密友好的關係。身兼科學家、探險家和發明家。熱愛運動、空手道和科學研究。牛仔競技和馬樹賽的冠軍，同時擁有空手道黑帶，後來更獲得空手道特黑黑帶，也發明許多東西如堅果咖啡機、機器人等等。她和皮老闆是比奇堡唯二的兩個科學家。需要冬眠。"),Role(relation:"反派角色",name:"皮老闆",info:"是深綠色的矮小單眼單細胞生物，男性，海之霸餐廳的經營者，本身也住在海之霸中\n皮老闆非常矮小，常常被人忽略、被踩踏等。皮老闆同時也是一個科學家，在海之霸擁有一間實驗室。皮老闆也擅長發明東西，通常是用來偷取美味蟹堡祖傳秘方，其實驗室有一批科學器材，只要擁有美味蟹堡成品，即可直接加以分析並得出其原料及秘方")],music:[],others:[WebPage(name:"fb粉絲專",url:"https://zh-tw.facebook.com/spongebob.tw")]),
    CartoonProfile(key:"辛普森家庭",tags:["美國","動畫情景喜劇","超現實幽默","社會諷刺"],cont:"該劇透過展現荷馬、美枝、霸子、花枝和奶嘴一家五口的日常生活\n，諷刺性地描繪了美國中產階級的生活方式。\n空間設定於虛構小鎮內糊的《辛普森家庭》，\n幽默地嘲諷了美國文化、社會、電視節目和人生百態",roles:[Role(relation:"主角",name:"巴塞洛繆·喬喬·「霸子」·辛普森（Bartholomew JoJo Simpson）",info:"霸子，是荷馬和美枝唯一的兒子，花枝和奶嘴的哥哥。\n霸子最引人注目的特點就是他淘氣、不服管教、不尊重權威的性格。"), Role(relation:"主角的父親",name:"荷馬·傑伊·辛普森（Homer Jay Simpson）",info:"荷馬，荷馬是部分美國工人階級的典型代表：粗魯、超重、無能、心胸狹窄、笨拙、粗心與酗酒。\n儘管過著藍領般的日子，荷馬卻有著許許多多不平凡的事跡。\n雖然他貪食、懶惰、常惹事故且非常愚蠢，\n但卻偶爾能展現出自身的才智與真實價值，\n譬如對自己家人的熱愛及保護。\n英國報章《泰晤士報》將他評述為「我們時代中最偉大的喜劇作品」"), Role(relation:"主角的母親",name:"瑪喬麗·「美枝」·辛普森（Marjorie Marge Simpson)",info:"美枝，是一位善良且極具耐心的角色\n，她最引人注目的特點便是她以一種罕見的高度佇立的藍色頭髮。\n系列的創造者馬特·格朗寧用自己母親瑪格麗特·「美枝」·格朗寧的名字來為她命名"), Role(relation:"主角的大妹妹",name:"花枝·瑪麗·辛普森（Lisa Marie Simpson)",info:"花枝，她非常聰明（IQ高達150幾），會吹奏上低音薩克斯，\n是內糊小學二年級的小學生。花枝是一位公認的環保主義者，她曾在幾集中得到創世紀獎和環保媒體獎"), Role(relation:"主角的妹妹",name:"瑪格麗特·「奶嘴」·辛普森（Margaret Maggie Simpson）",info:"奶嘴，她是辛普森一家五口中最年幼的成員，\n在劇中幾乎都以嬰兒的形態出現")],music:[],others:[]),
    CartoonProfile(key:"豆豆先生",tags:["英國","喜劇","改編"],cont:"劇情圍繞在主角_豆豆先生，耍寶是他的本事\n出洋相是他的專長，闖了禍就跑是他的特色，他的喜感全來自你我都可能會發生的日常生活中。\n此番登場的“動畫版豆豆先生”，再一次把英式卡通幽默推入全新境界：\n神秘的“空中閣樓”、房東Wicket太太討人嫌的獨眼貓、頻頻出狀況的Mini小車、洋相百出的約會晚餐、一次次瘋狂的尋寶之旅……\n有趣的對白，幽默而搞笑的故事情節，讓“豆豆先生”歷經諸多令人捧腹的困難與磨練。",roles:[Role(relation:"主角",name:"豆豆先生 ",info:"擁有一輛Mini座駕，第一集的外殼顏色是橙色（車牌：RNT 996H），\n不過在不久之後撞散；之後則換成黃綠色（車牌：SLW 287R）\n，使用外置鎖頭，而非車內置的門鎖。\n豆豆先生特別喜歡以自己的迷你作弄一輛藍色的里來恩特知更鳥三輪車（車牌：GRA 26K）\n，包括將它撞離泊車位、在車前切線（有時更導致其翻側）等"),Role(relation:"豆豆先生的最好夥伴",name:"泰迪",info:"很神奇的一隻泰迪熊\n被豆豆先生當成了有生命的好朋友\n然後有時候真的讓人覺得有生命一樣\n默默的在保護豆豆先生之類的🤔"),Role(relation:"房東太太",name:"Wicket太太",info:"養了一隻兇巴巴的貓🐱只親近房東太太"),Role(relation:"豆豆先生的女朋友",name:"艾瑪",info:"和豆豆先生的泰迪熊相對應的他也有一隻泰迪熊娃娃\n叫綠蒂（Lottie）\n每次都會親豆豆的臉頰 然後被嫌棄")],music:[],others:[WebPage(name:"英國官網",url:"https://www.mrbean.com/"),WebPage(name:"fb粉專",url:"https://www.facebook.com/pages/category/Movie/%E8%B1%86%E8%B1%86%E5%85%88%E7%94%9F-Mr-Bean-1634005029951179/")]),
    CartoonProfile(key:"哆啦Ａ夢",tags:["日本","藤子·F·不二雄","喜劇","科幻"],cont:"主角——野比大雄是家中獨子，目前就讀小學中，他和來自未來22世紀的貓型機器人哆啦A夢共同生活。\n大雄雖然是身邊圍繞著父母、老師、同學的普通小學生，但是對於運動和唸書都很不擅長，學業成績極差，平均每五次考試就有一次是零分，時常遭到同學欺侮。此外運氣也不好，經常遇到各種「災難」\n由於大雄這樣的特性，也影響到了未來子孫的生活和表現，為了讓情況有所改善，其玄孫野比世修從未來的22世紀帶了哆啦A夢來幫助大雄改變命運，利用哆啦A夢許多未來世界的秘密道具協助大雄，故事就此展開。",roles:[Role(relation:"主角之一",name:"哆啦A夢 ",info:"DORAEMON，誕生於西元2112年9月3日的貓型機器人。與大雄的曾孫世修一樣來自於22世紀。他的使命是從肚子上的四次元口袋中拿出各式各樣的「秘密道具」來幫助大雄，不過偶爾也會有糊裡糊塗或失敗的時候。對大雄來說， 哆啦Ａ夢不只是大雄的守護者，也是可以一起玩樂的好朋友。最害怕老鼠，最喜歡的是銅鑼燒！\n身高129.3公分  體重129.3公斤  力量129.3馬力"),Role(relation:"主角之一",name:"野比 大雄",info:"稱大雄NOBITA，生日是8月7日。\n10歲大的小學生，運動和唸書都不在行，不論做什麼事都會失敗，雖然是個很喜歡睡午覺的懶惰蟲，卻是個善解人意、心地善良的小男生。最擅長翻花繩與射擊。"),Role(relation:"哆啦Ａ夢的妹妹",name:"哆啦美",info:"DORAMI，誕生於西元2114年12月2日。因為與哆啦Ａ夢使用同一罐機油，所以成為哆啦Ａ夢的妹妹。比哆啦Ａ夢還優秀的哆啦美，當哥哥遇到危機時，會代替哥哥來幫助大雄。最喜歡的是菠蘿麵包，討厭蟑螂。時光機為鬱金香花型。\n身高100公分  體重91公斤  力量1萬馬力"),Role(relation:"大雄的同班同學",name:"源 靜香",info:"靜香SHIZUKA，是個可愛的小女生。既優秀，功課又好。因為非常愛乾淨，所以很喜歡洗澡。最喜歡的食物是烤地瓜。寵物是有金絲雀「小皮」和小狗「波吉」。很受大家的歡迎，不過將來的結婚對象還是選擇大雄。"),Role(relation:"大雄的同班同學",name:"剛田 武",info:"胖虎GIAN，大家都叫他胖虎。雖然是個粗暴的孩子王，不過很重視友情。在學校裡總是耀武揚威，一回到家裡卻對媽媽沒有絲毫抵抗能力，對妹妹小珠則是疼愛有加。寵物是隻名叫「木克」的狗。夢想是成為歌星，但他可怕的歌聲卻是大家的噩夢。"),Role(relation:"大雄的同班同學",name:"骨川 小夫",info:"小夫SUNEO，常常炫耀家裡很有錢。善長阿諛奉承，卻對自己的身高太矮小感到苦惱。有個弟弟叫阿哲，目前住在美國紐約。飼養了兩隻暹羅貓「奇魯奇魯」和「安娜」。喜歡追求流行，興趣相當多樣。收藏品也很豐富呢。"),Role(relation:"胖虎的妹妹",name:"小珠",info:"JAIKO，善長繪畫，長大希望成為一位漫畫家。在家中，非常受胖虎疼愛。"),Role(relation:"大雄的同班同學",name:"出木杉",info:"DEKISUGI，運動全能、品學兼優的資優生。跟靜香十分要好，是大雄可怕的對手。"),Role(relation:"大雄的媽媽",name:"野比玉子",info:"沉不住氣的老實人。為了大雄，一天到晚都在訓話。口頭禪是「好好用功!」。"),Role(relation:"大雄的爸爸",name:"野比大助",info:"從小夢想成為畫家，但現在是個平凡的上班族。表面悠哉，但對大雄說教時可是十分嚴厲的。"),Role(relation:"大雄的曾孫",name:"世修",info:"SEWASHI，居住在22世紀和哆啦美一起生活。為了照顧一無是處的大雄，特地從未來送來哆啦Ａ夢。")],music:[],others:[WebPage(name:"官網",url:"https://www.dora-world.com.tw/activity_detail.php?id=102"),WebPage(name:"youtube-DoraemonTheMovie",url:"https://www.youtube.com/channel/UChX6YTx96D5yEW7EUD7KdZQ")])]

/*
 Role(relation:"",name:"",info:""),
 Role(relation:"",name:"",info:""),
 Role(relation:"",name:"",info:""),
 Role(relation:"",name:"",info:""),
 Role(relation:"",name:"",info:""),
 Role(relation:"",name:"",info:""),
 Role(relation:"",name:"",info:""),
 Role(relation:"",name:"",info:""),
 Role(relation:"",name:"",info:"")*/

var logs=[
    CartoonLog(key:"蠟筆小新",watchs:13456,hots:63,likes:120,hearts:24),
    CartoonLog(key:"海綿寶寶",watchs:19452,hots:71,likes:378,hearts:124),
    CartoonLog(key:"辛普森家庭",watchs:25850,hots:84,likes:1012,hearts:163),
    CartoonLog(key:"豆豆先生",watchs:35687,hots:88,likes:1157,hearts:548),
    CartoonLog(key:"哆啦Ａ夢",watchs:543852,hots:93,likes:18981,hearts:4387),
    CartoonLog(key:"熊熊遇見你",watchs:21547,hots:73,likes:402,hearts:131),
    CartoonLog(key:"名偵探柯南",watchs:558461,hots:93,likes:21358,hearts:4396),
    CartoonLog(key:"魔法阿媽",watchs:1235,hots:11,likes:3,hearts:2),
    /*豆豆、阿媽、酷羅、西羅*/
    CartoonLog(key:"我們這一家",watchs:135248,hots:54,likes:15453,hearts:5451),
    CartoonLog(key:"麵包超人",watchs:645285,hots:23,likes:3254,hearts:324)
]
//照片牆
//photo:animateds[idx]
let animateds=[
    "魔法咪路咪路",
    "飛哥與小佛",
    "烏龍派出所",
    "哆啦Ａ夢",
    "豆豆先生",
    "辛普森家庭",
    "海綿寶寶",
    "蠟筆小新"
]

// 反映
let kinds=["日本","美國","歡樂","喜劇","校園","青春","搞笑","單元劇","電影版","青春"]

