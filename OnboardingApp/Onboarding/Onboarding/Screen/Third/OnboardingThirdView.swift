import SwiftUI

struct OnboardingThirdView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = OnboardingThirdVM()

    var body: some View {
        OnboardingView(card: $viewModel.card,
                       buttonAction: {
                           coordinator.popToRoot()
                       },
                       buttonTitle: .ButtonTitle.close)
            .navigationBarBackButtonHidden()
            .onSwiped(trigger: .onEnded) { direction in
                switch direction {
                case .right:
                    coordinator.pop()
                default:
                    break
                }
            }
    }
}

#Preview {
    OnboardingThirdView()
}
