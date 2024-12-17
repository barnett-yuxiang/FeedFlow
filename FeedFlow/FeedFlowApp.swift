import SwiftUI

@main
struct FeedFlowApp: App {
    @State private var selectedFeed: Feed?
    @State private var selectedArticle: Article?

    // Add this computed property to filter articles based on selected feed
    private var currentArticles: [Article] {
        // For now, just return all articles since we're using mock data
        // In a real app, you would filter based on selectedFeed
        MockData.articles
    }

    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView(selectedFeed: $selectedFeed, feeds: MockData.feeds)
                    .frame(minWidth: 200)
            } content: {
                ArticleListView(selectedArticle: $selectedArticle, articles: currentArticles)
                    .frame(minWidth: 300)
            } detail: {
                if let article = selectedArticle {
                    ArticleDetailView(article: article)
                        .frame(minWidth: 400)
                } else {
                    Text("Select an article")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationTitle("FeedFlow")
        }
        .windowStyle(.titleBar)
        .windowResizability(.contentSize)
    }
}
