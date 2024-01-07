enum Page: String, Identifiable {
    case main
    case onboarding

    var id: String {
        rawValue
    }
}
