//
//  InfoView.swift
//  RandomGame
//
//  Created by User06 on 2021/1/22.
//

import SwiftUI

struct InfoView: View {
    @Binding var showInfo : Bool
    var info:Game
    var body: some View {
        List {
            HStack{
                Label(
                    title: { Text("  \(info.name)").fontWeight(.bold)
                        .font(.title) },
                    icon: { Image(systemName: "gamecontroller.fill").resizable()
                        .scaledToFit()
                        .frame(width:50) }
                ).padding([.leading],10)
                Spacer()
                //closeBtn
                Button(action: {
                    showInfo.toggle()
                }){
                    Image(systemName: "xmark.circle.fill")
                        .scaleEffect(1.5)
                }.buttonStyle(PlainButtonStyle())
            }
            PhotoView(photo: info.name)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Label(
                        title: {Text("人數:\(info.persons)") },
                        icon: { Image(systemName: "person.3.fill") }
                    )
                    Label(
                        title: { Text("遊戲時間:\(info.time)") },
                        icon: { Image(systemName: "hourglass") }
                    )
                }
            }
            .padding(3)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.yellow).opacity(0.25))
            .padding(3)
            Section(header: SectionBar(t:"介紹",img:"lasso.sparkles")) {
                Text(info.describe)
            }
            Section(header: SectionBar(t:"玩法",img:"play.tv")) {
                WebView(url:info.video)
                    .scaledToFit()
            }
        }
    }
}

struct SectionBar: View{
    let t : String
    let img : String
    var body: some View{
        let sectTxtColor = Color(red: 25/255, green: 179/255, blue: 177/255)
        let sectImgColor = Color(red: 3/255, green: 75/255, blue: 97/255)
        HStack{
            Image(systemName:img)
                .foregroundColor(sectImgColor)
            Text(t)
                .foregroundColor(sectTxtColor)
        }
    }
}

struct PhotoView: View {
    let photo : String
    @State var isShow : Bool = false
    var body: some View{
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .foregroundColor(Color(red: 252/255, green: 211/255, blue: 209/255))
                .edgesIgnoringSafeArea(.all)
            if(isShow){
                
                Image(photo)
                    .resizable()//適合整個可用螢幕區
                    .scaledToFit()
                    .frame(height: 280)
                    //Neumorphic Design
                    .shadow(
                        color: Color(red: 23/255, green: 21/255, blue: 22/255).opacity(0.5),
                        radius: 14,
                        x: 14,
                        y: 14)
            }
        }.animation(.easeInOut(duration:2))//easeInOut:動畫速度一開始慢，然後愈來愈快，最後再愈來愈慢，指定動畫的時間為 2 秒鐘
        .onAppear {//在 onAppear 裡觸發動畫，讓動畫在畫面出現時自動開始表演
            self.isShow = true
        }
        .onDisappear {
            self.isShow = false
        }
    }
}
