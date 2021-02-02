//
//  AppView.swift
//  hw4
//
//  Created by User03 on 2020/11/17.
//

import SwiftUI

struct AppView: View {
    @StateObject var codeData = CodeData()
    var body: some View {
        TabView {
            CodeList(codeData:self.codeData)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("列表")
                }
            ChartView(codeData:self.codeData)
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("圖表")
                }
        }.accentColor(.orange)// adjust the tabItem's color
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
