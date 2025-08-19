import SwiftUI

@main
struct LearnSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView()
        }
    }
}

struct CountDisplay: View {
    let count: Int  // 像React的props
    
    var body: some View {
        Text("计数: \(count)")
            .font(.largeTitle)
    }
}

struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            CountDisplay(count: count)

            if count >= 10 {
                Text("🎉 恭喜达到10！")
                    .font(.largeTitle)
                    .foregroundColor(.green)
            }
            
            Button("点击 +1") {
                count += 1
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
