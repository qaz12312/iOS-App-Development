import SwiftUI

struct CodeFile: View {
    @ObservedObject var codeData = CodeData()
    var writenCodeIndex : Int
    init(codeData:CodeData,writenCodeIndex:Int){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.codeData = codeData
        self.writenCodeIndex = writenCodeIndex
    }
    var body: some View {
        let writenCode = codeData.codes[self.writenCodeIndex]
        List{
            Tag(txt:writenCode.language,count:writenCode.hard,isKnown:writenCode.isKnown, codeIndex: self.writenCodeIndex, codeData: codeData)
                .listRowBackground(Color.white.opacity(0.5))
            if writenCode.question != ""{
                Section(header: SectionBarCodeFile(t:"題目",img:"text.book.closed.fill")) {
                      MyText(txt:writenCode.question,color:Color.black,isTW:false,size:20)
                }.listRowBackground(Color.white.opacity(0.5))
            }
            Section(header: SectionBarCodeFile(t:"使用到的技巧",img:"rosette")) {
                 MyText(txt:writenCode.algorithm,color:Color.black,isTW:false,size:20)
            }.listRowBackground(Color.white.opacity(0.5))
            if writenCode.context != ""{
                Section(header: SectionBarCodeFile(t:"解法",img:"doc.fill")) {
                     MyText(txt:writenCode.context,color:Color.black,isTW:false,size:20)
                }.listRowBackground(Color.white.opacity(0.5))
            }
        }.background(Image("bg2").resizable().scaledToFill())
        .edgesIgnoringSafeArea(.all)
        .toolbar(content:{//design navigation bar
            ToolbarItem(placement:.principal){
                 MyText(txt:writenCode.title,color:Color(red: 25/255, green: 179/255, blue: 177/255),isTW:false,size:20)
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CodeFile_Previews: PreviewProvider {
    static var previews: some View {
        CodeFile(codeData:CodeData(),writenCodeIndex: 0 )
    }
}
struct Tag:View{
    let txt:String
    let count:Int
    let isKnown:Bool
    var codeIndex:Int
    var codeData: CodeData
    var body: some View{
        ScrollView {
            HStack{
                Image(systemName: isKnown == true ? "person.fill.checkmark" : "person.fill.questionmark")
                    .scaleEffect(2)
                    .padding([.leading,.trailing],10)
                    .foregroundColor(.blue)
                 MyText(txt:" "+txt+" ",color:Color(red: 255/255, green: 197/255, blue: 18/255),isTW:false,size:18)
                     .padding(6)
                     .background(Color.black)
                     .cornerRadius(13)
                ShowIcon(num:count)
                Spacer()
                NavigationLink(destination: CodeEditor(codeData: self.codeData, editCodeIndex: codeIndex)){
                    MyLabel(txt:"edit ",txtSize:18,img:"doc.badge.gearshape.fill",bigSize:1)
                        .padding(5)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(5)
                }
            }
        }.fixedSize(horizontal: false, vertical: true)
    }
}

struct SectionBarCodeFile: View{
    let t : String
    let img : String
    var body: some View{
        let sectImgColor = Color(red: 25/255, green: 179/255, blue: 177/255)
        let sectTxtColor = Color(red: 3/255, green: 75/255, blue: 97/255)
        HStack{
            Image(systemName:self.img)
                .foregroundColor(sectImgColor)
            MyText(txt:self.t,color:sectTxtColor,isTW:true,size:20)
        }
    }
}

