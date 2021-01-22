//
//  GuessRecordData.swift
//  GuessNumber
//
//  Created by User06 on 2021/1/22.
//

import Foundation
struct Record: Identifiable, Codable{
    var id = UUID()
    var guess:String
    var result:String
}

extension StringProtocol  {
    var digits: [Int] { compactMap(\.wholeNumberValue) }
}


class RecordData: ObservableObject {
    @Published var record = [Record]() {//變化時要通知畫面更新
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(record) {
                UserDefaults.standard.set(data, forKey: "codes")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey:"codes") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Record].self, from: data) {
                record = decodedData
            }
        }
    }
}
