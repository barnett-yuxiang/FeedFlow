import Foundation

struct MockData {
    static let feeds = [
        Feed(title: "Swift News", url: URL(string: "https://example.com/swift")!, imageUrl: nil),
        Feed(title: "Apple Developer", url: URL(string: "https://example.com/apple")!, imageUrl: nil),
        Feed(title: "Tech Daily", url: URL(string: "https://example.com/tech")!, imageUrl: nil)
    ]

    static let articlesByFeed: [Feed: [Article]] = [
        feeds[0]: [ // Swift News articles
            Article(
                title: "What's new in Swift 5.8",
                description: "Explore the latest features in Swift 5.8",
                content: "Swift 5.8 brings exciting new features including improved type inference, better error messages, and enhanced performance...",
                publishDate: Date(),
                author: "John Doe",
                imageUrl: nil
            ),
            Article(
                title: "SwiftUI Tips and Tricks",
                description: "Learn advanced SwiftUI techniques",
                content: "Here are some powerful SwiftUI patterns that can help you build better apps...",
                publishDate: Date().addingTimeInterval(-86400),
                author: "Jane Smith",
                imageUrl: nil
            )
        ],
        feeds[1]: [ // Apple Developer articles
            Article(
                title: "WWDC24 Announced",
                description: "Apple's developer conference is coming soon",
                content: "Apple has announced the dates for WWDC24, bringing exciting new updates to iOS, macOS, and more...",
                publishDate: Date().addingTimeInterval(-2 * 86400),
                author: "Tim Cook",
                imageUrl: nil
            ),
            Article(
                title: "Xcode 15 Features",
                description: "Discover what's new in Xcode 15",
                content: "The latest version of Xcode brings improved performance, better code completion, and enhanced debugging tools...",
                publishDate: Date().addingTimeInterval(-3 * 86400),
                author: "Craig Federighi",
                imageUrl: nil
            )
        ],
        feeds[2]: [ // Tech Daily articles
            Article(
                title: "AI Breakthroughs 2024",
                description: "Latest developments in artificial intelligence",
                content: "Recent advances in AI are transforming how we approach software development...",
                publishDate: Date().addingTimeInterval(-4 * 86400),
                author: "Sarah Johnson",
                imageUrl: nil
            ),
            Article(
                title: "The Future of MacOS",
                description: "Predictions for the next major macOS release",
                content: "Industry experts share their insights on what we might see in the next version of macOS...",
                publishDate: Date().addingTimeInterval(-5 * 86400),
                author: "Mike Wilson",
                imageUrl: nil
            )
        ]
    ]

    static var articles: [Article] {
        articlesByFeed.values.flatMap { $0 }
    }

    static func articles(for feed: Feed) -> [Article] {
        articlesByFeed[feed] ?? []
    }
}
