import SwiftUI

struct ContentView: View {
    @State private var breakfast=["吐司", "厚片", "蛋餅", "漢堡", "鐵板麵", "蘿蔔糕"]
    @State private var lunch=[]
    @State private var dinner=[]
    @State private var drink=["奶茶", "咖啡", "紅茶", "綠茶"]
    @State private var mybreakfast=""
    @State private var mydrink=""
    var body: some View {
        VStack{
            Button(action: {
                mybreakfast=breakfast.randomElement()!
                mydrink=drink.randomElement()!
            }, label: {
                Text("肚子餓")
                    .padding(5)
                    .foregroundColor(Color(red:178/255, green:150/255, blue:125/255))
                    .background(Color.white)
                    .cornerRadius(3.0)
            })
            Text("今天吃\(mybreakfast)配\(mydrink)")
            VStack{
                Image("\(mybreakfast)")
                    .resizable()
                    .scaledToFill()
                    .frame(width:200, height:200)
                    .clipped()
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color(red:178/255, green:150/255, blue:125/255))
                Image("\(mydrink)")
                    .resizable()
                    .scaledToFill()
                    .frame(width:200, height:200)
                    .clipped()
            }
            .onAppear{
                mybreakfast=breakfast.randomElement()!
                mydrink=drink.randomElement()!
            }
        }
        .frame(width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
        .background(Color(red:231/255, green:216/255, blue:201/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}