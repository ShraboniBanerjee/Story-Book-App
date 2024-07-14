//
//  StoryView.swift
//  StoryApp
//
//  Created by Shraboni Banerjee on 14/07/24.
//

import SwiftUI

struct StoryView: View {
    var book:Book
    @Environment(\.dismiss) var dismiss
    var body: some View {
       ProgressTracker {
           Text(book.story)
                .safeAreaPadding(.top,50)
        }
        .overlay(alignment: .topLeading){
            Button(action: {
                withAnimation {
                    dismiss()
                }
            }, label: {
                Image(systemName: "chevron.left").bold()
                    .frame(width: 50,  height: 50)
                    .background(.ultraThinMaterial, in: Circle())
                    .offset(x: 24, y: -5)
            })
            .foregroundStyle(.primary)
        }
    }
}
