import Foundation

struct Feed: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let url: URL
    let imageUrl: URL?

    // Add Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Feed, rhs: Feed) -> Bool {
        lhs.id == rhs.id
    }
}
