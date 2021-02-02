//
//  CodeEditor.swift
//  hw4
//
//  Created by User03 on 2020/11/17.
//

import SwiftUI

struct CodeEditor: View {
    @State private var title:String = "please named this topic" //textfield
    @State private var language:String = "C++"  // picker
    @State private var hard:Int = 3 // step(1~5)
    @State private var isKnown: Bool = false
    @State private var unKnowInfo: String = "no!!!"
    @State private var algorithm:String = "greedy algorithm" // radio list
    @State private var question:String = "you can leave messages about question"
    @State private var context:String = "the context of the topic" // TextEditor
    
    var codeData: CodeData
    @Environment(\.presentationMode) var presentationMode//return last page
    
    var editCodeIndex : Int?
    
    init(codeData:CodeData,editCodeIndex:Int?=nil){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.codeData = codeData
        self.editCodeIndex = editCodeIndex
    }
    var disableForm: Bool {
        title.isEmpty || context.isEmpty
    }
    var body: some View {
            Form {
                VStack(alignment:.leading){
                    MyLabel(txt:"topic",txtSize: 20,img:"wallet.pass.fill",bigSize: 1)
                    TextField("topic", text: $title)
                        .padding(8)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 3))
                        .padding(.leading,28)
                }
                VStack(alignment:.leading){
                    OptPicker(txt:"language",arr:LanguageOpts,option:$language)
                }
                VStack(alignment:.leading){
                    MyLabel(txt:"困難度",txtSize: 20,img:"flame.fill",bigSize: 1)
                    OptStepper(txt:"hard?",option:$hard)
                        .padding(.leading,28)
                }
                HStack{
                    MyLabel(txt:"理解",txtSize: 20,img:"person.fill.questionmark",bigSize: 1)
                    Toggle(unKnowInfo, isOn: $isKnown)
                        .modifier(ENViewModifier(size:20))
                        .foregroundColor(Color(red: 254/255, green: 146/255, blue: 159/255))
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: 1, green: 204/255, blue: 1)))
                        .onChange(of:isKnown,perform:{ value in
                            if value {
                                unKnowInfo = "yes~~"
                            }else{
                                unKnowInfo = "no!!!"
                            }
                        })
                }
                NavigationLink(destination: RadioList(codeData: self.codeData,editCodeIndex:self.editCodeIndex,option:$algorithm)){
                    HStack{
                        MyLabel(txt:"algorithm",txtSize: 20,img:"square.and.pencil",bigSize: 1)
                        Spacer()
                        MyText(txt:algorithm,color:Color.black,isTW:false,size:20)
                    }
                }
                LeaveMsg(txt: "question",icon:"t.bubble.fill", msg: $question)
                LeaveMsg(txt: "code",icon:"note.text", msg: $context)
            }.background(Image("bg1").resizable().scaledToFill()).edgesIgnoringSafeArea(.all)
            .onAppear{
                if let editCodeIndex = self.editCodeIndex{
                    let editCode=codeData.codes[editCodeIndex]
                    self.title = editCode.title
                    self.language = editCode.language
                    self.hard = editCode.hard
                    self.isKnown = editCode.isKnown
                    self.unKnowInfo = self.isKnown == true ? "yes~~" : "no!!!"
                    self.algorithm = editCode.algorithm
                    self.question = editCode.question
                    self.context = editCode.context
                }
            }
            .onDisappear{
                if let editCodeIndex = self.editCodeIndex{
                    print("on disappear")
                    let code = Code(title: self.title,language: self.language,hard:self.hard,isKnown:self.isKnown,algorithm:self.algorithm,question:self.question,context:self.context)
                    codeData.codes[editCodeIndex] = code
                }
            }
            .toolbar(content:{//design navigation bar
                ToolbarItem(placement:.principal){
                    HStack{
                        MyLabel(txt:editCodeIndex == nil ? "新增" : "編輯",txtSize: 25,img:"rectangle.3.offgrid.bubble.left.fill",bigSize: 1.5)
                        Spacer()
                        Button(action: {
                            let code = Code(title: self.title,language: self.language,hard:self.hard,isKnown:self.isKnown,algorithm:self.algorithm,question:self.question,context:self.context)
                            if let editCodeIndex = self.editCodeIndex{
                                self.codeData.codes[editCodeIndex] = code
                            } else {
                                self.codeData.codes.insert(code, at: 0)
                            }
                            self.presentationMode.wrappedValue.dismiss()
                        }){
                            Text("儲存").fontWeight(.heavy)
                        }
                        .disabled(disableForm)
                    }
                }
            })
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct CodeEditor_Previews: PreviewProvider {
    static var previews: some View {
        CodeEditor(codeData:CodeData())
    }
}

struct OptPicker: View {
    let txt:String
    let arr:[String]
    @Binding var option: String
    var body: some View {
        Picker(selection: self.$option, label: Text("選擇語言")) {
            ForEach(arr) { (language) in
                MyText(txt:language,color:Color.black,isTW:false,size:30)
            }
        }
        .cornerRadius(5)
        .pickerStyle(WheelPickerStyle())
        .shadow(radius: 30)
        .padding([.leading,.trailing],20)
        .clipped()
    }
}

struct OptStepper: View {
    let txt:String
    @Binding var option: Int
    var body: some View {
        HStack{
            ShowIcon(num:option)
            Stepper("\(option)", value: $option, in: 1 ... 5)
        }
    }
}

struct ShowIcon:View{
    var num:Int
    var body: some View{
        switch num {
        case 1:
            HStack{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                ForEach(1..<5){_ in
                    Image(systemName: "star")
                }.foregroundColor(.gray)
            }
        case 2:
            HStack{
                ForEach(0..<2){_ in
                    Image(systemName: "star.fill")
                }.foregroundColor(.yellow)
                ForEach(2..<5){_ in
                    Image(systemName: "star")
                }.foregroundColor(.gray)
            }
        case 3:
            HStack{
                ForEach(0..<3){_ in
                    Image(systemName: "star.fill")
                }.foregroundColor(.yellow)
                ForEach(3..<5){_ in
                    Image(systemName: "star")
                }.foregroundColor(.gray)
            }
        case 4:
            HStack{
                ForEach(0..<4){_ in
                    Image(systemName: "star.fill")
                }.foregroundColor(.yellow)
                Image(systemName: "star")
                    .foregroundColor(.gray)
            }
        case 5:
            HStack{
                ForEach(0..<5){_ in
                    Image(systemName: "star.fill")
                }.foregroundColor(.yellow)
            }
        default:
            HStack{
                ForEach(0..<3){_ in
                    Image(systemName: "star.fill")
                }.foregroundColor(.yellow)
                ForEach(3..<5){_ in
                    Image(systemName: "star")
                }.foregroundColor(.gray)
            }
        }
    }
}

struct LeaveMsg:View{
    let txt:String
    let icon:String
    @Binding var msg:String
    var body: some View{
        VStack(alignment:.leading){
            MyLabel(txt:txt,txtSize: 20,img:icon,bigSize: 1)
            TextEditor(text: $msg)
                .padding(1)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                .padding(.leading,28)
        }
    }
}
