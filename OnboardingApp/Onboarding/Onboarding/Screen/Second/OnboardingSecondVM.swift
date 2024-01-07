import SwiftUI

final class OnboardingSecondVM: ObservableObject {
    @Published var card: Card

    init() {
        card = OnboardingSecondVM.loadData()
    }

    // MARK: - Private interface

    static func loadData() -> Card {
        Card.staticCardsData[1]
    }
}
