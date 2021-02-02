//
//  ShowView.swift
//  hw3
//
//  Created by User03 on 2020/10/27.
//

import SwiftUI

struct ShowView: View {
    @State private var autoPlay: Bool = true
    @State private var picNum: CGFloat = 0
    let bgColor:Color
    @State private var showDPicker:Bool=false
    let today: Date = Date()
    var body: some View {
        VStack{
            Toggle("自動播放", isOn: $autoPlay)
                .modifier(TWViewModifier(size:20))
                .toggleStyle(SwitchToggleStyle(tint: bgColor))
                .onChange(of:autoPlay,perform:{ value in
                    if value {
                        showDPicker = false
                    }else{
                        showDPicker = true
                    }
                })
            Slider(value: $picNum, in: 0...CGFloat(movies.count-1))
                .accentColor(bgColor)
            if showDPicker{
                showDatePicker(picNum:$picNum,themeColor:bgColor)
            }
            showFilms(filmName:movies[Int(picNum)].name)
        }.padding([.leading,.trailing],10)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (_) in
                if autoPlay{
                    picNum = CGFloat((Int(picNum) + 1) % movies.count)
                }
            }
        }
    }
}

struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView(bgColor: .yellow)
    }
}

struct showFilms: View {
    var filmName: String
    var body: some View {
        VStack{
            Film(img:filmName)
                .shadow(
                    color: Color.white.opacity(0.9),
                    radius: 20,
                    x: -18,
                    y: -18)
                .shadow(
                    color: Color(red: 23/255, green: 21/255, blue: 22/255).opacity(0.5),
                    radius: 20,
                    x: 20,
                    y: 40)
                .border(Color.white, width: 5)
            Text(filmName)
                .modifier(TWViewModifier(size: 25))
        }
    }
}

struct showDatePicker: View {
    @Binding var picNum:CGFloat
    @State private var picYear = Date()
    let themeColor:Color
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }()
    var year: Int {
        Calendar.current.component(.year, from: picYear)
    }
    let today: Date = Date()

    var body: some View {
        DatePicker("選擇上映年份", selection: $picYear, in:dateFormatter.date(from: "1993")!...today, displayedComponents: .date)
            .modifier(TWViewModifier(size:20))
            .accentColor(themeColor)//調整選取日期的顏色
            .onAppear(perform: {
                picNum = CGFloat(year - 1993)
            })
            .onChange(of: year, perform: { value in
                picNum = CGFloat(year - 1993)
            })
            
    }
}


