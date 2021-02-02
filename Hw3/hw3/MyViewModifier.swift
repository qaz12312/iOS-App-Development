//
//  MyViewModifier.swift
//  hw3
//
//  Created by User03 on 2020/10/27.
//

import SwiftUI

struct MyViewModifier: View {
    @State private var fontSize: CGFloat = 32
    var body: some View {
        VStack{
            Text("你好呀")
                .modifier(AnimatableCustomFontModifier(size: fontSize))
                .onTapGesture {
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1)) {
                        self.fontSize = 60
                    }
                }
            Text("嗨！２０")
                .modifier(TWViewModifier(size: 50))
            Text("Apple")
                .modifier(ENViewModifier(size: 50))
            
            Text("Bad~")
                .modifier(AnimatableSystemFontModifier(size: fontSize))
                .onAppear() {
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                        self.fontSize = 55
                    }
                }
        }
    }
}

struct MyViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        MyViewModifier()
    }
}


struct ENViewModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: .bold, design: .rounded))
    }
}
// animate the size of text
struct AnimatableSystemFontModifier: AnimatableModifier {
    var size: CGFloat
    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: .bold, design: .rounded))
    }
}


struct TWViewModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom("jf-openhuninn-1.1",size:size))
    }
}
// animate the size of text
struct AnimatableCustomFontModifier: AnimatableModifier {
    var size: CGFloat
    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }
    func body(content: Content) -> some View {
        content
            .font(.custom("jf-openhuninn-1.1", size: size))
    }
}


