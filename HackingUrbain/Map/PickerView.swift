import SwiftUI

struct PickerView: View {

    private enum PickerSelection: String, CaseIterable, Identifiable {
        case map = "Carte"
        case list = "Liste"
        case gallery = "Gallerie"

        var id: String { self.rawValue }
    }

    @State private var selectedView: PickerSelection = .map
    @State private var showPicker: Bool = true;

    var body: some View {
        VStack {
            // Affichage conditionnel du Picker
            if showPicker {
                Picker("", selection: $selectedView) {
                    ForEach(PickerSelection.allCases, id: \.self) { page in
                        Text(page.rawValue).tag(page)
                            .padding(.vertical, 10)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .cornerRadius(25)
                .padding(.top)
                .padding([.leading, .trailing], 50)
            }

            switch selectedView {
            case .map:
                MapView(showPicker: $showPicker)
            case .list:
                EventListView(showPicker: $showPicker)
            case .gallery:
                GalleryView()
            }
        }
    }
}

#Preview {
    PickerView()
}
