//
//  SettingView.swift
//  hw2
//
//  Created by 慈慈 on 2020/10/20.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        ZStack{
            //設定漸層背景，由上而下變化
            LinearGradient(gradient: Gradient(colors: [Color(red:173/255,green:9/255,blue:0/255), Color(red:24/255,green:0/255,blue:102/255)]), startPoint: .top, endPoint: .bottom).opacity(0.3).edgesIgnoringSafeArea(.all)
            VStack{
                MyTitle()
                Spacer()
                ChoiceIcon()
                Spacer()
            }
        }
    }
}

struct MyTitle:View{
    var body: some View{
        //用 SwiftUI 組合多種文字樣式
        HStack{
            Text("選擇")
                .underline()
            + Text("喜歡")
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            + Text("的")
            + Text("AppIcon")
                .fontWeight(.heavy)
                .foregroundColor(Color(red:225/255,green:46/255,blue:75/255))
            + Text("吧！")
        }
        .modifier(TWViewModifier(size: 30))
        .padding(20)
    }
}

struct ChoiceIcon:View{
    var body: some View{
        VStack{
            HStack {
                Button(action: {
                    UIApplication.shared.setAlternateIconName(nil)
                }) {
                    Image("Icon1")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .shadow(radius: 10)
                }
                Icon(id: "x", img: "Icon2")
            }
            Divider()
            HStack {
                Icon(id: "y", img: "Icon3")
                Icon(id: "z", img: "Icon4")
            }
        }.padding(20)
    }
}

struct Icon: View{
    let id:String
    let img:String
    var body: some View {
        Button(action: {
            UIApplication.shared.setAlternateIconName(id)
        }) {
            Image(img)
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
                .shadow(radius: 10)
        }
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
