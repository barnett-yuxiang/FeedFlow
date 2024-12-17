import SwiftUI

struct ArticleDetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.largeTitle)

                if let author = article.author {
                    Text("By \(author)")
                        .font(.subheadline)
                }

                Text(article.publishDate, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(article.content)
                    .font(.body)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
