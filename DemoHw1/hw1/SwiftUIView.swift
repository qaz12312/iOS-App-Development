//
//  SwiftUIView.swift
//  hw1
//
//  Created by User19 on 2020/10/5.
//
import SwiftUI

struct ContentView: View {
    let MinionsColor:[Double]=[255,239,1]
    var body: some View {
        ZStack{
            /*Image("background")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)*/
            Group{
                // body
                MinionsBody()
                    .stroke(style: StrokeStyle(lineWidth:8, lineJoin: .round))
                MinionsBody()
                    .fill(Color(red: MinionsColor[0]/255, green: MinionsColor[1]/255, blue: MinionsColor[2]/255))
                // hair
                Path{ (path) in
                    //left
                    path.addArc(center:CGPoint(x:68,y:30),radius:20,startAngle:.degrees(180),endAngle:.degrees(330),clockwise:false)
                    //right
                    path.addArc(center:CGPoint(x:100,y:30),radius:20,startAngle:.degrees(210),endAngle:.degrees(352),clockwise:false)
                }.stroke(style: StrokeStyle(lineWidth:3, lineJoin: .round))
                Group{
                    //mouth
                    MinionsMouth().stroke(style: StrokeStyle(lineWidth:8, lineJoin: .round))
                    MinionsMouth().fill(Color.white)
                    Path{ (path) in
                        path.move(to: CGPoint(x: 63, y: 115))// 左上角start
                        path.addQuadCurve(to: CGPoint(x:119,y:113), control: CGPoint(x:91,y:130))
                    }.fill()
                }
                
                // hands
                MinionsArm().stroke(style: StrokeStyle(lineWidth:8, lineJoin: .round))
                MinionsArm()
                    .fill(Color(red: MinionsColor[0]/255, green: MinionsColor[1]/255, blue: MinionsColor[2]/255))
                MinionsHPalm().fill(Color(red: 51/255, green: 1/255, blue: 1/255))
//                // left手環
//                Path(roundedRect :CGRect(x:223,y:37,width:20,height: 10), cornerRadius: 3)
//                    .fill(Color.black).rotationEffect(.degrees(-70))
//                // right手環
//                Path(roundedRect :CGRect(x:302,y:265,width:20,height: 10), cornerRadius: 3)
//                    .fill(Color.black).rotationEffect(.degrees(-70))
            }
            // legs
            MinionsLeg().stroke(style: StrokeStyle(lineWidth:4, lineJoin: .round))
            MinionsLeg().fill(Color(red: 51/255, green: 1/255, blue: 1/255))
            // glasses
            MinionsGlassesView()
            // clothes
            MinionsClothesView()
            // text
            Text("Minions")
                .foregroundColor(Color.orange)
        }.offset(x:70,y:100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MinionsBody:Shape{
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            path.move(to: CGPoint(x: 28, y: 72))// 左上角start
            path.addArc(center:CGPoint(x:86,y:80),radius:59,startAngle:.degrees(200),endAngle:.degrees(340),clockwise:false)// head
            path.addLine(to: CGPoint(x:145,y:72))// |
            path.addLine(to: CGPoint(x:145,y:160))// -
            path.addLine(to: CGPoint(x:28,y:160))// |
            path.addLine(to: CGPoint(x:28,y:72))// 連回原點
        }
    }
}
struct MinionsMouth:Shape{
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            path.move(to: CGPoint(x: 63, y: 110))// 左上角start
            path.addQuadCurve(to: CGPoint(x:119,y:108), control: CGPoint(x:90,y:115))
            path.addCurve(to: CGPoint(x:63,y:110), control1: CGPoint(x:120,y:125),control2:CGPoint(x:60,y:125))
            path.closeSubpath()
        }
    }
}
struct MinionsArm:Shape{
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            //left
            path.move(to: CGPoint(x: 25, y: 123))
            path.addQuadCurve(to: CGPoint(x:-30,y:123), control: CGPoint(x:-3,y:133))
            path.addLine(to: CGPoint(x:-35,y:128))
            path.addQuadCurve(to: CGPoint(x:25,y:130), control: CGPoint(x:-6,y:140))
            //right
            path.move(to: CGPoint(x: 148, y: 126))
            path.addQuadCurve(to: CGPoint(x:215,y:125), control: CGPoint(x:181,y:113))
            path.addLine(to: CGPoint(x:212,y:130))
            path.addQuadCurve(to: CGPoint(x:148,y:133), control: CGPoint(x:184,y:120))
            
        }
    }
}
struct MinionsHPalm:Shape{
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            //left手掌
            path.move(to: CGPoint(x: -29, y: 119))// 右上角
            path.addLine(to: CGPoint(x:-40,y:113))// \
            path.addArc(center:CGPoint(x:-46,y:122),radius:10,startAngle:.degrees(290),endAngle:.degrees(150),clockwise:true)// (
            path.addArc(center:CGPoint(x:-43,y:133),radius:5,startAngle:.degrees(210),endAngle:.degrees(70),clockwise:true)
            path.addLine(to: CGPoint(x:-40,y:135))
            //right手掌
            path.move(to:CGPoint(x:216,y:121))// 左上角
            path.addLine(to: CGPoint(x:232,y:127))// \
            path.addArc(center:CGPoint(x:223,y:133),radius:10,startAngle:.degrees(310),endAngle:.degrees(80),clockwise:false)// )
//            path.addLine(to: CGPoint(x:210,y:140))// \
            path.addArc(center:CGPoint(x:213,y:141),radius:5,startAngle:.degrees(20),endAngle:.degrees(210),clockwise:false)
            
        }
    }
}
struct MinionsLeg:Shape{
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            //left
            path.move(to: CGPoint(x: 59, y: 207))
            path.addQuadCurve(to: CGPoint(x:49,y:215), control: CGPoint(x:53,y:209))
            path.addQuadCurve(to: CGPoint(x:57,y:230), control: CGPoint(x:47,y:230))
            path.addQuadCurve(to: CGPoint(x:81,y:223), control: CGPoint(x:69,y:233))
            path.addLine(to: CGPoint(x:87,y:207))
            path.addQuadCurve(to: CGPoint(x:59,y:205), control: CGPoint(x:75,y:210))
            path.closeSubpath()
            //right
            path.move(to: CGPoint(x: 89, y: 207))
            path.addLine(to: CGPoint(x:95,y:223))
            path.addQuadCurve(to: CGPoint(x:119,y:230), control: CGPoint(x:107,y:233))
            path.addQuadCurve(to: CGPoint(x:127,y:215), control: CGPoint(x:133,y:220))
            path.addQuadCurve(to: CGPoint(x:115,y:207), control: CGPoint(x:120,y:209))
            path.addQuadCurve(to: CGPoint(x:88,y:205), control: CGPoint(x:95,y:210))
        }
    }
}





