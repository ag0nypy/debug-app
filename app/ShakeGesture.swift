import SwiftUI

// Shake Gesture Support
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        NotificationCenter.default.post(name: .deviceShaken, object: nil)
    }
}

extension View {
    func onShake(_ action: @escaping () -> Void) -> some View {
        onReceive(NotificationCenter.default.publisher(for: .deviceShaken)) { _ in action() }
    }
}

extension Notification.Name {
    static let deviceShaken = Notification.Name("deviceShaken")
}
