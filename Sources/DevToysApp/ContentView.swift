import SwiftUI

struct StandaloneContentView {
    @SceneStorage("selectedTool") private var tool: Tool?
}

extension StandaloneContentView: View {
    var body: some View {
        ContentView(tool: self.$tool)
    }
}

struct ContentView {
    @StateObject private var state = AppState()
    @State private var searchQuery = ""
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @Binding var tool: Tool?
}

extension ContentView: View {
    var body: some View {
        NavigationSplitView(columnVisibility: self.$columnVisibility) {
            Sidebar(state: self.state, selection: self.$tool, searchQuery: self.$searchQuery)
        } detail: {
            if let tool {
                tool.page(state: self.state)
            } else {
                AllToolsView(state: self.state, searchQuery: self.$searchQuery)
            }
        }
        .navigationSplitViewStyle(.balanced)
        .onContinueUserActivity("xyz.kebo.DevToysForiPad.newWindow") { activity in
            let payload = try? activity.typedPayload(NewWindowActivityPayload.self)
            self.tool = payload?.tool
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tool: .constant(nil))
            .previewPresets()
    }
}
