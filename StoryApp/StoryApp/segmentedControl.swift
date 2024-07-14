//
//  segmentedControl.swift
//  StoryApp
//
//  Created by Shraboni Banerjee on 14/07/24.
//

import SwiftUI

struct segmentedControl: View {
    @Binding var selectedTab:Tab
    @State var textWidth: CGFloat = 0
    @State var textWidths: [CGFloat] = Array(repeating: 0, count: Tab.allCases.count)
    @State var indexint: CGFloat = 0
    @State var hstackwidth:CGFloat = 0
    var body: some View {
        ScrollViewReader(content: { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:30){
                    ForEach(Tab.allCases.indices,id:\.self) { index in
                        let tab = Tab.allCases[index]
                        Text(tab.rawValue).font(.callout)
                            .background(
                                GeometryReader(content: { textGeowidth -> Color in
                                    DispatchQueue.main.async{
                                        textWidths[index] = textGeowidth.size.width
                                    }
                                    return Color.clear
                                })
                            )
                            .id(index)
                            .frame(width: 70, alignment: .leading)
                            .padding(.vertical,10)
                            .foregroundStyle(selectedTab == tab ? .primary : .secondary)
                            .onTapGesture {
                                withAnimation{
                                    indexint = CGFloat(index)
                                    textWidth = textWidths[index]
                                    selectedTab = tab
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                    withAnimation{
                                        proxy.scrollTo(index,anchor:.center)
                                    }
                                }
                            }
                    }
                }
                
                .background(
                    GeometryReader(content: { geometry in
                        Capsule()
                            .foregroundStyle(.gray.opacity(0.3))
                            .frame(width: textWidth + 30)
                            .offset(x: indexint * 100)
                            .offset(x: -15)
                    })
                )
                .padding(.horizontal,16)
                
            }
            .onAppear(){
                if textWidth == 0{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){
                        textWidth = textWidths[0]
                    }
                }
            }
        })
        
      
    }
}

//#Preview {
  //  segmentedControl()
//}
enum Tab:String,CaseIterable{
    case all = "all"
    case fiction = "fiction"
    case  mystery = "mystery"
    case romance = "romance"
    case action = "action"
    case comedy = "comedy"
}
