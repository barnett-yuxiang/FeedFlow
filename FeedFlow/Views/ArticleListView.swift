import SwiftUI

struct ArticleListView: View {
    @Binding var selectedArticle: Article?
    let articles: [Article]

    var body: some View {
        List(articles, selection: $selectedArticle) { article in
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title)
                    .font(.headline)
                Text(article.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(article.publishDate, style: .date)
                    .font(.caption)
            }
            .padding(.vertical, 4)
            .tag(article) // Add this line to make items selectable
        }
    }
}
