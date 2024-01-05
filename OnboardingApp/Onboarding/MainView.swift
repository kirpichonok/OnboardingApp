import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Spacer()
            Button {}
                label: {
                    Label(
                        title: {
                            Text(verbatim: .ButtonTitle.onboarding)
                        },
                        icon: {
                            Image(systemName: .ImageName.questionMark)
                        }
                    )
                }
                .font(Font.title2.weight(.semibold))
                .buttonStyle(AppButtonStyle())

                .padding(EdgeInsets(top: 20, leading: 80, bottom: 40, trailing: 80))
        }
    }
}

#Preview {
    MainView()
}
