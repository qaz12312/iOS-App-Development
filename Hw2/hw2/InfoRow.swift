//
//  InfoRow.swift
//  hw2
//
//  Created by User03 on 2020/10/14.
//

import SwiftUI

struct InfoRow: View {
    let idx:Int
    var body: some View {
        let cartoon=infos[self.idx]
        NavigationLink(destination: InfoPage2(id:self.idx)) {//利用 NavigationLink 切換頁面
            Rectangle()
                .aspectRatio(1.33, contentMode: .fit)
                .overlay(
                    Image("\(self.idx)\(cartoon.key)info")
                        .resizable()
                        .scaledToFill()
                )
                .clipped()
                .cornerRadius(30)
                .shadow(color:Color.gray, radius: 15)
        }
    }
}

struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(idx:0)
    }
}
