//
//  RecommView.swift
//  hw3
//
//  Created by User03 on 2020/10/27.
//

import SwiftUI

struct RecommView: View {
    @State private var whichMovie = 0
    let bgColor:Color
    var body: some View {
        VStack {
            Button(action: {
                whichMovie = Int.random(in: 0..<movies.count)
            }){
                Text("今天來看哪部電影？").bold()
            }.buttonStyle(LinearButtonStyle())
            Divider()
            Film(img:movies[whichMovie].name)
                .frame(width:350)
                .cornerRadius(10)
                .shadow(
                    color: Color.white.opacity(0.9),
                    radius: 10,
                    x: -18,
                    y: -18)
                .shadow(
                    color: Color(red: 23/255, green: 21/255, blue: 22/255).opacity(0.5),
                    radius: 10,
                    x: 14,
                    y: 14)
            Text(movies[whichMovie].time+"上映的")
                .modifier(TWViewModifier(size: 28))
            Text(movies[whichMovie].name+"!!")
                .modifier(TWViewModifier(size: 30))
        }
    }
}

//struct RecommView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommView()
//    }
//}

