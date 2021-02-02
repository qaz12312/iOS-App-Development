//
//  ContentView.swift
//  Modiferimg
//
//  Created by User06 on 2021/1/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectPhoto:String = "KEVIN的膚色"
    let photos:[String] = ["STUART的衣服","STUART的膚色","KEVIN的衣服","KEVIN的膚色"]
    @State var isExpandedTheme:Bool = false
    @State var R:Double=252
    @State var G:Double=211
    @State var B:Double=209
    @State var alpha:Double=1// 透明度
    @State var alphaBg:Double=1// 背景透明度
    @State var linearLeftR:Double=0.3
    @State var linearLeftG:Double=1
    @State var linearLeftB:Double=1
    @State var linearRightR:Double=0.21
    @State var linearRightG:Double=0.61
    @State var linearRightB:Double=0.21
    @State var corner:CGFloat=0//圓角
    @State var borderWidth:CGFloat=10//邊框
    @State var borderR:Double=0//邊框
    @State var borderG:Double=0
    @State var borderB:Double=0
    @State var shadow:CGFloat=0//陰影
    @State var blurness:CGFloat=0 //blur 為 0，數字愈大愈模糊
    @State var brightness:Double=0 //範圍是 0~ 1，數字愈大高度愈亮
    @State var contract:Double=1 //調整顏色對比度
    @State var grayscale:Double=1 //範圍是 0~ 1，數字愈大灰階效果愈明顯
    @State var hueRotation:Double=0 //範圍是 0 ~ 360 度，色相旋轉
    @State var saturation:Double=1 //數字大於 1 時顏色的鮮豔度增加，數字小於 1 時顏色的鮮豔度降低，調整顏色飽和度(彩度)
    @State var scale:CGFloat=1//縮放
    @State var rotation:Double=0
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View {
        VStack{
            DisclosureGroup(
                isExpanded: $isExpandedTheme,
                content: {
                    Picker(selection: self.$selectPhoto, label: Text("選擇圖片")) {
                        ForEach(photos) { (item) in
                            Text(item)
                        }
                    }
                    .cornerRadius(5)
                    .pickerStyle(WheelPickerStyle())
                    .shadow(radius: 30)
                    .padding([.leading,.trailing],20)
                    .clipped()
                },
                label:{
                    Label(
                        title: { Text("我想換\(selectPhoto)~") },
                        icon: { Image(systemName: "paintbrush.pointed.fill") }
                    ).shadow(color:Color.white,radius: 10)
                    
                }
            ).padding(EdgeInsets(top: 50, leading: 12, bottom: 0, trailing: 14))
            Button(action: {
                R=Double.random(in:0...255)
                G=Double.random(in:0...255)
                B=Double.random(in:0...255)
                alphaBg=Double.random(in:0...1)
                alpha=Double.random(in:0...1)
                linearLeftR=Double.random(in:0...1)
                linearLeftG=Double.random(in:0...1)
                linearLeftB=Double.random(in:0...1)
                linearRightR=Double.random(in:0...1)
                linearRightG=Double.random(in:0...1)
                linearRightB=Double.random(in:0...1)
                corner=CGFloat(Double.random(in:0...100))
                borderWidth=CGFloat(Double.random(in:0...10))
                borderR=Double.random(in:0...255)
                borderG=Double.random(in:0...255)
                borderB=Double.random(in:0...255)
                shadow=CGFloat(Double.random(in:0...40))
                blurness=CGFloat(Double.random(in:0...15))
                brightness=Double.random(in:0...1)
                contract=Double.random(in:1...5)
                grayscale=Double.random(in:0...1)
                hueRotation=Double.random(in:0...360)
                saturation=Double.random(in:0...20)
                scale=CGFloat(Double.random(in:0...1))
            }, label: {
                Text("系統幫你配")
                    .shadow(color:Color.white,radius: 10)
            })
            ZStack{
                Rectangle()
                    .fill(Color(red:R/255, green:G/255, blue:B/255))
                    .frame(maxWidth: .infinity)
                    .frame(height:350)
                    .rotationEffect(.degrees(rotation))
                    .scaleEffect(scale)
                    .opacity(alphaBg)
                Image(selectPhoto)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
                    .cornerRadius(corner)
                    .clipped()
                    .opacity(alpha)
                    .overlay(RoundedRectangle(cornerRadius: corner).stroke(Color(red:borderR/255, green:borderG/255, blue:borderB/255), lineWidth: borderWidth))
                    .shadow(radius:shadow)
                    .blur(radius: blurness)
                    .brightness(brightness)
                    .contrast(contract)
                    .grayscale(grayscale)
                    .hueRotation(Angle(degrees: hueRotation))
                    .saturation(saturation)
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
            }
            Form{
                Group{
                    VStack{
                        Text("minion的背景")
                        HStack{
                            Text("RGB占比")
                            BarDouble(control:$R,txt:"紅",startNum:0,endNum:255,color:Color.red)
                            BarDouble(control:$G,txt:"綠",startNum:0,endNum:255,color:Color.green)
                            BarDouble(control:$B,txt:"藍",startNum:0,endNum:255,color:Color.blue)
                        }
                        BarDouble(control:$alphaBg,txt:"透明度",startNum:0,endNum:1,color:Color.gray)
                    }
                    VStack{
                        Text("背景－漸層")
                        HStack{
                            Text("左上RGB占比")
                            BarDouble(control:$linearLeftR,txt:"紅",startNum:0,endNum:1,color:Color.red)
                            BarDouble(control:$linearLeftG,txt:"綠",startNum:0,endNum:1,color:Color.green)
                            BarDouble(control:$linearLeftB,txt:"藍",startNum:0,endNum:1,color:Color.blue)
                        }
                        HStack{
                            Text("右下RGB占比")
                            BarDouble(control:$linearRightR,txt:"紅",startNum:0,endNum:1,color:Color.red)
                            BarDouble(control:$linearRightG,txt:"綠",startNum:0,endNum:1,color:Color.green)
                            BarDouble(control:$linearRightB,txt:"藍",startNum:0,endNum:1,color:Color.blue)
                        }
                    }
                    BarDouble(control:$alpha,txt:"photo透明度",startNum:0,endNum:1,color:Color.gray)
                    VStack{
                        Text("photo邊框")
                        HStack{
                            Text("RGB佔比")
                            BarDouble(control:$borderR,txt:"紅",startNum:0,endNum:255,color:Color.red)
                            BarDouble(control:$borderG,txt:"綠",startNum:0,endNum:255,color:Color.green)
                            BarDouble(control:$borderB,txt:"藍",startNum:0,endNum:255,color:Color.blue)
                        }
                        BarCGFloat(control:$borderWidth,txt:"粗細",startNum:0,endNum:10,color:Color.gray)
                        BarCGFloat(control:$corner,txt:"圓弧度",startNum:0,endNum:100,color:Color.purple)
                    }
                }
                Group{
                    BarCGFloat(control:$shadow,txt:"陰影",startNum:0,endNum:40,color:Color.yellow)
                    BarCGFloat(control:$blurness,txt:"模糊度",startNum:0,endNum:15,color:Color.purple)
                    BarDouble(control:$saturation,txt:"彩度",startNum:0,endNum:20,color:Color.yellow)
                    BarDouble(control:$brightness,txt:"亮度",startNum:0,endNum:1,color:Color.purple)
                    Group{
                        BarDouble(control:$contract,txt:"對比度",startNum:1,endNum:5,color:Color.yellow)
                        BarDouble(control:$grayscale,txt:"灰階效果",startNum:0,endNum:1,color:Color.purple)
                        BarDouble(control:$hueRotation,txt:"色相旋轉",startNum:0,endNum:360,color:Color.yellow)
                        BarDouble(control:$contract,txt:"飽和度",startNum:0,endNum:10,color:Color.purple)
                    }
                }
                BarCGFloat(control:$scale,txt:"大小",startNum:0,endNum:1,color:Color.yellow)
                BarDouble(control:$rotation,txt:"旋轉",startNum:0,endNum:360,color:Color.purple)
            }
        }.background(LinearGradient(gradient: Gradient(colors: [Color(red:linearLeftR,green:linearLeftG,blue:linearLeftB), Color(red:linearRightR,green:linearRightG,blue:linearRightB)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                    .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension String: Identifiable {
    public var id: String { self }
}
