//
//  Film.swift
//  hw3
//
//  Created by User03 on 2020/10/27.
//

import SwiftUI

struct Film: View {
    let img:String
    @State private var showComment = false
    
    var body: some View {
        Image(img)
            .resizable()
            .scaledToFit()
            .onTapGesture(perform: {
                showComment = true
            })
            .sheet(isPresented: $showComment, content: {
                CommentView(fileName:img,showPage:$showComment)
            })
    }
}

struct Film_Previews: PreviewProvider {
    static var previews: some View {
        Film(img:"小白的屁屁炸彈")
    }
}

struct CommentView: View {
    let fileName:String
    @Binding var showPage:Bool
    var body: some View {
        ZStack(alignment: .topTrailing){
            Button(action: {
                showPage = false
            }, label: {
                Image(systemName: "xmark.circle.fill").foregroundColor(.purple)
            }).buttonStyle(PlainButtonStyle())
            CommentList()
        }
    }
}


