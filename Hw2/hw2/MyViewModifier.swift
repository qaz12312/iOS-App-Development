//
//  ViewModifier.swift
//  hw2
//
//  Created by User05 on 2020/10/20.
//

import SwiftUI
//簡化大量 modifier 程式的 SwiftUI ViewModifier
struct MyViewModifier: View {
    var body: some View {
        Text("1 + 1 = 2 ya!")
            .modifier(BarViewModifier(size: 50))
    }
}

struct MyViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        MyViewModifier()
    }
}


struct BarViewModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: .bold, design: .rounded))
    }
}

struct ENViewModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom("HFVoyager-2",size:size))
    }
}


struct TWViewModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom("jf-openhuninn-1.1",size:size))
    }
}
