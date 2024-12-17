import SwiftUI
import AppKit

@main
struct FeedFlowApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @State private var selectedFeed: Feed? = MockData.feeds[0]
    @State private var selectedArticle: Article?

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
                    .onAppear {
                        AppLogger.shared.info("Sidebar view appeared")
                    }
            } content: {
                ArticleListView(selectedArticle: $selectedArticle, articles: currentArticles)
                    .frame(minWidth: 300)
            } detail: {
                if let article = selectedArticle {
                    ArticleDetailView(article: article)
                        .frame(minWidth: 400)
                        .onAppear {
                            AppLogger.shared.info("Showing article: \(article.title)")
                        }
                } else {
                    Text("Select an article")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationTitle("FeedFlow")
            .onAppear {
                AppLogger.shared.info("Application started")
            }
        }
        .windowStyle(.titleBar)
        .windowResizability(.contentSize)
        .onChange(of: scenePhase) { oldPhase, newPhase in
            switch newPhase {
            case .background:
                AppLogger.shared.info("Application entering background")
                selectedArticle = nil
                selectedFeed = nil
                DispatchQueue.main.async {
                    NSApplication.shared.terminate(nil)
                }
            default:
                break
            }
        }
    }
}
