//
//  InfoPage2.swift
//  hw2
//
//  Created by User03 on 2020/10/14.
//

import SwiftUI

struct InfoPage2: View {
    let id:Int
    init(id:Int){
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().backgroundColor = .clear
            self.id=id
        }
    var body: some View {
        let barImgColor = Color(red: 25/255, green: 179/255, blue: 177/255)
        let barTxtColor = Color(red: 3/255, green: 75/255, blue: 97/255)
        let lisTxtColor = Color(red: 1, green: 194/255, blue: 195/255)
        let lisBgColor = Color(red: 14/255, green: 3/255, blue: 1/255)
        let photoBgColor = Color(red: 1, green: 194/255, blue: 195/255)
        let info=infos[self.id]
        List{
            PhotoSection(arr:info.photos)
                .listRowBackground(photoBgColor)
            TitleSection(kind:info.kind,title: info.time)
                .modifier(TWViewModifier(size: 20))
                .listRowBackground(photoBgColor)
            Section(header: SectionBarInfo(t:"介紹",img:"lightbulb.fill")){
                ForEach(info.others.indices){(i) in
                    Text(info.others[i])
                        .foregroundColor(lisTxtColor)
                        .modifier(TWViewModifier(size: 19))
                        .listRowBackground(lisBgColor)
                }
            }
            if(!info.film.isEmpty){
                FilmSection(url:info.film[0])
                    .listRowBackground(lisBgColor)
            }
        }.background(lisBgColor)
        .edgesIgnoringSafeArea(.all)
        .toolbar(content:{//design navigation bar
            ToolbarItem(placement:.principal){
                HStack{
                    Image(systemName: "text.bubble.fill")
                        .scaleEffect(1.6)
                        .foregroundColor(barImgColor)
                    Text(" \(info.key)-快訊")
                        .foregroundColor(barTxtColor)
                        .modifier(BarViewModifier(size: 27))
                }
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InfoPage2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InfoPage2(id:0)
        }
    }
}

struct PhotoSection: View {
    let arr:[String]
    var body: some View{
        if(!arr.isEmpty){
            //利用 PageTabViewStyle 實現分頁瀏覽
            TabView{
                ForEach(arr.indices){(i) in
                    Image(arr[i])
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .frame(height: 230)
        }
    }
}
struct TitleSection:View{
    let kind:String
    let title:String
    var body: some View{
        ScrollView {
            HStack{
                Spacer()
                Text(kind)
                Spacer()
                Text(title)
                Spacer()
                PressBookmark()
                Spacer()
            }
        }.fixedSize(horizontal: false, vertical: true)
        .listRowInsets(EdgeInsets())
    }
}
struct PressBookmark:View{
    @State private var isPress = false
    @State private var img = "bookmark"
    var body: some View{
        Button(action:{
            self.isPress = !self.isPress
            if(isPress){
                self.img="bookmark.fill"
            }else{
                self.img="bookmark"
            }
        }){
            Image(systemName:img)
                .resizable()
                .frame(width: 25, height: 33)
                .scaledToFit()
                .foregroundColor((Color(red: 25/255, green: 179/255, blue: 177/255)))
        }
    }
}

struct FilmSection: View{
    let url:WebPage
    var body: some View{
        Section(header: SectionBarInfo(t:self.url.name,img:"globe")){
            WebView(url:self.url.url)
                .scaledToFit()
        }
    }
}

struct SectionBarInfo: View{
    let t : String
    let img : String
    var body: some View{
        let sectTxtColor = Color(red: 25/255, green: 179/255, blue: 177/255)
        let sectImgColor = Color(red: 3/255, green: 75/255, blue: 97/255)
        HStack{
            Image(systemName:img).foregroundColor(sectImgColor)
            Text(t).foregroundColor(sectTxtColor).modifier(TWViewModifier(size: 20))
        }
    }
}
