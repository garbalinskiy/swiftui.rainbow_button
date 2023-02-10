import SwiftUI

struct RainbowButton2: View {
    @State private var backgroundColors: [Color] = [
        .red,
        .orange,
        .yellow,
        .green,
        .blue,
        .purple,
    ]
    
    @State private var colorTransition: Double = 0.0
    
    var body: some View {
        Button(action: {
            print("Button was clicked")
        }) {
            
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: backgroundColors[0], location: colorTransition + 0),
                    .init(color: backgroundColors[1], location: colorTransition + 0.33),
                    .init(color: backgroundColors[2], location: colorTransition + 0.66),
                    .init(color: backgroundColors[3], location: colorTransition + 1),
                    .init(color: backgroundColors[4], location: colorTransition + 1.33),
                    .init(color: backgroundColors[5], location: colorTransition + 1.66),
                    .init(color: backgroundColors[4], location: colorTransition + 2),
                    .init(color: backgroundColors[3], location: colorTransition + 2.33),
                    .init(color: backgroundColors[2], location: colorTransition + 2.66),
                    .init(color: backgroundColors[1], location: colorTransition + 3),
                    .init(color: backgroundColors[0], location: colorTransition + 3.33),
                    .init(color: backgroundColors[1], location: colorTransition + 3.66),
                    .init(color: backgroundColors[2], location: colorTransition + 4),
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).mask(
            
                Text(" Some text")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .overlay(Capsule().stroke(
                        lineWidth: 4
                    ))
                    .animation(.linear, value: colorTransition)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { _ in
                            self.colorTransition -= 0.005
                            if self.colorTransition <= -3.33 {
                                self.colorTransition = 0
                            }
                        }
                    }
            )
        }.frame(height: 58)
    }
}
