//
//  CommentEditor.swift
//  class1028
//
//  Created by User14 on 2020/10/28.
//

import SwiftUI

struct CommentEditor: View {
    @State private var name = ""
    @State private var hearts: Int = 3
    @State private var message = "輸入你的感想等等都可以～"
    @Binding var showEditComment: Bool
    var commentData: CommentData
    @Environment(\.presentationMode) var presentationMode//return last page
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading){
                    MyLabel(txt:"暱稱：",txtSize: CGFloat(20),img:"person.crop.circle.fill",bigSize: CGFloat(1))
                    TextField("請問要怎麼稱呼?", text: $name)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.yellow, lineWidth: 3))
                        .padding(.leading,28)
                    MyLabel(txt:"喜愛：",txtSize: CGFloat(20),img:"suit.heart.fill",bigSize: CGFloat(1))
                    Stepper("\(hearts)", value: $hearts, in: 0 ... 5)
                        .padding(.leading,30)
                    MyLabel(txt:"評論：",txtSize: CGFloat(22),img:"text.bubble.fill",bigSize: CGFloat(1))
                    TextEditor(text: $message)
                        .padding(5)
                        .border(Color(red: 178/255, green: 101/255, blue: 255/255), width: 3)
                        .padding(.leading,28)
                }
                HStack{
                    Spacer()
                    SendBtn(item:Comment(name:name,hearts:hearts,message:message),commentData:commentData)
                    Spacer()
                }.padding()
            }
            .toolbar(content:{//design navigation bar
                ToolbarItem(placement:.principal){
                    HStack{
                        MyLabel(txt:"留下你的足跡",txtSize: CGFloat(20),img:"pencil.and.ellipsis.rectangle",bigSize: CGFloat(1))
                        Button("Close") {
                            self.presentationMode.wrappedValue.dismiss()
                            showEditComment = false
                        }
                    }
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SendBtn: View{
    let item :Comment//用來讀取輸入
    @State private var isSend:Bool = false
    @State var showMsg:Bool = false
    @State var showAlert:Bool = false
    var commentData: CommentData
    @State private var showingSheet = false
    var body: some View{
        Button(action: {
            isSend = (item.name.isEmpty==true ? false : true)
            self.showingSheet = isSend
            showAlert = !isSend
        }){
            Text("sure").bold()
        }.buttonStyle(NeumorphicButtonStyle())
        .frame(alignment:.center)
        .actionSheet(isPresented: self.$showingSheet) { () -> ActionSheet in
            ActionSheet(title: Text("想做些什麼呢？"), buttons: [ActionSheet.Button.default(Text("預覽我的留言"), action: {
                self.showMsg = true
            }),ActionSheet.Button.default(Text("確定送出👍🏻"), action: {
                commentData.comments.insert(item, at: 0)
            }),ActionSheet.Button.cancel(Text("取消"))])}
        .alert(isPresented: $showAlert) { () -> Alert in
            return Alert(title: Text("你沒有輸入暱稱喔！！"))
        }
        if(showMsg == true){
            Text("").sheet(isPresented: $showMsg, content: {
                ShowUserSheep(showMsg:$showMsg, item: item)
            })
        }
    }
}

struct ShowUserSheep: View {
    @Binding var showMsg:Bool
    let item :Comment
    var body: some View {
        ZStack{
            Image("comment0").resizable().scaledToFill().edgesIgnoringSafeArea(.all)
            VStack{
                CommentRow(item:item)
                    .clipped()
                Divider()
                Button(action: {
                    showMsg = false
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.red)
                        .scaleEffect(2)
                        .offset(y:-10)
                }).buttonStyle(PlainButtonStyle())
            }.background(Color.white).opacity(0.8).cornerRadius(10)
            .padding(EdgeInsets(top: 70, leading: 50, bottom: 70, trailing: 50))
        }
    }
}
