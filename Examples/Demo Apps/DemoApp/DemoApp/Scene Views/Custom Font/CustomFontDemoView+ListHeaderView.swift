// CustomFontDemoView+ListHeaderView.swift
//
// Created by CypherPoet.
// ✌️
//
    
import SwiftUI
import SwiftUITypographyUtils


extension CustomFontDemoView {
    
    struct ListHeaderView {
        var title: String

        @AppStorage(UserDefaults.CustomKeys.fontDisplayMode)
        private var fontDisplayMode: FontDisplayMode = .prometo
        
        @ScaledMetric(relativeTo: .body)
        private var baseFontSize: CGFloat = pointSize(for: .body)
    }
}

extension CustomFontDemoView.ListHeaderView: View {
    
    var body: some View {
        Text(title)
            .customFont(
                fontDisplayMode.customTitle3Font,
                forTextStyle: .title3
            )
            .padding(.vertical, baseFontSize * 0.4)
    }
}
