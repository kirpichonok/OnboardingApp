import SwiftUI

struct OnboardingFirstView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = OnboardingFirstVM()
//    private let screenOrder = ScreenOrder.first

    var body: some View {
        OnboardingView(card: $viewModel.card,
                       buttonAction: {
                           coordinator.push(page: .onboardingSecond)
                       },
                       buttonTitle: .ButtonTitle.next)
            .navigationBarBackButtonHidden()
            .onSwiped(trigger: .onEnded) { direction in
                switch direction {
                case .left:
                        coordinator.push(page: .onboardingSecond)
                case .right:
                        coordinator.pop()
                default:
                    break
                }
            }
    }
}

#Preview {
    OnboardingFirstView()
}
