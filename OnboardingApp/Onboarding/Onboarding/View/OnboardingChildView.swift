import SwiftUI

struct OnboardingChildView: View {
    @EnvironmentObject var viewModel: OnboardingVM
    let screenOrder: ScreenOrder

    var body: some View {
        OnboardingView(card: $viewModel.cards[screenOrder.rawValue],
                       buttonTitle: "Next",
                       buttonAction: { viewModel.showScreen(after: screenOrder) })
            .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingChildView(screenOrder: .second).environmentObject(OnboardingVM())
}
