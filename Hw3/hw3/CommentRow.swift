//
//  CommentRow.swift
//  class1028
//
//  Created by User14 on 2020/10/28.
//

import SwiftUI

struct CommentRow: View {
    let item: Comment
    var body: some View {
        VStack(alignment: .leading){
            MyLabel(txt:item.name,txtSize:CGFloat(25),img: "person.crop.circle.fill" ,bigSize:CGFloat(1.3))
                .padding([.leading, .bottom],10)
            VStack(alignment: .leading){
                HStack{
                    ForEach(0..<item.hearts){_ in
                        Image(systemName: "star.fill")
                    }.foregroundColor(.yellow)
                    ForEach(item.hearts..<5){_ in
                        Image(systemName: "star")
                    }.foregroundColor(.gray)
                }
                TextEditor(text: .constant(item.message))
                    .clipped()
                    .foregroundColor(Color.purple)
                    .modifier(TWViewModifier(size: 18))
            }.padding(.all).clipped().border(Color.gray, width:1)
        }
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        CommentRow(item:Comment(name: "Roy",hearts: 4,message: "還不錯～")).previewLayout(.sizeThatFits)
    }
}
