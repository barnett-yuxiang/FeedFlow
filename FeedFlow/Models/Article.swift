import Foundation

struct Article: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let content: String
    let publishDate: Date
    let author: String?
    let imageUrl: URL?

    // Add Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.id == rhs.id
    }
}
