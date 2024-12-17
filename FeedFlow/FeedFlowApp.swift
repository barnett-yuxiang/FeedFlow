import SwiftUI

@main
struct FeedFlowApp: App {
    // Initialize selectedFeed with Swift News
    @State private var selectedFeed: Feed? = MockData.feeds[0]
    @State private var selectedArticle: Article?

    // Add this computed property to filter articles based on selected feed
    private var currentArticles: [Article] {
        if let selectedFeed = selectedFeed {
            return MockData.articles(for: selectedFeed)
        }
        return MockData.articles
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
