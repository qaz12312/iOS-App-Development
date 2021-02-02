//
//   Component.swift
//  hw4
//
//  Created by User03 on 2020/11/17.
//

import SwiftUI

struct MyLabel: View {
    let txt: String
    let txtSize: CGFloat
    let img: String
    let bigSize:CGFloat
    var body: some View {
        HStack {
            Image(systemName:img)
                .scaleEffect(bigSize)
            Text(txt)
                .modifier(TWViewModifier(size: txtSize))
        }
    }
}

struct MyText:View{
    let txt : String
    let color : Color
    let isTW : Bool
    let size : CGFloat
    var body: some View{
        if self.isTW == true{
            Text(self.txt)
                .foregroundColor(self.color)
                .modifier(TWViewModifier(size: self.size))
        }else{
            Text(self.txt)
                .foregroundColor(self.color)
                .modifier(ENViewModifier(size: self.size))
        }
    }
}