struct MinionsGlassesView: View {
    var body: some View {
        ZStack{
            Path(roundedRect :CGRect(x:21,y:69,width:130,height: 20), cornerRadius: 5)
                .fill(Color.black)
            Group{
                Path(ellipseIn: CGRect(x: 40, y: 50, width: 55, height: 55))
                    .fill(Color.black)
                Path(ellipseIn: CGRect(x: 80, y: 50, width: 55, height: 55))
                    .fill(Color.black)
                //鏡框
                Path(ellipseIn: CGRect(x: 45, y: 55, width: 45, height: 45))
                    .fill(Color.gray)
                Path(ellipseIn: CGRect(x: 85, y: 55, width: 45, height: 45))
                    .fill(Color.gray)
                //眼框
                Path(ellipseIn: CGRect(x: 50, y: 60, width: 35, height: 35))
                    .fill(Color.black)
                Path(ellipseIn: CGRect(x: 90, y: 60, width: 35, height: 35))
                    .fill(Color.black)
                //眼白
                Path(ellipseIn: CGRect(x: 55, y: 65, width: 25, height: 25))
                    .fill(Color.white)
                Path(ellipseIn: CGRect(x: 95, y: 65, width: 25, height: 25))
                    .fill(Color.white)
                //眼珠
                Path(ellipseIn: CGRect(x: 63, y: 72, width: 10, height: 10))
                    .fill(Color.black)
                Path(ellipseIn: CGRect(x: 103, y: 72, width: 10, height: 10))
                    .fill(Color.black)
            }
        }
    }
}


