//
//  ModiferImgView.swift
//  hw2
//
//  Created by 林湘羚 on 2020/10/19.
//

import SwiftUI
// 生動有趣的圖片效果 modifier

struct ModiferImgView: View {
    let img:String
    init(img:String){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.img = img
    }
    @State var blurness:CGFloat=0 //blur 為 0，數字愈大愈模糊
    @State var brightness:Double=0 //範圍是 0~ 1，數字愈大高度愈亮
    @State var contract:Double=1 //調整顏色對比度
    @State var grayscale:Double=1 //範圍是 0~ 1，數字愈大灰階效果愈明顯
    @State var hueRotation:Double=0 //範圍是 0 ~ 360 度，色相旋轉
    @State var saturation:Double=1 //數字大於 1 時顏色的鮮豔度增加，數字小於 1 時顏色的鮮豔度降低，調整顏色飽和度(彩度)
    @State var scale:CGFloat=1//縮放
    @State var rotation:Double=0
    var body: some View {
        Form{
            Image(img)
                .resizable()
                .scaledToFit()
                .frame(height: 350)
                .clipped()
                .blur(radius: blurness)
                .brightness(brightness)
                .contrast(contract)
                .grayscale(grayscale)
                .hueRotation(Angle(degrees: hueRotation))
                .saturation(saturation)
                .scaleEffect(scale)
                .rotationEffect(.degrees(rotation))
            BarCGFloat(control:$blurness,txt:"模糊度",startNum:0,endNum:15,color:Color.yellow)
            BarDouble(control:$brightness,txt:"亮度",startNum:0,endNum:1,color:Color.purple)
            Group{
                BarDouble(control:$contract,txt:"對比度",startNum:1,endNum:5,color:Color.yellow)
                BarDouble(control:$contract,txt:"灰階效果",startNum:0,endNum:5,color:Color.purple)
                BarDouble(control:$hueRotation,txt:"色相旋轉",startNum:0,endNum:360,color:Color.yellow)
                BarDouble(control:$contract,txt:"飽和度",startNum:0,endNum:10,color:Color.purple)
            }
            BarCGFloat(control:$scale,txt:"縮放大小",startNum:0,endNum:1,color:Color.yellow)
            BarDouble(control:$rotation,txt:"旋轉",startNum:0,endNum:360,color:Color.purple)
        }.background(Color.black).edgesIgnoringSafeArea(.all)
        .toolbar(content:{//design navigation bar
            ToolbarItem(placement:.principal){
                HStack{
                    Image(systemName: "photo")
                    Text("喜歡什麼圖，自己調~").modifier(BarViewModifier(size: 20))
                }.foregroundColor(.purple)
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}
struct ModiferImgView_Previews: PreviewProvider {
    static var previews: some View {
        ModiferImgView(img:animateds[0])
    }
}
struct BarDouble: View {
    @Binding var control:Double//是參考別人
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
    @Binding var control:CGFloat//是參考別人
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
