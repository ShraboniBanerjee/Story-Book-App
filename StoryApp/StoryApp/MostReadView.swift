import SwiftUI

struct MostReadView: View {
    var vm = DataManager.shared
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack{
                ForEach( vm.mostreadBook,id:\.title) { book in
                    NavigationLink {
                        SelectedView(thebook: book)
                    } label: {
                        MostRead(thebook: book)
                    }
                    
                }
            }
        }
    }
    
    #Preview {
        HomeView()
        // MostReadView()
    }
    
    struct MostRead: View {
        var thebook:Book
        var body: some View {
            Image(thebook.imageName).resizable().scaledToFill()
                .frame(width: 120, height: 160)
                .clipShape(.rect(cornerRadius: 12))
                .overlay(alignment: .topTrailing){
                    HStack(spacing:2){
                        Image(systemName: "star.fill").foregroundStyle(.purple)
                        Text("\(thebook.rating,specifier: "%.1f")")
                            .foregroundStyle(.black)
                    }
                    .offset(x:-1)
                    .font(.system(size:8))
                    .frame(width:35, height: 15)
                    .background(.white,in:.rect(cornerRadius: 20))
                    .padding(6)
                }
            }
        }
    }
