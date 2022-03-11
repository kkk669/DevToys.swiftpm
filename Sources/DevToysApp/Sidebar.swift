import SwiftUI

struct Sidebar {}

extension Sidebar: View {
    var body: some View {
        List {
            Section {
                NavigationLink {
                    JSONYAMLConverterView()
                } label: {
                    Label("JSON <> YAML", systemImage: "doc.plaintext")
                }
                NavigationLink {
                    NumberBaseConverterView()
                } label: {
                    Label("Number Base", systemImage: "number.square")
                }
            } header: {
                Label("Converters", systemImage: "arrow.triangle.2.circlepath")
            }
            Section {
                NavigationLink {
                    URLEncoderDecoderView()
                } label: {
                    Label("URL", systemImage: "link")
                }
                NavigationLink {
                    Base64EncoderDecoderView()
                } label: {
                    Label("Base 64", systemImage: "b.square")
                }
            } header: {
                Label("Encoders / Decoders", systemImage: "01.square")
            }
            Section {
                NavigationLink {
                    JSONFormatterView()
                } label: {
                    Label("JSON", systemImage: "curlybraces")
                }
            } header: {
                Label("Formatters", systemImage: "increase.indent")
            }
            Section {
                NavigationLink {
                    HashGeneratorView()
                } label: {
                    Label("Hash", systemImage: "number")
                }
                NavigationLink {
                    UUIDGeneratorView()
                } label: {
                    Label("UUID", systemImage: "01.square")
                }
            } header: {
                Label("Generators", systemImage: "plus.square")
            }
            Section {
            } header: {
                Label("Text", systemImage: "textformat")
            }
            Section {
            } header: {
                Label("Graphic", systemImage: "photo.on.rectangle.angled")
            }
        }
        .navigationTitle("DevToys")
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
