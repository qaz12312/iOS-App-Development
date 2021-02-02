//
//  SettingView.swift
//  hw3
//
//  Created by User03 on 2020/10/27.
//

import SwiftUI

struct SettingView: View {
    @Binding var themeColor:Color
    @State var isExpandedTheme:Bool = false
    @State var isExpandedMusic:Bool = true
    var body: some View {
            List{
                DisclosureGroup(
                    isExpanded: $isExpandedTheme,
                    content: {
                        ThemeBlock(txt:"預設",txtColor: Color.black,themeColor: Color(red: 25/255, green: 179/255, blue: 177/255),control:$themeColor)
                        ThemeBlock(txt:"sky",txtColor: Color.black,themeColor: Color(red:155/255,green:177/255,blue:255/255),control:$themeColor)
                        ThemeBlock(txt:"grass",txtColor: Color.black,themeColor: Color(red: 108/255, green: 189/255, blue: 155/255),control:$themeColor)
                        ThemeBlock(txt:"sweet",txtColor: Color.black,themeColor: Color(red: 252/255, green: 211/255, blue: 209/255),control:$themeColor)
                        ThemeBlock(txt:"light",txtColor: Color.black,themeColor: Color(red: 246/255, green: 228/255, blue: 4/255),control:$themeColor)
                        ColorPickerView(control:$themeColor, txt:"自己決定！")
                    },
                    label:{
                        SectionBar(txt: "主題", img: "circle.grid.hex.fill", themeColor: $themeColor)
                    }
                )
                DisclosureGroup(
                    isExpanded: $isExpandedMusic,
                    content: {
                        MusicRow(name: "オラはにんきもの", song: "song1",themeColor:themeColor)
                        MusicRow(name: "パカッポでGO!", song: "song2",themeColor:themeColor)
                        MusicRow(name: "\"年中夢中\"I Want You", song: "song3",themeColor:themeColor)
                        MusicRow(name: "とべとべおねいさん", song: "song4",themeColor:themeColor)
                    },
                    label:{
                        SectionBar(txt: "音樂", img: "music.note", themeColor: $themeColor)
                    }
                )
            }.clipped()
    }
}

struct ThemeBlock:View{
    let txt:String
    let txtColor:Color
    let themeColor:Color
    @Binding var control:Color
    let fontSize:CGFloat = CGFloat(20)
    var body: some View{
        HStack{
            Text(txt)
                .foregroundColor(txtColor)
                .modifier(TWViewModifier(size: fontSize))
            Spacer()
        }.listRowBackground(themeColor).edgesIgnoringSafeArea(.all).onTapGesture{
            control = themeColor
        }
    }
}

struct ColorPickerView: View {
    @Binding var control:Color
    var txt:String
    var body: some View {
        ColorPicker(txt,selection:$control, supportsOpacity: true)
    }
}

struct MusicRow: View{
    let name:String
    let song:String
    let themeColor:Color
    var body: some View{
        HStack{
            Text(name)
                .modifier(TWViewModifier(size:20))
            Spacer()
            MusicView(song: song,themeColor:themeColor)
        }.padding(.trailing,10)
    }
}

struct SectionBar: View{
    let txt : String
    let img : String
    @Binding var themeColor:Color
    var body: some View{
        HStack{
            Image(systemName:img)
                .foregroundColor(themeColor)
            Text(txt)
                .foregroundColor(.black)
                .modifier(TWViewModifier(size: 25))
        }
    }
}
