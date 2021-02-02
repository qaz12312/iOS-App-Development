//
//  AppView.swift
//  hw2
//
//  Created by User03 on 2020/10/14.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            InfoView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("快報")
                }
            AnimationList()
                .tabItem {
                    Image(systemName: "rectangle.grid.1x2.fill")
                    Text("總覽")
                }
            PhotoView()
                .tabItem {
                    Image(systemName: "photo.fill")
                    Text("大雜燴")
                }
            ServiceView()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("more")
                }
            
            SettingView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("設定")
                }
        }.accentColor(.orange)//調整tab顏色
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
