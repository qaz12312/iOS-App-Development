//
//  CodeList.swift
//  hw4
//
//  Created by User03 on 2020/11/17.
//

import SwiftUI

struct CodeList: View {
    @ObservedObject var codeData = CodeData()
    @State private var showEditCode = false
    @State private var searchText = ""
    var filterWords: [Code] {
        return codeData.codes.filter({searchText.isEmpty ? true : $0.title.contains(searchText)})
       }
    init(codeData:CodeData){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.codeData = codeData
    }
    func fundIdx(code:Code) -> Int {
        for idx in 0...codeData.codes.count-1 {
            if code.id == codeData.codes[idx].id{
                return idx
            }
        }
        return -1
    }
    var body: some View {
        NavigationView{
            List{
                SearchBar(text: $searchText)
                ForEach(filterWords){ (code) in
                    
                    NavigationLink(destination: CodeFile(codeData: self.codeData, writenCodeIndex: fundIdx(code: code))){
                        CodeRow(code: code)
                    }
                }
                //Move Rows from List
                .onMove { (indexSet, index) in
                    self.codeData.codes.move(fromOffsets: indexSet,toOffset: index)
                }
                .onDelete{ (indexSet) in
                    self.codeData.codes.remove(atOffsets: indexSet)
                }
            }.background(Image("bg6").resizable().scaledToFill())
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("列表")
            .navigationBarItems(leading:
                                    HStack{
                                        EditButton()
                                            .padding(5)
                                        Button(action: {
                                            self.codeData.codes.removeAll()
                                        }, label: {Text("一鍵清除").modifier(TWViewModifier(size: 20))})
                                    }
                                ,trailing:
                                    HStack{
                                        Button(action: {self.showEditCode = true}, label: {Image(systemName: "plus.circle.fill")})
                                    })
            .sheet(isPresented: $showEditCode) {
                NavigationView{
                    CodeEditor(codeData: self.codeData)
                }
            }
        }
    }
}

struct CodeList_Previews: PreviewProvider {
    static var previews: some View {
        CodeList(codeData:CodeData())
    }
}
