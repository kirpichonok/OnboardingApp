import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingVM
    @State var visibleCardsIndices = [Int]()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack {
                ForEach(Array(viewModel.cards.enumerated()), id: \.offset) { currentCardIndex, card in
                    CardView(card: card)
                        .animation(.linear(duration: 0.4), value: visibleCardsIndices)
                        .offset(
                            x: visibleCardsIndices.contains(currentCardIndex) ? .zero : xAxisDisappearOffset,
                            y: yAxisOffset * CGFloat(currentCardIndex)
                        )
                        .padding([.horizontal, .top], self[currentCardIndex])
                }
            }
            .onSwiped(trigger: .onEnded) { direction in
                switch direction {
                case .left:
                    _ = visibleCardsIndices.popLast()
                case .right:
                    if visibleCardsIndices.count < viewModel.cards.count {
                        visibleCardsIndices.append(visibleCardsIndices.endIndex)
                    }
                default:
                    break
                }
            }

            Button {
                if visibleCardsIndices.count <= 1 {
                    dismiss()
                }
                _ = visibleCardsIndices.popLast()
            }
            label: {
                Text(verbatim: visibleCardsIndices.count <= 1
                    ? .ButtonTitle.close
                     : .ButtonTitle.next)
            }
            .font(Font.title2.weight(.semibold))
            .buttonStyle(AppButtonStyle())
            .padding(EdgeInsets(top: 20, leading: 80, bottom: 40, trailing: 80))
        }
        .onAppear(perform: {
            visibleCardsIndices = Array(viewModel.cards.indices)
        })
    }

    private subscript(index: Int) -> CGFloat {
        basePadding + CGFloat(viewModel.cards.count - index) * 10.0
    }

    private let yAxisOffset: CGFloat = -5
    private let xAxisDisappearOffset: CGFloat = -600
    private let basePadding: CGFloat = 10
}

#Preview {
    OnboardingView(viewModel: OnboardingVM())
}
