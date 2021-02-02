import SwiftUI

struct RadioList: View {
    var codeData: CodeData?
    var editCodeIndex : Int?
    @Binding var option:String
    var body: some View {
        List {
            ForEach(AlgorithmOpts) { algorithm in
                if let editCodeIndex = self.editCodeIndex{
                    DCTableCell(codeData:self.codeData,editCodeIndex:self.editCodeIndex,selectedName: self.$option,name: algorithm)
                        .listRowBackground(algorithm == self.option ? Color.gray.opacity(0.5) : Color.white)
                } else {
                    DCTableCell(selectedName: self.$option,name: algorithm)
                        .listRowBackground(algorithm == self.option ? Color.gray.opacity(0.5) : Color.white)
                }
            }
        }
    }
}

struct DCTableCell: View {
    var codeData: CodeData?
    var editCodeIndex : Int?
    @Binding var selectedName: String
    let name: String
    
    var body: some View {
        Button(action: {
            print("Tapped---\(name)")
            self.selectedName = self.name
            if let editCodeIndex = self.editCodeIndex{
                codeData?.codes[editCodeIndex].algorithm = selectedName
            }
            
        }){
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(self.name == self.selectedName ? Color.blue : Color.white,lineWidth: 3)
                    .frame(height: 56)
                    .foregroundColor(.clear)
                HStack {
                    MyText(txt:self.name,color:self.name == self.selectedName ? Color.blue : Color.black,isTW:false,size:25).padding()
                    Spacer()
                    ZStack {
                        Circle()
                            .stroke(self.name == self.selectedName ? Color.blue : .black,lineWidth: 2)
                            .frame(width: 18, height: 18)
                            .padding()
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(self.name == self.selectedName ? Color.blue: Color.clear)
                    }
                }
            }
        }
    }
}
