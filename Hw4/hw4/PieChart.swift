import SwiftUI

struct PieChart: View {
    var arrCount:[Int]
    var arrName:[String]
    let colorSet:[Color]
    @State private var haveZero:Bool = false
    func calcu(_ arr:[Int],divisor:Double) -> [Double] {
        var arrAns = [Double](repeating: 0, count: arr.count)
        var total:Double = 0
        for i in 0 ..< arr.count{
            arrAns[i] = Double(arr[i])//copy
            total += arrAns[i]//calculate total
        }
        if divisor != 100 {
            for i in 1 ..< arrAns.count{//accumulator
                arrAns[i] += arrAns[i-1]
            }
        }
        for i in 0 ..< arrAns.count{// calculate
            arrAns[i] = arrAns[i] / total * divisor
        }
        return arrAns
    }
    func doubleToStr(_ number:Double) -> String{
        if number==100{
            return "100"
        }else{
            return String(format:"%.2f",number)
        }
    }
    var body: some View {
        let arrAng:[Double] = calcu(arrCount,divisor:360)
        let arr100:[Double] = calcu(arrCount,divisor:100)
        let total:Int = arrCount.count
        HStack{
            ZStack {
                PieView(angle: [0,arrAng[0]], color: colorSet[0])
                ForEach(0..<total-1){ idx in
                    PieView(angle: [arrAng[idx],arrAng[idx+1]], color: colorSet[idx+1])
                }
            }.frame(height:250)
            VStack(alignment:.leading){
                ForEach(0..<total){ idx in
                    if arr100[idx] > 0 {
                        HStack{
                            Rectangle()
                                .fill(colorSet[idx])
                                .frame(width: 10, height: 10)
                            MyText(txt:"\(arrName[idx]) - \(doubleToStr(arr100[idx]))%",color:Color.black,isTW:false,size:15)
                        }
                    }
                }
            }.padding(8)
        }.padding(8)
        
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Image("bg2").resizable().scaledToFill().edgesIgnoringSafeArea(.all)
            PieChart(arrCount:[20,20,20,20,20,20], arrName: ["0","1","2","3","4","5"],colorSet: [Color.red,Color.orange,Color.yellow,Color.green,Color.blue,Color.purple])
        }
    }
}

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX,
                        startAngle: self.startAngle, endAngle: self.endAngle, clockwise: false)
        }
    }
}

struct PieView:View{
    let angle:[Double]
    let color:Color
    var body: some View{
        Pie(startAngle: .degrees(self.angle[0]),
            endAngle: .degrees(self.angle[1]))
            .fill(self.color)
    }
}
