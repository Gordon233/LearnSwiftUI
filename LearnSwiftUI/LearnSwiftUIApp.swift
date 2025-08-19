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

            var message: String {
                if count >= 10 {
                    return "🎉 恭喜达到10！"
                } else {
                    return "计数: \(count)"
                }
            }
            
            Text("计数: \(count)")
                .font(.largeTitle)

            Text(message)
                .font(.title)

            Button("点击 +1") {
                count += 1
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
