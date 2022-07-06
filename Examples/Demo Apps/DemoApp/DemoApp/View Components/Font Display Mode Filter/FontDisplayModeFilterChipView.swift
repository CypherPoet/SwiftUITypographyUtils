// FontDisplayModeFilterChipView.swift
//
// Created by CypherPoet.
// ✌️
//
    
import SwiftUI


struct FontDisplayModeFilterChipView {
    var fontDisplayMode: FontDisplayMode
    var isSelected: Bool = false
}


// MARK: - `View` Body
extension FontDisplayModeFilterChipView: View {

    var body: some View {
        VStack {
            Text(fontDisplayMode.titleForDisplay)
                .multilineTextAlignment(.center)
                .customFont(
                    fontDisplayMode.customHeadlineFont,
                    forTextStyle: .headline
                )
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.primary)
                .opacity(isSelected ? 1.0 : 0.42)
                .foregroundStyle(.ultraThinMaterial)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            chipSurfaceBackground
                .opacity(isSelected ? 1.0 : 0.42)
                .animation(.easeInOut, value: isSelected)
        )
        .background(
            chipSurfaceBackground
                .blur(radius: 12)
                .opacity(isSelected ? 1 : 0.0)
                .animation(.easeInOut, value: isSelected)
        )
        .shadow(radius: 12)
    }
}


// MARK: - Computeds
extension FontDisplayModeFilterChipView {
    
    private var chipBackgroundGradient: LinearGradient {
        let baseGradients: [LinearGradient] = [
            LinearGradient(
                colors: [
                   Color(#colorLiteral(red: 1, green: 0.06096037477, blue: 0, alpha: 1)),
                   .purple,
                   Color(#colorLiteral(red: 0, green: 0.7420347929, blue: 0.9670774341, alpha: 1)),
                   Color(#colorLiteral(red: 0, green: 0.9617295861, blue: 0.6524415612, alpha: 1)),
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
        ]

        return baseGradients.randomElement()!
    }
}


// MARK: - View Content Builders
extension FontDisplayModeFilterChipView {
    
    private var chipSurfaceBackground: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(chipBackgroundGradient)
    }
}


// MARK: - Private Helpers
extension FontDisplayModeFilterChipView {
}


#if DEBUG

// MARK: - Preview
struct FontDisplayModeFilterChipView_Previews: PreviewProvider {

    static var previews: some View {
        VStack(spacing: 42.0) {
            FontDisplayModeFilterChipView(
                fontDisplayMode: .prometo,
                isSelected: false
            )
            .frame(
                width: 120,
                height: 60,
                alignment: .center
            )

        
            FontDisplayModeFilterChipView(
                fontDisplayMode: .prometoHeadlineSoletoBody,
                isSelected: true
            )
            .frame(
                width: 120,
                height: 60,
                alignment: .center
            )
        }
        .padding()
    }
}

#endif
