# 🔧 Debug App — Internal iOS Debug Menu (MVP)

A minimal, modular iOS app (Swift + SwiftUI) demonstrating an **internal developer debug menu** for QA and engineering workflows.  

---

## 🚀 Quick highlights

- Built with **Swift** and **SwiftUI** (iOS 15+)
- Reveal the debug menu with the **device Shake gesture** (simulator: use `Hardware → Shake Gesture` or trigger via code)
- Includes feature flags, device diagnostics, and feedback JSON export
- Small, clean codebase that is easy to extend and integrate into other apps

---

## ✨ Features

- 🔁 **Shake to reveal** an in-app Debug Menu  
- ⚙️ **Feature flag toggle(s)** (demo)  
- 📱 **Device & OS diagnostics** (printable to console)  
- 📝 **Export feedback** as JSON (printed in MVP — extendable to file upload)  
- 🧩 Modular file layout for quick onboarding and extension

---

## 📱 How it works

1. Launch the app in Simulator or on a device.  
2. Trigger a **Shake** (Simulator: `Device → Shake` or menu `Hardware → Shake Gesture`) — the debug menu appears.  
3. Use toggles to enable demo feature flags, print device info, or `Send Feedback JSON` which prints a JSON payload to the console (MVP behaviour).

> The debug menu is implemented as a SwiftUI view and is toggled via a `NotificationCenter` event published by an overridden `UIWindow.motionEnded` handler in `ShakeGesture.swift`. This keeps the UI declarative and the event handling platform-friendly.

---

## 🛠 Files to look at (quick tour)

- **DebugApp.swift** — App entrypoint (`@main`) that launches `ContentView`.  
- **ContentView.swift** — Main screen and the `@State` that controls debug menu visibility. Attaches `.onShake` modifier.  
- **DebugMenuView.swift** — Debug UI: toggles, device info button, feedback action.  
- **ShakeGesture.swift** — `UIWindow` override to post `.deviceShaken` Notification and `View.onShake(_:)` modifier to observe it.

---

## 🧪 Unit tests

The repo includes a small test target with example tests using `XCTest`. Suggested test cases:

- Verify feature flag default state and toggle behavior.
- Verify feedback JSON formatting utility (if moved into a helper).
- Verify debug visibility state toggles when receiving the `.deviceShaken` notification (unit-testable by posting the notification).

Run tests in Xcode with:  
⌘ + U

---

## ▶️ Setup & Run

1. Clone the repo:
```bash
git clone https://github.com/umaidshahid/debug-app
cd DebugApp
Open the Xcode project/workspace (e.g., DebugApp.xcodeproj) in Xcode 15+.
Select a Simulator or a connected device.
Build & run (⌘ + R). To reveal the Debug Menu in Simulator: Device → Shake (or Hardware → Shake Gesture).