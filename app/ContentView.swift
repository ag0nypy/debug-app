import SwiftUI

struct ContentView: View {
    @State private var isDebugMenuVisible = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 20) {
                Text("Main App Screen")
                    .font(.largeTitle)

                Button("Simulate API Call") {
                    print("API called 🚀")
                }
            }

            if isDebugMenuVisible {
                DebugMenuView()
                    .transition(.move(edge: .trailing))
                    .padding()
            }
        }
        .onShake {
            withAnimation {
                isDebugMenuVisible.toggle()
            }
        }
    }
}
