//
//  CustomSlider.swift
//  Modiferimg
//
//  Created by User06 on 2021/1/22.
//

import SwiftUI

struct BarDouble: View {
    @Binding var control:Double
    let txt:String
    let startNum:Double
    let endNum:Double
    let color:Color
    var body: some View{
        let txtColor=(color == Color.yellow ? Color(red: 26/255, green: 188/255, blue: 189/255) : Color(red: 225/255, green: 46/255, blue: 75/255))
        HStack{
            Text(txt).foregroundColor(txtColor)
            Slider(value: $control, in: startNum...endNum){
                Text("")
            }.accentColor(color)
        }
    }
}

struct BarCGFloat: View {
    @Binding var control:CGFloat
    let txt:String
    let startNum: CGFloat
    let endNum: CGFloat
    let color: Color
    var body: some View{
        let txtColor=(color == Color.yellow ? Color(red: 26/255, green: 188/255, blue: 189/255) : Color(red: 225/255, green: 46/255, blue: 75/255))
        HStack{
            Text(txt).foregroundColor(txtColor)
            Slider(value: $control, in: startNum...endNum){
                Text("")
            }.accentColor(color)
        }
    }
}
