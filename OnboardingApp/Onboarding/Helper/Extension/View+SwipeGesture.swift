import SwiftUI

extension View {
    func onSwiped(
        trigger: SwipeModifier.Trigger = .onChanged,
        action: @escaping (SwipeModifier.Directions) -> Void
    ) -> some View {
        let swipeModifier = SwipeModifier(trigger: trigger) {
            action($0)
        }
        return modifier(swipeModifier)
    }

    func onSwiped(
        _ direction: SwipeModifier.Directions,
        trigger: SwipeModifier.Trigger = .onChanged,
        action: @escaping () -> Void
    ) -> some View {
        let swipeModifier = SwipeModifier(trigger: trigger) {
            if direction == $0 {
                action()
            }
        }
        return modifier(swipeModifier)
    }
}

struct SwipeModifier: ViewModifier {
    enum Directions: Int {
        // swiftlint:disable:next identifier_name
        case up
        case down
        case left
        case right
    }

    enum Trigger {
        case onChanged
        case onEnded
    }

    var trigger: Trigger
    var handler: ((Directions) -> Void)?

    func body(content: Content) -> some View {
        content.gesture(
            DragGesture(
                minimumDistance: 24,
                coordinateSpace: .local
            )
            .onChanged {
                if trigger == .onChanged {
                    handle($0)
                }
            }.onEnded {
                if trigger == .onEnded {
                    handle($0)
                }
            }
        )
    }

    private func handle(_ value: _ChangedGesture<DragGesture>.Value) {
        let hDelta = value.translation.width
        let vDelta = value.translation.height

        if abs(hDelta) > abs(vDelta) {
            handler?(hDelta < 0 ? .left : .right)
        } else {
            handler?(vDelta < 0 ? .up : .down)
        }
    }
}
