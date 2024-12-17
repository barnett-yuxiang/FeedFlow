import SwiftUI

struct SidebarView: View {
    @Binding var selectedFeed: Feed?
    let feeds: [Feed]

    var body: some View {
        List(feeds, selection: $selectedFeed) { feed in
            Text(feed.title)
                .tag(feed) // Add this line to make items selectable
        }
    }
}
