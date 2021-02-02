//
//  ChartView.swift
//  hw4
//
//  Created by User03 on 2020/11/17.
//

import SwiftUI

struct ChartView: View {
    @ObservedObject var codeData = CodeData()
   
    var total: Int = 0
    var languageCount = [Int](repeating: 0, count: LanguageOpts.count)
    var lanPercentage = [Double](repeating: 0, count: LanguageOpts.count)
    var hardCount:[Int] = [0, 0, 0, 0, 0]
    var knownCount:Int = 0 // true
    var algorithmCount = [Int](repeating: 0, count: AlgorithmOpts.count)
    var algPercentage = [Double](repeating: 0, count: AlgorithmOpts.count)
    
    var body: some View {
        List{
            VStack(alignment: .leading){
                MyText(txt:"目前已記錄\(total)筆code",color:Color.black,isTW:true,size:20)
                TotalBar(val: self.total)
            }.listRowBackground(Color.clear)
            // Bar
            ShowBar(total: self.total, lanPercentage: self.lanPercentage, algPercentage: self.algPercentage)
            // 圓餅圖
            ShowPie(total: self.total, languageCount: self.languageCount, algorithmCount: self.algorithmCount, hardCount: self.hardCount)
            // 進度條
            ShowCircleProcess(total: self.total, knownCount: self.knownCount)
        }.listStyle(GroupedListStyle())
        .background(Image("bg2").resizable().scaledToFill().edgesIgnoringSafeArea(.all))
    }
    init(codeData: CodeData){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.codeData = codeData
        for code in codeData.codes{
            total += 1
            if let lanIdx = LanguageOpts.firstIndex(of: code.language){
                languageCount[lanIdx] += 1
            }
            hardCount[code.hard-1] += 1
            if code.isKnown {
                knownCount += 1
            }
            if let aloIdx = AlgorithmOpts.firstIndex(of: code.algorithm){
                algorithmCount[aloIdx] += 1
            }
        }
        for i in 0 ..< languageCount.count{
            lanPercentage[i] = Double(languageCount[i]) / Double(total)
        }
        for i in 0 ..< algorithmCount.count{
            algPercentage[i] = Double(algorithmCount[i]) / Double(total)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(codeData:CodeData())
    }
}
struct ShowBar:View {
    let choiceBar:[String]=["language","algorithm"]
    @State var optionBar:String = "language"
    let total:Int
    let lanPercentage:[Double]
    let algPercentage:[Double]
    var body: some View{
        VStack{
            Picker("BarChart",selection: self.$optionBar){
                ForEach(choiceBar) { item in
                    MyText(txt:item,color:Color.blue,isTW:false,size:20)
                }
            }.pickerStyle(SegmentedPickerStyle())
            if total==0{
                ShowNoData()
            }
            else{
                if optionBar == choiceBar[1]{
                    //algorithm
                    BarChart(val: algPercentage,key:AlgorithmOpts,backColor:Color(red:209/255,green:244/255,blue:250/255),fontColor:Color(red:1,green:205/255,blue:205/255),txtColor: Color(red:0,green:87/255,blue:146/255))
                }else {
                    //language
                    BarChart(val: lanPercentage,key:LanguageOpts,backColor:Color(hue: 0.776, saturation: 0.139, brightness: 0.952),fontColor:Color(hue: 0.322, saturation: 0.222, brightness: 1.0, opacity: 0.791),txtColor: Color(hue: 0.759, saturation: 0.378, brightness: 0.463))
                }
            }
        }.listRowBackground(Color.clear)
    }
}

struct ShowPie:View {
    @State var optionPie:String = "language"
    let choicePie:[String]=["difficulty","language","algorithm"]
    let total:Int
    let languageCount:[Int]
    let algorithmCount:[Int]
    let hardCount:[Int]
    var body: some View{
        VStack{
            Picker("PieChart",selection: self.$optionPie){
                ForEach(choicePie) { item in
                    MyText(txt:item,color:Color.blue,isTW:false,size:30)
                }
            }.pickerStyle(SegmentedPickerStyle())
            if total==0{
                ShowNoData()
            }else{
                if optionPie == choicePie[1]{
                    //language
                    let colors=[Color(red: 136/255, green: 162/255, blue: 173/255),
                                Color(red: 192/255, green: 214/255, blue: 223/255),
                                Color(red: 234/255, green: 234/255, blue: 234/255),
                                Color(red: 232/255, green: 189/255, blue: 188/255),
                                Color(red: 255/255, green: 207/255, blue: 173/255),
                                Color(red: 255/255, green: 228/255, blue: 184/255),
                                Color(red: 230/255, green: 209/255, blue: 177/255),
                                Color(red: 156/255, green: 164/255, blue: 150/255),
                                Color(red: 184/255, green: 170/255, blue: 149/255),
                                Color(red: 170/255, green: 163/255, blue: 162/255)]
                    PieChart(arrCount:languageCount,arrName:LanguageOpts, colorSet: colors)
                }else if optionPie == choicePie[2]{
                    //algorithm
                    let colors=[Color(red: 254/255, green: 254/255, blue: 254/255),
                                Color(red: 197/255, green: 236/255, blue: 225/255),
                                Color(red: 143/255, green: 219/255, blue: 199/255),
                                Color(red: 184/255, green: 224/255, blue: 191/255),
                                Color(red: 237/255, green: 224/255, blue: 196/255),
                                Color(red: 232/255, green: 201/255, blue: 191/255),
                                Color(red: 229/255, green: 179/255, blue: 191/255),
                                Color(red: 187/255, green: 164/255, blue: 203/255),
                                Color(red: 154/255, green: 168/255, blue: 203/255),
                                Color(red: 132/255, green: 168/255, blue: 199/255),
                                Color(red: 136/255, green: 162/255, blue: 173/255),
                                Color(red: 163/255, green: 162/255, blue: 173/255)]
                    PieChart(arrCount:algorithmCount,arrName:AlgorithmOpts, colorSet: colors)
                }else{
                    //difficulty
                    let colors = [Color(red: 245/255, green: 183/255, blue: 177/255),
                                  Color(red: 245/255, green: 203/255, blue: 167/255),
                                  Color(red: 249/255, green: 231/255, blue: 159/255),
                                  Color(red: 163/255, green: 228/255, blue: 215/255),
                                  Color(red: 169/255, green: 204/255, blue: 221/255)]
                    PieChart(arrCount:hardCount,arrName:["1顆星","2顆星","3顆星","4顆星","5顆星"], colorSet: colors)
                }
            }
        }.listRowBackground(Color.clear)
    }
}
struct ShowCircleProcess:View{
    let total:Int
    let knownCount:Int
    var body: some View{
        VStack(alignment: .leading){
            MyText(txt:"未理解的題目還有：\(total-knownCount)題",color:Color.black,isTW:true,size:20)
            HStack{
                Spacer()
                if total==0{
                    ShowNoData()
                }else{
                    CircleProcess(taskName: "完成進度",process:Double(knownCount)/Double(total),backColor:Color(red: 179/255, green: 185/255, blue: 229/255),fontColor:Color(red: 163/255, green: 239/255, blue: 159/255))
                }
                Spacer()
            }
        }.listRowBackground(Color.clear)
    }
}
struct ShowNoData:View{
    var body: some View{
        MyText(txt:"目前沒有資料呦 !",color:Color.white,isTW:true,size:20)
            .padding(6)
            .background(Color.black)
            .opacity(0.8)//不透明度
            .cornerRadius(10.0)
            .padding(6)
    }
}


struct TotalBar: View{
    @State private var long: CGFloat = 0 //0~10
    let val: Int
    var body: some View
    {
        HStack{
            Rectangle()
                .overlay(
                    Image("horbar")
                        .resizable()
                        .scaledToFill()
                )
                .clipped()
                .frame(width: self.long*10, height: 20)
            MyText(txt:"\(self.val)",color:Color.black,isTW:false,size:15)
                .shadow(color:Color.gray, radius: 15)
        }.padding(.leading)
        .animation(.linear(duration:  1.1))
        .onAppear
        {
            self.long = CGFloat(self.val)
        }
        .onDisappear{
            self.long = 0
        }
    }
}


