import SwiftUI

struct SidebarView: View {
    @Binding var selectedFeed: Feed?
    let feeds: [Feed]

    var body: some View {
        List(feeds, selection: $selectedFeed) { feed in
            HStack {
                Image(systemName: "newspaper.fill")
                    .foregroundColor(.accentColor)
                Text(feed.title)
            }
            .tag(feed)
        }
        .listStyle(SidebarListStyle()) // 使用系统侧边栏样式
    }
}
