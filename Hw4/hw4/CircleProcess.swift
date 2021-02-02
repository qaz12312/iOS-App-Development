import SwiftUI

struct CircleProcess: View {
    @State private var trimEnd: CGFloat = 0
    let taskName:String
    let process:Double
    let backColor:Color
    let fontColor:Color
    var body: some View {
        ZStack{
            VStack{
                MyText(txt:String(format:"%.1f",self.process*100) + "%",color:Color.black,isTW:false,size:45)
                MyText(txt:self.taskName,color:Color.gray,isTW:true,size:20)
            }
            Circle()
                .strokeBorder(self.backColor, style: StrokeStyle(lineWidth: 20,lineCap: .round))
                .frame(width:220,height:220)
                .padding(5)
            Circle()
                .trim(from: 0, to: self.trimEnd)
                .stroke(self.fontColor, style: StrokeStyle(lineWidth: 21,lineCap: .round))
                .frame(width: 200, height: 200)
                .animation(.linear(duration: 0.8))
                .onAppear {
                    self.trimEnd = CGFloat(self.process)
                }
                .onDisappear{
                    self.trimEnd = 0
                }
        }
    }
}

struct CircleProcess_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Image("bg2").resizable().scaledToFill().edgesIgnoringSafeArea(.all)
            CircleProcess(taskName: "完成進度",process:0.5,backColor:Color(red: 179/255, green: 185/255, blue: 229/255),fontColor:Color(red: 163/255, green: 239/255, blue: 159/255))
            
        }
    }
}
