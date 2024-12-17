import SwiftUI

@main
struct FeedFlowApp: App {
    @State private var selectedFeed: Feed?
    @State private var selectedArticle: Article?

    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView(selectedFeed: $selectedFeed, feeds: MockData.feeds)
                    .frame(minWidth: 200)
            } content: {
                ArticleListView(selectedArticle: $selectedArticle, articles: MockData.articles)
                    .frame(minWidth: 300)
            } detail: {
                if let article = selectedArticle {
                    ArticleDetailView(article: article)
                        .frame(minWidth: 400)
                } else {
                    Text("Select an article")
                }
            }
            .navigationTitle("FeedFlow")
        }
        .windowStyle(.titleBar)
        .windowResizability(.contentSize)
    }
}
