//
//  SelectedView.swift
//  StoryApp
//
//  Created by Shraboni Banerjee on 14/07/24.
//

import SwiftUI

struct SelectedView: View {
    var thebook:Book
    @State var showtheStory = false
    var body: some View {
        CustomNavLinkView(title: thebook.title){
            ZStack{
                GeometryReader(content: { geometry in
                    Image(thebook.imageName).resizable().scaledToFill()
                        .frame(width:geometry.size.width, height:
                                geometry.size.height)
                })
                VStack(alignment:.leading,spacing: 24){
                    Text(thebook.title).font(.title).bold()
                        .foregroundStyle(.white)
                    HStack{
                        Text("Amazon Kindle")
                        line()
                        Text("Publish July 12, 2024")
                    }
                  
                    HStack{
                        VStack(alignment:.leading, spacing:15){
                            Text("READS").foregroundStyle(.secondary)
                            Text("2.4M").bold()
                        }
                        Spacer()
                        VStack(alignment:.leading, spacing: 15){
                            Text("LIKES").foregroundStyle(.secondary)
                            Text("14.3K").bold()
                        }
                        Spacer()
                        line()
                        VStack(alignment:.leading, spacing: 15){
                            Text("PAGES").foregroundStyle(.secondary)
                            Text("60").bold()
                        }
                        
                    }
                    Text("About \(thebook.title)").font(.title).bold()
                        .foregroundStyle(.white)
                    Text(thebook.description)
                        .foregroundStyle(.secondary)
                        .lineLimit(20)
                    
                }
                .padding()
                .padding(.vertical,20)
                .padding(.bottom,60)
                .background(.ultraThinMaterial)
                .frame(maxHeight: .infinity,alignment: .bottom)
                .overlay(alignment: .bottom) {
                    Button(action: {
                        withAnimation{
                            showtheStory.toggle()
                        }
                    }, label: {
                        Text("Start Reading").bold()
                            .frame(width: 250, height: 50)
                            .background(.white,in: .capsule)
                            .foregroundStyle(.black)
                    })
                    .padding(.bottom, 25)
                }
            }
            .fullScreenCover(isPresented: $showtheStory, content: {
                StoryView(book: thebook)
            })
           
        } action: {
            //
        }
        .ignoresSafeArea()
     
    }
}

 #Preview {
     SelectedView(thebook: Book(title:"bookname", imageName:"03", rating: 4.5, description:"description", story: ""))
 }
struct line: View {
    var body: some View {
        Rectangle()
            .frame(width:1, height:35)
    }
}

