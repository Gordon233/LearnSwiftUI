import SwiftUI

@main
struct LearnSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ColorfulCounterView()
        }
    }
}

struct CountDisplay: View {
    let count: Int  // 像React的props
    @Binding var selectedColor: Color
    
    var body: some View {
        Text("计数: \(count)")
            .font(.largeTitle)
            .foregroundColor(selectedColor)
            .scaleEffect(count >= 10 ? 1.5 : 1)
            .animation(.easeIn, value: count)
    }
}

struct CountButton: View {
    @Binding var count: Int  // 注意是 @Binding 不是 let
    
    var body: some View {
        Button("点击 +1") {
            count += 1
        }
        .buttonStyle(.borderedProminent)
    }
}

struct ColorfulCounterView: View {
    @State private var count = 0
    @State private var selectedColor: Color = .blue
    
    let colors: [Color] = [.red, .green, .blue, .yellow, .orange]

    var body: some View {
        VStack {
            CountDisplay(count: count, selectedColor: $selectedColor)

            if count >= 10 {
                Text("🎉 恭喜达到10！")
                    .font(.largeTitle)
                    .foregroundColor(selectedColor)
            }
            CountButton(count: $count)
            
            // 分隔线
           Divider()
               .padding(.vertical)
            
            Text("选择颜色")
            .font(.headline)
            
            HStack(spacing: 15) {
                ForEach(colors, id: \.self) { color in
                    Circle()
                        .fill(color)
                        .frame(width: 30, height: 30)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: selectedColor == color ? 3 : 0)

                        )
                        .scaleEffect(selectedColor == color ? 1.2 : 1)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedColor = color
                            }
                        }
                }
            }
            

        }
        .padding()
    }
}
