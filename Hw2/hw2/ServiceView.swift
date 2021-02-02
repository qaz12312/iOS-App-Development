//
//  ServiceView.swift
//  hw2
//
//  Created by User03 on 2020/10/14.
//

import SwiftUI
//讓開不了口的 App 開口說話 !
import AVFoundation

// 多行捲動文字的 TextEditor
struct ServiceView: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View {
        NavigationView{
            Form{
                TextBar()
                Example()
                TodayTime()
                MyTextFild()
            }.frame(alignment:.center)
            .background(Color.yellow)
            .edgesIgnoringSafeArea(.all)
            .toolbar(content:{//design navigation bar
                ToolbarItem(placement:.principal){
                    HStack{
                        Image(systemName: "questionmark.diamond.fill")
                        Text("Customer Service")
                            .modifier(BarViewModifier(size: 30))
                    }.foregroundColor(.gray)
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView()
    }
}

struct TextBar:View {
    @State private var item :String = ""//用來讀取輸入
    @State private var isSend:Bool = false
    let utterance =  AVSpeechUtterance(string: "Cartoons")//要講的話
    let synthesizer = AVSpeechSynthesizer()//發出聲音的合成器
    var body: some View{
        HStack(alignment: .center){
            TextField("想新增什麼主題的卡通?",text:$item)
                //邊框
                .modifier(TWViewModifier(size: 20))
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.blue, lineWidth: 2))
                .padding()
            Button(action: {
                if !item.isEmpty{
                    isSend = true
                    utterance.pitchMultiplier = 2//講話的音調，範圍是 0.5 ~ 2
                    utterance.rate = 0.3//講話的速度，範圍是 0 ~ 1
                    utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")//講話聲音的語言
                    synthesizer.speak(utterance)
                }
            }){
                Text("sure").bold()
            }.buttonStyle(MyButton())
            .alert(isPresented: $isSend){ () -> Alert in
                return Alert(title: Text(item),message:Text("感謝您~將盡速新增相關卡通"), primaryButton: .default(Text("給一個讚👍🏻").foregroundColor(Color.red), action: {
                    print("已送出")
                }), secondaryButton: .default(Text("不用了"), action: {
                    print("取消要求")
                }))
            }
        }
    }
}
struct Example:View {
    var body: some View{
        ScrollView(.horizontal,showsIndicators:false) {
            HStack(spacing:10){
                ForEach(kinds, id:\.self) { (item) in
                    BlockView(t:item)
                }
            }
        }
    }
}
struct DayView: View {
    let day: Int
    
    var body: some View {
        VStack {
            Image(systemName: "calendar.circle")
            Text("10/\(day)")
        }
        .font(day == 10 ? .largeTitle : .body)
    }
}
struct TodayTime:View {
    var body: some View{
        //使用 LazyHStack / LazyVStack 搭配卡住不動(pinned)的 header / footer
        ScrollView(.horizontal) {
            LazyHStack(pinnedViews: [.sectionHeaders]) {//控制 header & footer 是否卡住
                Section(header: Text("時間:").padding(8).background(Color.black).foregroundColor(.yellow), footer: Text("...")) {
                    ForEach(1..<32) { (index) in
                        DayView(day: index)
                    }
                }
            }.fixedSize()
        }
    }
}

struct MyTextFild:View {
    var body: some View{
        TextEditor(text: .constant("""
    Hi ,


    Thanks for contacting Cartoons Support.


    We received your message and we'll respond to you as soon as possible.


    In the meantime, we recommend checking out our Help Center at help.Cartoons.com to see if you can find an answer there more quickly.


    Feel free to respond to this email if you find the answer you were looking for, or if you'd like to provide more information.


    Best,
    Cartoons
    """
        )).foregroundColor(.purple)
        .modifier(ENViewModifier(size: 18))
        .frame(height: 500)
    }
}

struct MyButton:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color(red:170/255,green:176/255,blue:109/255), Color(red:73/255,green:162/255,blue:171/255)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(4)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.1 )//縮放
    }
}

struct BlockView: View {
    let t: String
    var body: some View {
        VStack {
            Image(systemName: "star.fill").foregroundColor(.blue)
            Text(t)
        }.font(.custom("YuppyTC-Regular",size:20))//使用自訂字體
        .padding(10)
        .background(Color.white)
        .foregroundColor(Color.black)
    }
}
