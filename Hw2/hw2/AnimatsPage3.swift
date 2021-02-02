//
//  AnimatsPage3.swift
//  hw2
//
//  Created by 林湘羚 on 2020/10/19.
//

import SwiftUI

struct AnimatsPage3: View {
    let character:Role
    @State private var isShow = false
    var body: some View {
        //使用到酷炫動畫
        ZStack{
            Color.yellow.edgesIgnoringSafeArea(.all)
            VStack(spacing:20){
                Spacer()
                if(isShow){
                    Image(self.character.name)
                        .resizable()
                        .scaledToFit()
                        //Neumorphic Design
                        .shadow(
                          color: Color(white: 1.0).opacity(0.9),
                          radius: 18,
                          x: -18,
                          y: -18)
                        .shadow(
                          color: Color(red: 23/255, green: 21/255, blue: 22/255).opacity(0.5),
                          radius: 14,
                          x: 14,
                          y: 14)
                        .padding(40)
                    introView(character:self.character)
                        .transition(.slide)
                }
                Spacer()
            }.animation(.easeInOut(duration:2))//easeInOut:動畫速度一開始慢，然後愈來愈快，最後再愈來愈慢，指定動畫的時間為 2 秒鐘
            .onAppear {//在 onAppear 裡觸發動畫，讓動畫在畫面出現時自動開始表演
                self.isShow = true
            }
            .onDisappear {
                self.isShow = false
            }
            .edgesIgnoringSafeArea(.all)
            .toolbar(content:{//design navigation bar
                ToolbarItem(placement:.principal){
                    HStack{
                        Image(systemName: "book.fill")
                        Text(character.name)
                            .modifier(BarViewModifier(size: 20))
                    }.foregroundColor(.gray)
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
struct AnimatsPage3_Previews: PreviewProvider {
    static var previews: some View {
        AnimatsPage3(character:Role(relation:"小新的媽媽", name: "野原美冴", info:"熊本縣阿蘇市出身，本姓小山，是家中排行老二，全職的家庭主婦。結婚前是個上班族自稱24歲個性大而化之且性急暴力且愛慕虛榮，喜歡買名貴的珠寶首飾、衣裝與化妝用品以及高級沐浴乳還有減肥食品，而給廣志與小新則買便宜貨酒量奇差，光是喝啤酒就會發酒瘋"))
    }
}
struct introView: View {
    let  character:Role
    var body: some View {
        VStack(spacing:5){
            HStack{
                Text(self.character.name)
                    .font(.custom("YuppyTC-Regular",size:30))
                Text(" _\(self.character.relation)")
                    .font(.custom("YuppyTC-Regular",size:18))
            }
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            Text(self.character.info)
                .modifier(TWViewModifier(size: 20))
                .frame(width: 300)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
