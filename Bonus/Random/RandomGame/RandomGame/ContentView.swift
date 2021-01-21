//
//  ContentView.swift
//  RandomGame
//
//  Created by User06 on 2021/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var gameKinds=["屁屁偵探-記憶翻翻樂", "駱駝大賽", "抓月亮", "妙語偵探社", "黃牌", "矮人礦坑", "BANG！","誰是牛頭王","傳情畫意","犯人在跳舞","說書人"]
    @State private var selectGame=""
    @State var showInfoSheet:Bool = false
    func find(value searchValue: String, in array: [Game]) -> Int?
    {
        for (index, value) in array.enumerated()
        {
            if value.name == searchValue {
                return index
            }
        }
        return nil
    }
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Button(action: {
                    selectGame = gameKinds.randomElement()!
                },label: {
                    HStack{
                        Image(systemName:"gamecontroller.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width:50)
                        Text("play..?")
                            .fontWeight(.bold)
                            .font(.title)
                    }
                })
                
                if selectGame != "" {
                    Button(action: {
                        showInfoSheet = true
                    }, label: {
                        VStack{
                            Image("\(selectGame)")
                                .resizable()
                                .scaledToFill()
                                .frame(width:350, height:350)
                                .clipped()
                            Text("點圖片查看相關資訊 GO!")
                        }
                    })
                    .fullScreenCover(isPresented: $showInfoSheet){
                        InfoView(showInfo:$showInfoSheet,info:games[find(value: selectGame, in: games) ?? 0])
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
