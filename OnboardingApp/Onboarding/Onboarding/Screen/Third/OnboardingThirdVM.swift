import SwiftUI

class OnboardingThirdVM: ObservableObject {
    @Published var card: Card

    init() {
        card = OnboardingThirdVM.loadData()
    }

    // MARK: - Private interface

    static func loadData() -> Card {
        Card.staticCardsData[2]
    }
}
