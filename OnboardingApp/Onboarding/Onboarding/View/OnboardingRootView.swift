import SwiftUI

struct OnboardingRootView: View {
    @StateObject var viewModel: OnboardingVM
    private let screenOrder = ScreenOrder.first

    var body: some View {
        OnboardingView(card: $viewModel.cards[screenOrder.rawValue],
                       buttonTitle: "Next",
                       buttonAction: {
                           viewModel.showScreen(after: screenOrder)
                       })
                       .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingRootView(viewModel: OnboardingVM())
}
