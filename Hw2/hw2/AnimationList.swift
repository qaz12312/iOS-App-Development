//
//  AnimationList.swift
//  hw2
//
//  Created by User03 on 2020/10/14.
//

import SwiftUI

struct AnimationList: View {
    @State var option:Int=0//選擇區塊
    init(){
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().backgroundColor = .clear
        }
    var body: some View {
        let barImgColor = Color(red: 0/255, green: 0/255, blue: 187/255)
        let barTxtColor = Color(red: 138/255, green: 84/255, blue: 180/255)
        let lisBgColor = Color(red: 225/255, green: 251/255, blue: 196/255)

        NavigationView{
            List {
                KindSection(option: $option)
                    .modifier(TWViewModifier(size: 20))
                    .listRowInsets(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 10))
                    .listRowBackground(lisBgColor)
                PrintSection(choice:$option)
                    .listRowBackground(lisBgColor)
            }.background(lisBgColor)
            .edgesIgnoringSafeArea(.all)
            .toolbar(content:{//design navigation bar
                ToolbarItem(placement:.principal){
                    HStack{
                        Image(systemName: "play.rectangle.fill")
                            .foregroundColor(barImgColor)
                            .scaleEffect(1.6)
                        Text(" Animated Films")
                            .foregroundColor(barTxtColor)
                            .modifier(BarViewModifier(size: 30))
                    }
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AnimationList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnimationList()
            AnimationList()
                .preferredColorScheme(.dark)
        }
    }
}

struct KindSection: View{
    @Binding var option:Int
    var body: some View{
        ScrollView {
            HStack {
                KindBtn(option: $option, choice: 0)
                KindBtn(option: $option, choice: 1)
                KindBtn(option: $option, choice: 2)
                KindBtn(option: $option, choice: 3)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        //ScrollView 的寬度才會變成幾乎等於螢幕的寬度
    }
}

struct PrintSection:View{
    @Binding var choice:Int
    var body: some View{
        switch choice {
        case 0:
            LinkSection(icon:"books.vertical.fill",t:"已完結",choice: 0)
            LinkPartSection(icon:"books.vertical",t:"未完結",choice: 0)
        case 1:
            LinkSection(icon:"flame",t:"熱度排行",choice: 1,noCond:true)
        case 2:
            LinkSection(icon:"hand.tap.fill",t:"推薦榜單",choice: 2,noCond:true)
        case 3:
            LinkSection(icon:"arrow.down.heart.fill",t:"收藏榜單",choice: 3,noCond:true)
        default:
            LinkSection(icon:"books.vertical.fill",t:"已完結",choice: 0,noCond:true)
            LinkPartSection(icon:"books.vertical",t:"未完結",choice: 0)
        }
        
    }
}

struct LinkSection: View {
    let icon:String
    let t:String
    let choice:Int
    var noCond:Bool=false
    var body: some View {
        Section(header:SectionBarAnim(t:t,img:icon)) {
            ForEach(cartoons.indices){(i) in
                if(cartoons[i].isEnd || noCond){
                    if(i<5){
                        NavigationLink(destination: AnimatsPage2(id:i)){
                            AnimatedRow(id:i,choice: choice)
                        }
                    }else{
                        AnimatedRow(id:i,choice: choice)
                    }
                }
            }
        }
    }
}

struct LinkPartSection: View {
    let icon:String
    let t:String
    let choice:Int
    var body: some View {
        Section(header:SectionBarAnim(t:t,img:icon)) {
            ForEach(cartoons.indices){(i) in
                if(!cartoons[i].isEnd){
                    if(i<5){
                        NavigationLink(destination: AnimatsPage2(id:i)){
                            AnimatedRow(id:i,choice: choice)
                        }
                    }else{
                        AnimatedRow(id:i,choice: choice)
                    }
                }
            }
            
            
        }
    }
}

struct KindBtn : View {
    @Binding var option:Int
    let choice:Int
    var body: some View {
        let optiont=[" 總覽 "," 熱度榜 "," 推薦榜 "," 收藏榜 "]
        let t=optiont[choice]
        Button(action:{
            option = self.choice
        }){
            Text(t)
                .foregroundColor(Color(red: 1/255, green: 66/255, blue: 84/255))
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 15)
                .strokeBorder(Color(red: 1/255, green: 66/255, blue: 84/255), lineWidth: 3))
        }
    }
}

struct SectionBarAnim: View{
    let t : String
    let img : String
    var body: some View{
        let sectTxtColor = Color(red: 138/255, green: 84/255, blue: 162/255)
        let sectImgColor = Color(red: 255/255, green: 96/255, blue: 175/255)
//        let sectTxtColor = Color(red: 202/255, green: 142/255, blue: 255/255)
//        let sectImgColor = Color(red: 255/255, green: 191/255, blue: 255/255)
        HStack{
            Image(systemName:img)
                .foregroundColor(sectImgColor)
            Text(t)
                .foregroundColor(sectTxtColor)
                .modifier(TWViewModifier(size: 20))
        }
    }
}
