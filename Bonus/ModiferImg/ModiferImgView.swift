import SwiftUI
struct ModiferImgView: View {
    let bgImg:String
    let img:String

    init(bgImg:String,img:String){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.bgImg = bgImg
        self.img = img
    }
    @State var R:Double
    @State var G:Double
    @State var B:Double
    @State var alpha:Double=1// 透明度

    @State var linearLeft:Double=1
    @State var linearRight:Double=0.21

    @State var concer:Double=0//圓角
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
            ZStack{
                Image(bgImg)
                    .backgroundColor(Color(red:R/255,green:G/255,blue:B/255))
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red:linearLeft,green:linearLeft,blue:linearLeft), Color(red:linearRight,green:linearRight,blue:linearRight)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                    .cornerRadius(concer)
                Image(img)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
                    .clipped()
                    .opacity(alpha)
                    .blur(radius: blurness)
                    .brightness(brightness)
                    .contrast(contract)
                    .grayscale(grayscale)
                    .hueRotation(Angle(degrees: hueRotation))
                    .saturation(saturation)
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
            }
            // 1~4 RGB 和 opacity
            VStack{
                HStack{
                    Text("RGB")
                    BarDouble(control:$R,txt:"紅",startNum:0,endNum:255,color:Color.red)
                    BarDouble(control:$G,txt:"綠",startNum:0,endNum:255,color:Color.green)
                    BarDouble(control:$B,txt:"藍",startNum:0,endNum:255,color:Color.blue)
                }
                BarDouble(control:$alpha,txt:"透明度",startNum:0,endNum:1,color:Color.gray)
            }
            // 5 漸層顏色
            VStack{
                BarDouble(control:$linearLeft,txt:"左上",startNum:0,endNum:1,color:Color.blue)
                BarDouble(control:$linearRight,txt:"右下",startNum:0,endNum:1,color:Color.blue)
            }
            // 6 圓角
            BarDouble(control:$concer,txt:"圓弧度",startNum:0,endNum:100,color:Color.purple)
            // 7 邊框的粗細。
            // 8 陰影。
            // 9. 模糊。
            // 10 亮度。
            // 11 色彩增值。
            // 12 對比。
            // 13 灰階。
            // 14 色相旋轉。
            // 15 飽和度。
            // 16 旋轉圖片
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
        }.background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}
struct ModiferImgView_Previews: PreviewProvider {
    static var previews: some View {
        ModiferImgView(bgImg:"bg",img:"minion")
    }
}
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