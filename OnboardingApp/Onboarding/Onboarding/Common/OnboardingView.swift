import SwiftUI

struct OnboardingView: View {
    @Binding var card: Card
    var buttonAction: (() -> Void)?
    let buttonTitle: String

    var body: some View {
        VStack {
            CardView(card: $card)
                .offset(
                    x: .zero,
                    y: yAxisOffset
                )
                .padding([.horizontal, .top])

            Button {
                buttonAction?()
            }
            label: {
                Text(buttonTitle)
            }
            .font(Font.title2.weight(.semibold))
            .buttonStyle(AppButtonStyle())
            .padding(EdgeInsets(top: 20, leading: 80, bottom: 40, trailing: 80))
        }
    }

    private let yAxisOffset: CGFloat = -5
    private let xAxisDisappearOffset: CGFloat = -600
    private let basePadding: CGFloat = 10
}

#Preview {
    OnboardingView(card: .constant(Card.staticCardsData.first!), buttonTitle: "Next")
}
