//
//  CodeRow.swift
//  hw4
//
//  Created by User03 on 2020/11/17.
//

import SwiftUI

struct CodeRow: View {
    var code: Code
    let TitleColor = Color(red: 69/255, green: 69/255, blue: 31/255)
    var body: some View {
        HStack {
            ShowImg(num:code.hard,isknown:code.isKnown)
                .frame(height: 50,alignment: .center)
                .clipped()
                VStack(alignment: .leading) {
                     MyText(txt:code.title,color:TitleColor,isTW:false,size:20)
                     MyText(txt:code.algorithm,color:Color.gray,isTW:false,size:15)
                }
            Spacer()
             MyText(txt:code.language,color:Color.blue,isTW:false,size:15)
        }
    }
}

struct CodeRow_Previews: PreviewProvider {
    static var previews: some View {
        CodeRow(code: Code(id:UUID(),title: "MAGO",language: "C++",hard:3,isKnown: true,algorithm:"binary tree",question:"",context:"")).previewLayout(.sizeThatFits)
    }
}

struct ShowImg:View{
    let num:Int
    let isknown:Bool
    var body: some View{
        Image(systemName: "die.face.\(num).fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(isknown == true ? Color.gray : Color.red)
            .padding(7)
    }
}



