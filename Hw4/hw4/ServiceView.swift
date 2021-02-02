//
//  ServiceView.swift
//  hw4
//
//  Created by User03 on 2020/11/17.
//

import SwiftUI

struct ServiceView: View {
    @State private var fontSize: CGFloat = 52
    init(){
                UITableView.appearance().backgroundColor = .clear
                UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack{
            Image("bg8").resizable().scaledToFill()
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                //跳出輸入框
            }){
                Text("| 發表問題 |")
                    .modifier(AnimatableCustomFontModifier(size: fontSize))
                     .onAppear() {
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                        self.fontSize = 55
                    }
                }
            }
        }
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView()
    }
}
