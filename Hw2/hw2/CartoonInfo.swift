//
//  CartoonInfo.swift
//  hw2
//
//  Created by User03 on 2020/10/14.
//

import Foundation

struct CartoonInfo{
    let key: String
    let kind: String
    let time: String
    let others: [String]
    let photos: [String]
    let film: [WebPage]
}

struct WebPage{
    let name:String
    let url:String
}

