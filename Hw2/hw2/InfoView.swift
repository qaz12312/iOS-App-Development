//
//  ContentView.swift
//  hw2
//
//  Created by User03 on 2020/10/14.
//

import SwiftUI

struct InfoView: View {
    init(){
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().backgroundColor = .clear
        }
    let bgColor = Color(red: 252/255, green: 211/255, blue: 209/255)
    let barImgColor = Color(red: 1, green: 204/255, blue: 1)
    let barTxtColor = Color(red: 254/255, green: 146/255, blue: 159/255)
    var body: some View {
        NavigationView{// 用 NavigationView 包住它管理的第一頁畫面
            List {
                ForEach(infos.indices){(idx) in
                    InfoRow(idx:idx).listRowBackground(bgColor)
                }
            }.background(bgColor)
            .edgesIgnoringSafeArea(.all)
            .toolbar(content:{//design navigation bar
                ToolbarItem(placement:.principal){
                    HStack{
                        Image(systemName: "book.fill").scaleEffect(1.6)
                            .foregroundColor(barImgColor)
                        Text(" Information")
                            .foregroundColor(barTxtColor)
                            .modifier(BarViewModifier(size: 30))
                    }
                }
            })
            .navigationBarTitleDisplayMode(.inline)//利用 inline 縮短 navigation bar 的高度
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}


