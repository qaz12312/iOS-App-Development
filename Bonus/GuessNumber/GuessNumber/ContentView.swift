//
//  ContentView.swift
//  GuessNumber
//
//  Created by User06 on 2021/1/22.
//

import SwiftUI

struct ContentView: View {
    @State private var bits:Int = 4 // step(1~10)
    @State private var time:Int = 10 // step(5~100)
    @State var isExpandedSetting:Bool = true
    @State var isShowSetting:Bool = false
    @State private var guess:String="guess a number"
    @State var isShowResult:Bool = false
    @State var isShowRecord:Bool = false
    @State var isShowAns:Bool = false
    var game: ABGame = ABGame()
    var recordData = RecordData()
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View {
        VStack{
            HStack(spacing:50){
                DisclosureGroup(
                    isExpanded: $isExpandedSetting,
                    content: {
                        Text("挑戰幾A幾B!")
                        Stepper("選擇 \(bits) 位數", value: $bits, in: 3 ... 10)
                        Stepper("挑戰猜 \(time) 次", value: $time, in: 5 ... 100)
                        Button(action: {
                            game.setAttr(bits: self.bits, time: self.time)
                            recordData.record.removeAll()
                            isShowRecord = false
                            isShowSetting = true
                        }, label: {
                            Image(systemName: "chevron.down.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height:30)
                                .foregroundColor(Color.blue)
                        }).alert(isPresented: $isShowSetting, content: {
                            return Alert(title: Text("game setting"),message: Text("\(bits)位數字＋\(time)次機會"))
                        })
                    },
                    label:{
                        Label(
                            title: { Text("遊戲設定") },
                            icon: { Image(systemName: "gamecontroller.fill") }
                        )
                        
                    }
                ).padding()
                .background(Color.white.opacity(0.9)).cornerRadius(10)
                
            }
            HStack{
                Label(
                    title: { Text("還剩下\(game.time)次機會") },
                    icon: { Image(systemName: "flame.fill") }
                )
                Spacer()
                Button(action: {
                    isShowAns = true
                }, label: {
                    Text("直接看答案")
                }).alert(isPresented: $isShowAns, content: {
                    return Alert(title: Text("answer: "+game.getAns()))
                })
            }.padding()
            .background(Color.white.opacity(0.9)).cornerRadius(10)
            HStack{
                Label(
                    title: { Text("guess: ") },
                    icon: { Image(systemName: "questionmark.circle")}
                )
                TextField("topic", text: $guess)
                Button(action: {
                    isShowResult = true
                    isShowRecord = true
                }, label: {
                    Text("Guess")
                        .font(.title)
                        .padding(5)
                        .foregroundColor(Color.purple)
                }).alert(isPresented: $isShowResult, content: {
                    var rst:String
                    if guess.digits.count != self.bits{
                        rst = "WRONG input!Please Check"
                    }else{
                        
                        rst = game.play(guess: guess.digits)
                        recordData.record.insert(Record(guess: guess, result: rst), at: 0)
                    }
                    return Alert(title: Text(rst))
                })
            }.padding()
            .background(Color.white.opacity(0.9)).cornerRadius(10)
            if isShowRecord{
                RecordView(recordData: recordData)
            }
        }.background(Image("bg")
                        .resizable()
                        .scaledToFill().edgesIgnoringSafeArea(.all))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct RecordView:View {
    @ObservedObject var recordData = RecordData()
    var body: some View {
        List{
            ForEach(recordData.record){ item in
                HStack{
                    Text("\(item.guess)")
                    Spacer()
                    Text("\(item.result)")
                }.background(Color.white.opacity(0.9)).cornerRadius(10)
            }
        }
    }
}
