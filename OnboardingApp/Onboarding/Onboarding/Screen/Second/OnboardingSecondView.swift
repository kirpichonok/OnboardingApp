import SwiftUI

struct OnboardingSecondView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = OnboardingSecondVM()

    var body: some View {
        OnboardingView(card: $viewModel.card,
                       buttonAction: {
                           coordinator.push(page: .onboardingThird)
                       },
                       buttonTitle: .ButtonTitle.next)
            .onSwiped(trigger: .onEnded) { direction in
                switch direction {
                case .left:
                        coordinator.push(page: .onboardingThird)
                case .right:
                        coordinator.pop()
                default:
                    break
                }
            }

            .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingSecondView()
}
