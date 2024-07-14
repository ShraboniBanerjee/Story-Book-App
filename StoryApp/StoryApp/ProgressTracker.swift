import SwiftUI

struct ProgressTracker<Content: View>: View {
    @State private var scrollOffset: CGFloat = 0
    @State private var contentHeight: CGFloat = 0
    var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            GeometryReader { fullView in
                ZStack(alignment: .top) {
                    ScrollView {
                        GeometryReader { scrollViewGeo in
                            Color.clear
                                .preference(key: ScrollingOffsetKey.self, value: scrollViewGeo.frame(in: .global).minY)
                        }
                        .frame(height: 0)
                        .id(0)
                        
                        VStack {
                            content
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(GeometryReader { contentGeo in
                            Color.clear.preference(key: ContentHeightPreferenceKey.self, value: contentGeo.size.height)
                        })
                    }
                    .scrollIndicators(.hidden)
                    .onPreferenceChange(ScrollingOffsetKey.self) { value in
                        self.scrollOffset = value - fullView.safeAreaInsets.top
                    }
                    .onPreferenceChange(ContentHeightPreferenceKey.self) { value in
                        self.contentHeight = value
                    }
                    
                    progressView(fullView: fullView, scrollProxy: scrollProxy)
                }
            }
        }
    }
    
    func progressView(fullView: GeometryProxy, scrollProxy: ScrollViewProxy) -> some View {
        let progress = min(max(0, -scrollOffset / (contentHeight - fullView.size.height)), 1)
        let progressPercentage = Int(progress * 100)
        
        return ZStack {
            Group {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 250, height: 50)
                        .foregroundColor(.black)
                    
                    HStack {
                        Text("\(progressPercentage)%").bold()
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.black.opacity(0.5))

                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 150 * progress, height: 8)
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                            .opacity(progressPercentage > 0 && progressPercentage < 100 ? 0.8 : 0)
                            .animation(.easeInOut, value: progressPercentage)
                    }
                    .opacity(progressPercentage > 0 ? 1 : 0)
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            scrollProxy.scrollTo(0, anchor: .top)
                        }
                    }, label: {
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 55, height: 55)
                            .offset(y: progressPercentage == 100 ? 0 : 100)
                            .animation(.easeInOut, value: progressPercentage)
                    })
                }
                .mask(
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: progressPercentage > 0 && progressPercentage < 100 ? 250 : 55, height: 55)
                        .animation(.easeInOut, value: progressPercentage)
                )
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct ScrollingOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ContentHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct ProgressTracker_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTracker {
            VStack {
                ForEach(0..<100) { index in
                    Text("Item \(index)")
                        .padding()
                }
            }
        }
    }
}


