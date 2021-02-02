//
//  MusicView.swift
//  hw2
//
//  Created by 林湘羚 on 2020/10/19.
//

import SwiftUI
import AVFoundation

struct MusicView: View {
    @State private var isPlay = false
    let song:String
    //畫面出現時播放音樂
    let player = AVPlayer()
    var body: some View {
        Button(action:{
            //設定 player 播放的音樂並開始播放
            let fileUrl = Bundle.main.url(forResource: song, withExtension: "mp3")!//產生音樂在 App 裡路徑的 URL
            let playerItem = AVPlayerItem(url: fileUrl)//利用 AVPlayerItem 生成要播放的音樂
            if player.currentItem==nil{
                player.replaceCurrentItem(with: playerItem)//設定 player要播放的AVPlayerItem
            }
            player.volume = 0.1
            isPlay = !isPlay
            
            if isPlay{
                player.play()//開始播放音樂
            }
            else{
                player.pause()
            }
        }){
            Image(systemName: (isPlay == false) ? "play.circle.fill" : "pause.circle")
        }
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView(song:"Hey baby!")
    }
}

