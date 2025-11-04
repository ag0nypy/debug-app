import SwiftUI

struct DebugMenuView: View {
    @State private var featureFlagEnabled = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("🛠 Debug Menu")
                .font(.headline)

            Toggle("Enable Feature Flag", isOn: $featureFlagEnabled)

            Button("Print Device Info") {
                print("Device: \(UIDevice.current.model)")
                print("iOS: \(UIDevice.current.systemVersion)")
            }

            Button("Send Feedback JSON") {
                let feedback = ["title": "Testing", "timestamp": Date().description]
                print("Feedback JSON: \(feedback)")
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}
