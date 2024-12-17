import Foundation

struct MockData {
    static let feeds = [
        Feed(title: "Swift News", url: URL(string: "https://example.com/swift")!, imageUrl: nil),
        Feed(title: "Apple Developer", url: URL(string: "https://example.com/apple")!, imageUrl: nil),
        Feed(title: "Tech Daily", url: URL(string: "https://example.com/tech")!, imageUrl: nil)
    ]

    static let articles = [
        Article(
            title: "What's new in Swift 5.8",
            description: "Explore the latest features in Swift 5.8",
            content: "Swift 5.8 brings exciting new features including...",
            publishDate: Date(),
            author: "John Doe",
            imageUrl: nil
        ),
        Article(
            title: "SwiftUI Tips and Tricks",
            description: "Learn advanced SwiftUI techniques",
            content: "Here are some powerful SwiftUI patterns...",
            publishDate: Date().addingTimeInterval(-86400),
            author: "Jane Smith",
            imageUrl: nil
        )
    ]
}
