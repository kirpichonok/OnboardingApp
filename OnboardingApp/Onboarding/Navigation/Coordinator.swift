import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push(page: Page) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    @ViewBuilder func build(_ page: Page) -> some View {
        switch page {
        case .main:
            MainView()
        case .onboarding:
            OnboardingView(viewModel: OnboardingVM())
        }
    }
}
