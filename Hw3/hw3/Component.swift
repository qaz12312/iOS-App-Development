import SwiftUI

struct MyLabel: View {
    let txt: String
    let txtSize: CGFloat
    let img: String
    let bigSize:CGFloat
    var body: some View {
        HStack {
            Image(systemName:img)
                .scaleEffect(bigSize)
            Text(txt)
                .modifier(TWViewModifier(size: txtSize))
        }
    }
}

// ButtonStyle
struct NeumorphicButtonStyle:ButtonStyle {
    let bgColor: Color = Color(red:241/255,green:241/255,blue:244/255)
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 1: 5, x: configuration.isPressed ? -5: -5, y: configuration.isPressed ? -5: -5)
                        .shadow(color: .gray, radius: configuration.isPressed ? 1: 5, x: configuration.isPressed ? 5: 5, y: configuration.isPressed ? 5: 5)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.9: 1)
            .foregroundColor(.primary)
            .animation(.spring())
    }
}

struct LinearButtonStyle:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .modifier(TWViewModifier(size: 30))
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color(red:170/255,green:17/255,blue:109/255), Color(red:73/255,green:162/255,blue:171/255)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(4)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.1 )//縮放
    }
}


