import SwiftUI

@main
struct LearnSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView()
        }
    }
}

struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("计数: \(count)")
                .font(.largeTitle)

            Button("点击 +1") {
                count += 1
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
