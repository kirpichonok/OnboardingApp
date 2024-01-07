import SwiftUI

@main
struct OnboardingApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorRootView()
                .environmentObject(Coordinator())
        }
    }
}
