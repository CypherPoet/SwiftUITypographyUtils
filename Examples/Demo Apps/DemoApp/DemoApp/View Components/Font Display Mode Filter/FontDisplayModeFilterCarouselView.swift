// FontDisplayModeFilterCarouselView.swift
//
// Created by CypherPoet.
// ✌️
//
    
import SwiftUI
import SwiftUITypographyUtils


struct FontDisplayModeFilterCarouselView {
    
    @AppStorage(UserDefaults.CustomKeys.fontDisplayMode)
    private var fontDisplayMode: FontDisplayMode = .prometo

    @ScaledMetric(relativeTo: .body)
    private var baseFontSize: CGFloat = pointSize(for: .body)
    
    private var options: [FontDisplayMode] = [
        .prometo,
        .prometoHeadlineSoletoBody,
        .allianceNumberOne,
        .system,
    ]
    
    private let gridItems: [GridItem] = [
        .init(),
    ]
}


// MARK: - `View` Body
extension FontDisplayModeFilterCarouselView: View {

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems, alignment: .center, spacing: baseFontSize) {
                ForEach(options, id: \.self) { option in
                    FontDisplayModeFilterChipView(
                        fontDisplayMode: option,
                        isSelected: option == fontDisplayMode
                    )
                    .frame(
                        width: baseFontSize * 10,
                        height: baseFontSize * 6.67,
                        alignment: .center
                    )
                    .padding(.vertical, baseFontSize * 1.5)
                    .onTapGesture {
                        handleDisplayModeSelection(for: option)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}


// MARK: - Computeds
extension FontDisplayModeFilterCarouselView {
}


// MARK: - View Content Builders
extension FontDisplayModeFilterCarouselView {

    private var toolbarContent: some ToolbarContent {
        Group {
            ToolbarItem(placement: .automatic) {
            }
            ToolbarItem(placement: .automatic) {
            }
        }
    }
}


// MARK: - Private Helpers
extension FontDisplayModeFilterCarouselView {
    
    private func handleDisplayModeSelection(for selectedFontDisplayMode: FontDisplayMode) {
        fontDisplayMode = selectedFontDisplayMode
    }
}


#if DEBUG

// MARK: - Preview
struct FontDisplayModeFilterCarouselView_Previews: PreviewProvider {

    static var previews: some View {
        FontDisplayModeFilterCarouselView()
    }
}

#endif


