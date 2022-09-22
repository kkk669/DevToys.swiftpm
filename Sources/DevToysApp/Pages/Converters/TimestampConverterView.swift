import SwiftUI

struct TimestampConverterView {
    @Environment(\.horizontalSizeClass) private var hSizeClass
    @ObservedObject private var state: TimestampConverterViewState

    init(state: AppState) {
        self.state = state.timestampConverterViewState
    }
}

extension TimestampConverterView: View {
    var body: some View {
        ToyPage {
            if !self.state.timestampString.isEmpty
                && self.state.timestamp == nil
            {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.yellow)
                    Text("Invalid value")
                    Spacer()
                }
                .padding()
                .background(.yellow.opacity(0.2))
                .cornerRadius(8)
            }
            self.timestampSection
            DatePicker(
                self.hSizeClass == .compact ? "UTC" : "UTC Date and Time",
                selection: self.state.date,
                displayedComponents: [.date, .hourAndMinute]
            )
            .environment(\.timeZone, .init(identifier: "UTC")!)
            DatePicker(
                self.hSizeClass == .compact ? "Local" : "Local Date and Time",
                selection: self.state.date,
                displayedComponents: [.date, .hourAndMinute]
            )
        }
        .navigationTitle(Tool.timestampConverter.strings.localizedLongTitle)
    }

    private var timestampSection: some View {
        ToySection("Timestamp") {
            PasteButton(text: self.$state.timestampString)
            CopyButton(text: self.state.timestampString)
        } content: {
            HStack {
                TextField(
                    "Unix Timestamp",
                    text: self.$state.timestampString
                )
                .modifier(ClearButtonModifier(text: self.$state.timestampString))
                .keyboardType(.numberPad)
                .font(.body.monospacedDigit())
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                Stepper(
                    "",
                    value: .init(
                        get: { self.state.timestamp ?? 0 },
                        set: { self.state.timestampString = .init($0) }
                    )
                )
                .labelsHidden()
                .disabled(self.state.timestamp == nil)
                Button("Now", action: self.state.setNow)
                    .buttonStyle(.bordered)
                    .hoverEffect()
            }
        }
    }
}

struct TimestampConverterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimestampConverterView(state: .init())
        }
        .navigationViewStyle(.stack)
        .previewPresets()
    }
}
