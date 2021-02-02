//
//  CartoonProfile.swift
//  hw2
//
//  Created by User03 on 2020/10/14.
//

import Foundation

struct CartoonProfile{
    let key: String
    let tags:[String]
    let cont:String//content
    let roles: [Role]
    let music:[Music]
    let others:[WebPage]
}

struct Role{
    let relation:String
    let name:String
    let info:String
}

struct Music{
    let name:String
    let url:String
}


struct CartoonLog {
    let key: String
    var watchs: Int
    var hots:Int
    var likes:Int
    var hearts:Int
}
