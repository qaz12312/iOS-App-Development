//
//  CommentList.swift
//  class1028
//
//  Created by User14 on 2020/10/28.
//

import SwiftUI

struct CommentList: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    @StateObject var commentData = CommentData()
    @State private var showEditComment = false
    var body: some View {
        NavigationView {
            List {
                ForEach(commentData.comments) { (comment) in
                    CommentRow(item: comment)
                }
            }.background(Color.yellow).opacity(0.8).edgesIgnoringSafeArea(.all)
            .navigationBarTitle("評論")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showEditComment = true
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color.purple)
                    }).buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $showEditComment) {
                        CommentEditor(showEditComment:$showEditComment,commentData: commentData)
                    }
                }
            })
        }
    }
}

struct CommentList_Previews: PreviewProvider {
    static var previews: some View {
        CommentList()
    }
}
