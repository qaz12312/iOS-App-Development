//
//  MenuView.swift
//  hw3
//
//  Created by User03 on 2020/10/27.
//

import SwiftUI

struct MenuView: View {
    @State var themeColor:Color = Color(red: 25/255, green: 179/255, blue: 177/255)
    @State private var option = 0
    @State var isSetting = false
    var body: some View {
        ZStack{
            Image("menu").resizable().scaledToFill().edgesIgnoringSafeArea(.all)
        VStack{
            MyTitle(themeColor:themeColor)
            OptPicker(option:$option,themeColor:themeColor)
            switch option {
            case 1://推薦
                RecommView(bgColor:themeColor)
            case 2://設定
                SettingView(themeColor:$themeColor)
            default://總覽
                ShowView(bgColor:themeColor)
            }
        }.padding([.leading,.trailing],50)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
struct MyTitle: View{
    @State private var showSheet = false
    @State private var showImg = true
    let themeColor:Color
    var body: some View{
        VStack{
            LblBtn(showImg:$showImg)
            ImgBtn(showImg:$showImg,themeColor: themeColor)
        }
    }
}


struct LblBtn: View{
    @State private var showingSheet = false
    @State private var fontSize:CGFloat = CGFloat(20)
    @Binding var showImg:Bool
    var body: some View{
        Label("蠟筆小新",systemImage:"film")
            .modifier(AnimatableCustomFontModifier(size: fontSize))
            .onTapGesture {
                if(fontSize==CGFloat(30)){
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1)) {
                        fontSize = 20
                    }
                }
                else{
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1)) {
                        fontSize = 30
                    }
                }
            }
            .frame(height:35)
    }
}

struct ImgBtn: View {
    @Binding var showImg:Bool
//    @Binding var themeColor:Color
    let themeColor:Color
    let place = Place(site: "日本埼玉縣春日部", latitude: 35.981495, longitude: 139.745527)
    var body: some View {
        if(showImg) {
            Rectangle()
                .aspectRatio(1.8, contentMode: .fit)
                .overlay(
                    Image("蠟筆小新")
                        .resizable()
                        .scaledToFill()
                        .overlay(ImageOverlay(place: place, themeColor: themeColor),alignment:.bottomTrailing)//疊上去
                )
                .clipped()
                .cornerRadius(30)
                .shadow(color:Color.gray, radius: 15)
                .transition(.opacity)
                .contextMenu {
                    Button(action: {
                        self.showImg = false
                    }) {
                        Text("不想看到圖片")
                        Image(systemName: "eye.slash")
                    }
                    Button(action: {}) {
                        Text("繼續留著好了")
                        Image(systemName: "eye")
                    }
                }
                .onAppear {
                    self.showImg = true
                    
                }
                .onDisappear {
                    self.showImg = false
                }
        }
    }
}

struct ImageOverlay:View{
    let place:Place
    @State var showMapSheet:Bool = false
    let themeColor:Color
    var body: some View{
        Button(action:{
            showMapSheet = true
        }){
            HStack{
                Image(systemName: "map.fill")
                Text(place.site)
                    .modifier(AnimatableCustomFontModifier(size: CGFloat(15)))
            }
            .padding(6)
            .foregroundColor(.white)
            .background(Color.black)
            .opacity(0.8)//不透明度
            .cornerRadius(10.0)
            .padding([.trailing,.bottom],8)
        }.buttonStyle(PlainButtonStyle())
        .fullScreenCover(isPresented: $showMapSheet){
            MapView(showMap: $showMapSheet,name: place.site ,latitude: place.latitude, longitude: place.longitude, themeColor: themeColor)
        }
    }
}

struct OptPicker: View {
    @Binding var option: Int
    let themeColor:Color
    let options=["總覽", "推薦","設定"]
    var body: some View {
        Picker("電影",selection: self.$option){
            ForEach(0 ..< options.count) { (index) in
                Text(self.options[index])
                    .modifier(TWViewModifier(size: 30))
            }
        }.background(themeColor)
        .cornerRadius(5)
        .pickerStyle(SegmentedPickerStyle())
        .scaleEffect(1.1)
        .padding([.leading,.trailing],20)
    }
}

