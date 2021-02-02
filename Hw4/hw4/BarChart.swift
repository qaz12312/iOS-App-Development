import SwiftUI

struct BarChart: View {
    let val: [Double]//0~10
    let key: [String]
    let backColor:Color
    let fontColor:Color
    var txtColor:Color?
    var txtcolor:Color{
        if let txtColor = self.txtColor{
            return txtColor
        } else {
            return Color.black
        }
    }
    var body: some View
    {
        
        VStack(alignment: .leading){
            ForEach(self.val.indices){ idx in
                Bar(val: self.val[idx], info: self.key[idx],color:backColor,txtcolor:self.txtcolor)
                    .foregroundColor(fontColor)
            }
        }
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Image("bg2").resizable().scaledToFill().edgesIgnoringSafeArea(.all)
        BarChart(val: [3, 2, 0, 3, 1, 1, 0, 1],key:LanguageOpts,backColor:Color(red:209/255,green:244/255,blue:250/255),fontColor:Color(red:1,green:205/255,blue:205/255),txtColor: Color(red:0,green:87/255,blue:146/255))
        }
    }
}


struct Bar: View
{
    @State private var height: CGFloat = 0 //0~10
    let val: Double
    let info: String
    let color:Color
    let txtcolor:Color
    var body: some View
    {
        ZStack(alignment: .leading){
            Capsule()
                .frame(width: 320, height: 20)
                .foregroundColor(color)
            HStack{
                Capsule()
                    .frame(width: height*300, height: 20)
                MyText(txt:info,color:txtcolor,isTW:false,size:15)
                    .shadow(color:Color.gray, radius: 15)
            }
            .animation(.linear(duration:  1.1))
            .onAppear
            {
                self.height = CGFloat(self.val)
            }
            .onDisappear{
                self.height = 0
            }
        }
    }
}
