//
//  AnimatsPage2.swift
//  hw2
//
//  Created by User03 on 2020/10/14.
//

import SwiftUI

struct AnimatsPage2: View {
    let id:Int
    var body: some View {
        let cartoon=cartoons[self.id]
        let profile=profiles[self.id]
        List {
            Group{
                Image(cartoon.name)
                    .resizable()//適合整個可用螢幕區
                    .scaledToFit()//保持img的長寬比例
                    .overlay(ImageOverlay(t: cartoon.name),alignment:.bottomTrailing)//疊上去
            }
            Tag(arr:profile.tags,count:profile.tags.count)
            Section(header:SectionBarAnimP2(t:"故事簡介",img:"book.fill")) {
                Text(profile.cont)
            }
            RoleSection(arr:profile.roles,name:cartoon.name)
            MusicSection(arr:profile.music)
            OthersSection(arr:profile.others)
        }
        .edgesIgnoringSafeArea(.all)
        .toolbar(content:{//design navigation bar
            ToolbarItem(placement:.principal){
                HStack{
                    Image(systemName: "book.fill")
                    Text(cartoon.name+"-簡介")
                        .modifier(BarViewModifier(size: 20))
                }.foregroundColor(.gray)
            }
        })
        .navigationBarTitleDisplayMode(.inline)
        // .navigationBarTitle(Text(cartoon.name+"-簡介"),displayMode: .inline)
    }
}

struct AnimatsPage2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnimatsPage2(id:0)
            AnimatsPage2(id:0)
                .preferredColorScheme(.dark)
        }
    }
}
struct ImageOverlay:View{
    let t:String
    var body: some View{
        VStack{
            Text(t)
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)//不透明度
        .cornerRadius(10.0)
        .padding(6)
    }
}

struct CounterLikes:View{
    @State private var counter = false
    @State private var img = "heart"
    var body: some View{
        Button(action:{
            self.counter = !self.counter
            if(counter){
                self.img="heart.fill"
            }else{
                self.img="heart"
            }
        }){
            Image(systemName:img).resizable()
                .frame(width: 25, height: 25).scaledToFit().foregroundColor(.red)
        }
    }
}
struct Tag:View{
    let arr:[String]
    let count:Int
    var body: some View{
        ScrollView {
            HStack{
                ForEach(0..<count){(i) in
                    //讓 SwiftUI List 的 row 有多個可點選的 NavigationLink
                    NavigationLink(destination: SearchPage2(letter:arr[i])){
                        SearchBlock(key:arr[i])
                    }
                }
                Spacer()
                CounterLikes()
            }
        }.fixedSize(horizontal: false, vertical: true)
        .listRowInsets(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
    }
}

struct SearchBlock: View {
    let key:String
    var body: some View {
            ZStack {
                Text(" "+key+" ")
                    .modifier(TWViewModifier(size: 18))//使用自訂字體
                    .padding(6)
                    .background(Color.black)
                    .foregroundColor(Color(red: 255/255, green: 197/255, blue: 18/255))
                    .cornerRadius(13)
                Spacer()
            }
    }
}

struct RoleSection: View {
    let arr:[Role]
    let name:String
    var body: some View {
        Section(header: SectionBarAnimP2(t:"主要角色",img:"person.3.fill")) {
            ScrollView(.horizontal,showsIndicators:false){
                HStack(spacing:10){
                    ForEach(arr.indices){(idx)in
                        NavigationLink(destination: AnimatsPage3(character:arr[idx])){
                            Image(arr[idx].name)
                                .resizable()
                                .scaledToFit()
                                .frame(width:100,height:100,alignment:.center)//放在自定義的框架中
                                .background(Color.white)
                                .clipShape(Circle())
                                .overlay(Circle().strokeBorder(Color.orange, lineWidth: 7))
                        }
                    }
                }
            }
        }
    }
}

struct MusicSection:View {
    let arr:[Music]
    var body: some View {
        if(!arr.isEmpty){
            Section(header: SectionBarAnimP2(t:"主題曲",img:"music.quarternote.3")) {
                List(){
                    ForEach(arr.indices){(i) in
                        HStack{
                            Text(arr[i].name)
                                .modifier(TWViewModifier(size: 18))
                            Spacer()
                            MusicView(song: arr[i].name)
                        }
                    }
                }.frame(height: 100, alignment: .center)
            }
        }
    }
}

struct OthersSection:View {
    let arr:[WebPage]
    var body: some View{
        if(!arr.isEmpty){
            Section(header: SectionBarAnimP2(t:"其他資訊",img:"text.book.closed.fill")) {
                List(){
                    ForEach(arr.indices){(i)in
                        Link(arr[i].name, destination: URL(string:arr[i].url)!)
                            .modifier(TWViewModifier(size: 18))
                    }
                }
            }
        }
    }
}


struct SectionBarAnimP2: View{
    let t : String
    let img : String
    var body: some View{
        let sectTxtColor = Color(red: 10/255, green: 10/255, blue: 255/255)
        let sectImgColor = Color(red: 150/255, green: 217/255, blue: 220/255)
        HStack{
            Image(systemName:img)
                .foregroundColor(sectImgColor)
            Text(t)
                .foregroundColor(sectTxtColor)
                .modifier(TWViewModifier(size: 20))
        }
    }
}
