import SwiftUI

struct CoordinatorRootView: View {
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.main)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page)
                }
        }
        .environmentObject(coordinator)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CoordinatorRootView()
}