struct MinionsClothesView: View {
    var body: some View {
        ZStack{
            Group(){
                // 主要布料
                MinionsCloth1().stroke(lineWidth:8)
                MinionsCloth1().fill(Color(red: 8/255, green: 109/255, blue: 187/255))
                Path{(path)in
                    path.move(to: CGPoint(x: 87, y: 207))
                    path.addLine(to: CGPoint(x:87,y:195))
                }.stroke(lineWidth: 8) // |褲長
                Path(roundedRect :CGRect(x:74,y:195,width:26,height: 4), cornerRadius: 8)
                    .fill(Color.black)// -鼠蹊部
            }
            Group(){
                //肩帶
                MinionsBaldric().stroke(style: StrokeStyle(lineWidth:8, lineJoin: .round))
                MinionsBaldric().fill(Color(red: 8/255, green: 109/255, blue: 187/255))
                //left_button
                Group{
                    Path(ellipseIn: CGRect(x: 48, y: 125, width: 10, height: 10))
                        .fill(Color.black)
                    Path(ellipseIn: CGRect(x: 52, y: 127, width: 2, height: 2))
                        .fill(Color.blue)
                    Path(ellipseIn: CGRect(x: 50, y: 129, width: 2, height: 2))
                        .fill(Color.blue)
                    Path(ellipseIn: CGRect(x: 54, y: 129, width: 2, height: 2))
                        .fill(Color.blue)
                    Path(ellipseIn: CGRect(x: 52, y: 131, width: 2, height: 2))
                        .fill(Color.blue)
                }
                //right_button
                Group{
                    Path(ellipseIn: CGRect(x: 116, y: 125, width: 10, height: 10))
                        .fill(Color.black)
                    Path(ellipseIn: CGRect(x: 117, y: 128, width: 2, height: 2))
                        .fill(Color.blue)
                    Path(ellipseIn: CGRect(x: 119, y: 131, width: 2, height: 2))
                        .fill(Color.blue)
                    Path(ellipseIn: CGRect(x: 120, y: 127, width: 2, height: 2))
                        .fill(Color.blue)
                    Path(ellipseIn: CGRect(x: 122, y: 130, width: 2, height: 2))
                        .fill(Color.blue)
                }
            }
            //口袋
            MinionsPocket().stroke(lineWidth:8)
            MinionsPocket().fill(Color(red: 8/255, green: 109/255, blue: 187/255))
        }
    }
}

struct MinionsCloth1:Shape{
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            path.move(to: CGPoint(x: 48, y: 130))// 左上角start
            path.addLine(to: CGPoint(x:125,y:130))// -
            path.addLine(to: CGPoint(x:125,y:165))// |
            path.addLine(to: CGPoint(x:150,y:165))// -
            path.addArc(center:CGPoint(x:116,y:165),radius:30,startAngle:.degrees(0),endAngle:.degrees(90),clockwise:false)// 」
            path.addLine(to: CGPoint(x:115,y:205))// |
            path.addQuadCurve(to: CGPoint(x:88,y:205), control: CGPoint(x:95,y:210))// right褲管
            path.addQuadCurve(to: CGPoint(x:59,y:205), control: CGPoint(x:75,y:210))// left褲管
            path.addArc(center:CGPoint(x:57,y:165),radius:30,startAngle:.degrees(90),endAngle:.degrees(180),clockwise:false)// L
            path.addLine(to: CGPoint(x:48,y:165))// -
            path.addLine(to: CGPoint(x:48,y:130))// |
            path.closeSubpath()
        }
    }
}

struct MinionsBaldric:Shape{
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            // left肩帶
            path.move(to: CGPoint(x: 25, y: 110))// 左上角start
            path.addLine(to: CGPoint(x:60,y:130))// \
            path.addLine(to: CGPoint(x:55,y:137))// /
            path.addLine(to: CGPoint(x:25,y:120))// \
            path.addLine(to: CGPoint(x:25,y:110))// |
            path.closeSubpath()
            // right肩帶
            path.move(to: CGPoint(x: 148, y: 110))// 右上角start
            path.addLine(to: CGPoint(x:114,y:130))// /
            path.addLine(to: CGPoint(x:119,y:137))// \
            path.addLine(to: CGPoint(x:148,y:120))// /
            path.addLine(to: CGPoint(x:148,y:110))// |
            path.closeSubpath()
        }
    }
}

struct MinionsPocket:Shape{
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            path.move(to:CGPoint(x:69,y:145))// 左上角start
            path.addLine(to: CGPoint(x:105,y:145))// -
            path.addLine(to: CGPoint(x:105,y:159))// |
            path.addArc(center:CGPoint(x:95,y:157),radius:10,startAngle:.degrees(30),endAngle:.degrees(90),clockwise:false)// 」
            path.addArc(center:CGPoint(x:79,y:157),radius:10,startAngle:.degrees(90),endAngle:.degrees(150),clockwise:false)// L
            path.addLine(to: CGPoint(x:69,y:159))// |
            path.addLine(to: CGPoint(x:69,y:145))// 接回原點
            path.closeSubpath()
        }
    }
}
