//
//  CommentData.swift
//  class1028
//
//  Created by User14 on 2020/10/28.
//

import Foundation

struct Comment :Identifiable{
    let id = UUID()
    let name:String
    let hearts:Int
    let message:String
}

class CommentData: ObservableObject{
    @Published var comments = [Comment]()//變化時要通知畫面更新
}
