//
//  GalleryView.swift
//  SwiftUISesi4
//
//  Created by Hidayat Abisena on 06/12/22.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    var articles = dummyArticles
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - SLIDER
                Slider(value: $gridColumn, in: 2...5, step: 1)
                        .padding(.horizontal)
                        .onChange(of: gridColumn, perform: { value in
                                withAnimation(.easeIn) {
                                        gridSwitch()
                        }
                })
                
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(articles) { article in
                        let url = URL(string: article.imageURL)
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
                            
                        } placeholder: {
                            Color.gray.opacity(0.1)
                        }
                    } //: LOOP
                    .onAppear {
                        gridSwitch()
                    }
                    
                } //: GRID
                
            } //: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: SCROLL
    }
    
    // MARK: - FUNCTION
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
}

// MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
