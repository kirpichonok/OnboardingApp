import SwiftUI

struct MainView: View {
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        VStack {
            Spacer()
            Button {
                coordinator.push(page: .onboarding)
            }
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
