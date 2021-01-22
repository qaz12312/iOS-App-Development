//
//  OneATwoB.swift
//  GuessNumber
//
//  Created by User06 on 2021/1/22.
//

import Foundation
class ABGame: ObservableObject{
    private var answer:[Int]
    private var bits:Int     // 多少位數
    @Published var time:Int  //還有幾次可以猜
    @Published var result:String //猜的結果
    
    init(){
        self.bits = 4
        self.time = 10
        self.answer = Array(repeating: 0, count: self.bits)
        // random answer
        self.result = "開始猜吧！"
        generat()
    }
    func setAttr(bits:Int,time:Int){
        self.bits = bits
        self.time = time
        self.answer = Array(repeating: 0, count: self.bits)
        generat()
    }
    func getAns() -> String{
        var myString = ""
        _ = self.answer.map{ myString = myString + "\($0)" }
        return myString
    }
    func generat(){
        var tempArr = [0,1,2,3,4,5,6,7,8,9]
        tempArr.shuffle()
        for i in 0..<self.bits {
            answer[i] = tempArr[i]
        }
    }
    func play(guess:[Int]) -> String{
        if isGameOver() {
            return "GameOver"
        }
        var rst=[0,0]
        for i in 0..<self.bits {
            for j in 0..<self.bits {
                if guess[i] == self.answer[j] {
                    if i == j {
                        rst[0] += 1
                    }else{
                        rst[1] += 1
                    }
                }
            }
        }
        self.time -= 1
        self.result = "\(rst[0])A\(rst[1])B"
        if isCorrect(aTime: rst[0], bTime: rst[1]) {
            return "Correct!"
        }
        return self.result
    }
    
    func isGameOver() -> Bool{
        if self.time == 0 {
            print("GameOver")
            return true
        }
        return false
    }
    
    func isCorrect(aTime:Int,bTime:Int) -> Bool{
        if bTime==0 {
            if aTime == self.bits {
                print("get it !")
                return true
            }
        }
        return false
    }
}
