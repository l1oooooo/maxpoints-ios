import SwiftUI

struct RootView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 20) {
                    Text("m")
                        .font(.system(size: 48, weight: .heavy, design: .rounded))
                        .foregroundStyle(MaxPointsStyle.surface)
                        .frame(width: 88, height: 88)
                        .background(MaxPointsStyle.accent, in: RoundedRectangle(cornerRadius: 26))
                        .accessibilityHidden(true)

                    Text("MaxPoints")
                        .font(.largeTitle.weight(.bold))
                        .foregroundStyle(MaxPointsStyle.ink)
                        .accessibilityAddTraits(.isHeader)
                        .accessibilityIdentifier("maxpoints.title")

                    Text("Make every card count.")
                        .font(.body)
                        .foregroundStyle(MaxPointsStyle.ink.opacity(0.65))
                        .accessibilityIdentifier("maxpoints.tagline")
                }
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(32)
                .frame(minHeight: geometry.size.height)
            }
            .accessibilityIdentifier("maxpoints.root")
        }
        .background(MaxPointsStyle.canvas.ignoresSafeArea())
    }
}

#Preview {
    RootView()
        .preferredColorScheme(.light)
}
