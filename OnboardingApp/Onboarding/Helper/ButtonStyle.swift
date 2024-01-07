import SwiftUI

struct AppButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(.orange)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
