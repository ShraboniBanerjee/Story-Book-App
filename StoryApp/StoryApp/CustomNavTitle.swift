import SwiftUI

struct NavHeader: View {
    var scrollOffset: CGFloat
    var title: String
    var profileImage: String
    
    var body: some View {
        ZStack {
            Color.clear
                .frame(height: interpolatedHeight())
                .background(.ultraThinMaterial.opacity(opacityView()))
                .blur(radius: 0.5)
                .edgesIgnoringSafeArea(.top)
            
            HStack {
                Image(systemName: "book.fill")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .foregroundStyle(.primary)
                    .frame(width: sideIcon(), height: sideIcon())
                    .padding(.leading, 10) // Add left padding
                
                Spacer()
                
                Text(title)
                    .bold()
                    .font(.system(size: interpolatedText()))
                    .offset(x: 10)
                
                Spacer()
                
                Image(profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: profileImageSize(), height: profileImageSize())
                    .offset(y: pushUpOffset())
                    .padding()
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
    
    private func interpolatedHeight() -> CGFloat {
        let startHeight: CGFloat = 110
        let endHeight: CGFloat = 95
        let transitionOffset: CGFloat = 35
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return endHeight + (startHeight - endHeight) * progress
    }
    
    private func sideIcon() -> CGFloat {
        let startSize: CGFloat = 15
        let endSize: CGFloat = 20
        let transitionOffset: CGFloat = 35
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return startSize + (endSize - startSize) * progress
    }
    
    private func profileImageSize() -> CGFloat {
        let startSize: CGFloat = 30
        let endSize: CGFloat = 40
        let transitionOffset: CGFloat = 35
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return startSize + (endSize - startSize) * progress
    }
    
    private func pushUpOffset() -> CGFloat {
        let startOffset: CGFloat = -30
        let endOffset: CGFloat = -40
        let transitionOffset: CGFloat = 50
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return startOffset + (endOffset - startOffset) * progress
    }
    
    private func interpolatedText() -> CGFloat {
        let startSize: CGFloat = 25
        let endSize: CGFloat = 20
        let transitionOffset: CGFloat = 50
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return startSize + (endSize - startSize) * progress
    }
    
    private func opacityView() -> CGFloat {
        let startOpacity: CGFloat = 0
        let endOpacity: CGFloat = 1
        let transitionOffset: CGFloat = 50
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return startOpacity + (endOpacity - startOpacity) * progress
    }
}

struct CustomNavView<Content: View>: View {
    var title: String
    var profileImage: String
    let content: Content
    
    @State private var scrollOffset: CGFloat = 0
    
    init(title: String, profileImage: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.profileImage = profileImage
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ScrollOffsetBackground { offset in
                    self.scrollOffset = offset - geo.safeAreaInsets.top
                }
                .frame(height: 0)
                
                content
                    .padding(.top, 100)
                    .ignoresSafeArea()
                    .safeAreaInset(edge: .top) {
                        Color.clear.frame(height: 40)
                            .overlay {
                                NavHeader(scrollOffset: scrollOffset, title: title, profileImage: profileImage)
                            }
                    }
            }
        }
    }
}

struct ScrollOffsetBackground: View {
    var onOffsetChange: (CGFloat) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ViewOffsetKey.self, value: geometry.frame(in: .global).minY)
                .onPreferenceChange(ViewOffsetKey.self, perform: onOffsetChange)
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// Preview
struct CustomNavView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView(title: "Title", profileImage: "profileImage") {
            VStack {
                ForEach(0..<100) { index in
                    Text("Item \(index)")
                        .padding()
                }
            }
        }
    }
}

