import Foundation

struct Card: Identifiable, Hashable {
    let imageName: String
    let description: String
    let id = UUID()
}
