//
//  SearchPage2.swift
//  hw2
//
//  Created by User03 on 2020/10/14.
//

import SwiftUI

struct SearchPage2: View {
    let letter:String
    var body: some View {
        let lisBgColor = Color(red: 1, green: 194/255, blue: 195/255)
        NavigationView{
            //生成 List 時搭配 id 或 Identifiable
            List {
                ForEach(profiles.indices){ item in
                    ForEach((profiles[item].tags),id:\.self){ tag in
                        if(tag==letter){
                            NavigationLink(destination: AnimatsPage2(id:item)){
                                AnimatedRow(id:item)
                                    .listRowBackground(lisBgColor)
                            }
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .toolbar(content:{//design navigation bar
                ToolbarItem(placement:.principal){
                    HStack{
                        Image(systemName: "book.fill")
                        Text("搜尋-"+letter)
                            .modifier(BarViewModifier(size: 20))
                    }.foregroundColor(.gray)
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchPage2_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage2(letter:"日本")
    }
}
