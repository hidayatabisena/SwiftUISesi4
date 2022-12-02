//
//  ArticleListView.swift
//  SwiftUISesi4
//
//  Created by Hidayat Abisena on 29/11/22.
//

import SwiftUI
import ActivityView
import CachedAsyncImage

struct ArticleListView: View {
    // MARK: - PROPERTIES
    @State var articles = dummyArticles.sorted { $0.title < $1.title }
    @State private var isLoading: Bool = true
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(articles) { article in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: Text("Title \(article.title)")) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        ArticleRow(article: article)
                        
                    } //: ZSTACK
                }
                .onDelete { indexSet in
                    articles.remove(atOffsets: indexSet)
                }
                .redacted(reason: isLoading ? .placeholder : [])
                .onAppear {
                    fetchData()
                }
                .listRowSeparator(.hidden)
                
            } //: LIST
            .refreshable {
                print("refresh content")
            }
            .listStyle(.plain)
            .navigationTitle("Browse")
            
        } //: NAVIGATION
    }
    
    // MARK: - FUNCTIONS

    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}

// MARK: - PREVIEW
struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}

// MARK: - SUBVIEW
struct ArticleRow: View {
    @State var article: Article
    @State private var item: ActivityItem?
   
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            let url = URL(string: article.imageURL)
            
            CachedAsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
                
            } placeholder: {
                Color.gray.opacity(0.1)
            }
            .frame(width: 120, height: 120)
            .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.system(.title3, design: .rounded))
                
                if article.isFavorite {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.yellow)
                        .padding(.vertical)
                        
                }
            } //: VSTACK
            
        } //: HSTACK
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button {
                
            } label: {
                Image(systemName: "pin")
            }
            .tint(.yellow)
            
            Button {
                
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            .tint(.indigo)
        }
        .contextMenu {
            Button {
                item = ActivityItem(items: "Article with title: \(article.title) will be shared!!!")
            } label: {
                HStack {
                    Text("Share articles")
                    Image(systemName: "square.and.arrow.up")
                }
            }
            
            Button {
                article.isFavorite.toggle()
            } label: {
                Text(article.isFavorite ? "Remove from favorite" : "Mark as favorite")
                Image(systemName: "heart") // TUGAS
            }
        }
        .activitySheet($item)
        
    }
}
