import SwiftUI

final class OnboardingFirstVM: ObservableObject {
    @Published var card: Card

    init() {
        card = OnboardingFirstVM.loadData()
    }

    // MARK: - Private interface

    private static func loadData() -> Card {
        Card.staticCardsData[0]
    }
}
