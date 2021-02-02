//
//  CodeData.swift
//  hw4
//
//  Created by User03 on 2020/11/17.
//

import Foundation

struct Code: Identifiable, Codable{
    var id = UUID()
    var title:String
    var language:String
    var hard:Int
    var isKnown:Bool
    var algorithm:String
    var question:String
    var context:String
}
let LanguageOpts=["C++", "Python","C","Java","Swift","GO","PHP","Ruby","Verilog","Others"]
let AlgorithmOpts=["randomized algorithm","Sorting algorithm","Dynamic programming","Minimum spanning tree","Depth-First-Search","Breadth-First Search","genetic algorithm","greedy algorithm","binary tree", "binary heap","others","no"]

extension String: Identifiable {
    public var id: String { self }
}

class CodeData: ObservableObject {
    @Published var codes = [Code]() {//變化時要通知畫面更新
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(codes) {
                UserDefaults.standard.set(data, forKey: "codes")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey:"codes") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Code].self, from: data) {
                codes = decodedData
            }
        }
    }
}
