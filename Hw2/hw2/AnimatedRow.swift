//
//  AnimatedRow.swift
//  hw2
//
//  Created by User03 on 2020/10/14.
//

import SwiftUI

struct AnimatedRow: View {
    let id:Int
    var choice:Int = 0
    var body: some View {
        let NameTxtColor = Color(red: 69/255, green: 69/255, blue: 31/255)
        let LogTxtColor = Color(red: 69/255, green: 69/255, blue: 31/255)
        let cartoon=cartoons[self.id]
        let log=logs[self.id]
        let option=["觀看\(log.watchs)次","熱度 \(log.hots)","\(log.likes) 個推薦","\(log.hearts) 個收藏"]
        HStack {
            Image(cartoon.name)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 80,alignment: .center)
                .clipped()
            ScrollView {
                VStack(alignment: .leading) {
                    Text(cartoon.name)
                        .foregroundColor(NameTxtColor)
                        .modifier(TWViewModifier(size: 21))
                    //讓 SwiftUI List 的 row 有多個可點選的 NavigationLink
                    VStack(alignment: .leading) {
                        NavigationLink(destination: SearchPage2(letter:cartoon.author)){
                            Text(cartoon.author)
                        }
                        NavigationLink(destination: SearchPage2(letter:cartoon.source)){
                            Text(cartoon.source)
                        }
                    }.modifier(TWViewModifier(size: 15))
                }
            }.fixedSize(horizontal: false, vertical: true)
            Spacer()
            //目前有多少人點愛心
            Text(option[choice])
                .foregroundColor(LogTxtColor)
                .modifier(TWViewModifier(size: 14))
        }
    }
}

struct AnimatedRow_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedRow(id:0,choice:1).previewLayout(.sizeThatFits)
    }
}

