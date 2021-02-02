//
//  PhotoView.swift
//  hw2
//
//  Created by User07 on 2020/10/18.
//

import SwiftUI

struct PhotoView: View {
    var body: some View {
        NavigationView{
            List {
                //上下捲動的 List 裡有水平捲動的 ScrollView ＆ LazyHGrid
                Upper()
                Lower()

            }
            .onAppear {
                UITableView.appearance().separatorColor = .clear
            }.padding(.bottom,10)
            .edgesIgnoringSafeArea(.all)
            .toolbar(content:{//design navigation bar
                ToolbarItem(placement:.principal){
                    HStack{
                        Image(systemName: "photo.on.rectangle.angled").foregroundColor(Color(red: 255/255, green: 197/255, blue: 18/255))
                        Text("相片牆").foregroundColor(Color(red: 138/255, green: 84/255, blue: 162/255)).modifier(BarViewModifier(size: 20))
                    }
                }
            })
            .navigationBarTitleDisplayMode(.inline)//利用 inline 縮短 navigation bar 的高度
        }
    }
}
struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}


struct Upper:View {
    var body: some View{
        //使用格子狀排列的 LazyVGrid 實現照片牆
        //NavigationView {
        ScrollView(.horizontal) {
            let rows = [GridItem()]
            LazyHGrid(rows: rows) {
                ForEach(animateds.indices) { (idx) in
                    NavigationLink(destination:ModiferImgView(img:animateds[idx])) {
                        VStack {
                            Image(animateds[idx])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipped()
                            Text(animateds[idx])
                                .font(.custom("HFVoyager-2",size:22))
                        }
                        .shadow(radius: 10)
                        .overlay(
                            Image(systemName: "\(idx+1).circle.fill")
                                .font(.largeTitle)
                            , alignment: .topLeading)
                    }
                }
            }
            //.navigationTitle("亞森羅蘋")
        }
        .fixedSize(horizontal: false, vertical: true)
        .listRowInsets(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
    }
}


struct Lower:View {
    var body: some View{
        ForEach(0..<4) { (i) in
            HStack(spacing:5) {
                ForEach(0..<2) { (j) in
                    Image(String(i)+String(j))
                        .resizable()
                        .scaledToFill()
                        .clipped()
                }
            }
            HStack(spacing:5) {
                ForEach(2..<5) { (j) in
                    Image(String(i)+String(j))
                        .resizable()
                        .scaledToFill()
                        .clipped()
                }
            }
        }.listRowInsets(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
    }
}
