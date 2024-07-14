import SwiftUI

    struct HomeView: View {
        @State private var selectedTab: Tab = .all

        var body: some View {
            NavigationStack {
                CustomNavView(title: "From Your Library", profileImage: "profile") {
                    ScrollView {
                        VStack(spacing: 24) {
                            MostReadView()
                            segmentedControl(selectedTab: $selectedTab)
                            BookView(selectedTab: $selectedTab)
                        }
                    }
                }
            }
        }
    }

    #Preview {
        HomeView()
    }
