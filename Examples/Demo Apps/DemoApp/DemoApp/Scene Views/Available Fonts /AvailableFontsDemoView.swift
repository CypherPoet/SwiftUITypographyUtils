// AvailableFontsDemoView.swift
//
// Created by CypherPoet.
// ✌️
//
    
import SwiftUI


struct AvailableFontsDemoView {
}


// MARK: - `View` Body
extension AvailableFontsDemoView: View {

    var body: some View {
        List(availableFontFamilyNames, id: \.self) { fontFamily in
            Text(fontFamily)
        }
    }
}


// MARK: - Computeds
extension AvailableFontsDemoView {

    #if os(iOS)
    
    var availableFontFamilies: [String] {
        UIFont.familyNames
    }
    
    var availableFontFamilyNames: [String] {
        availableFontFamilies.flatMap {
            UIFont.fontNames(forFamilyName: $0)
        }
    }
                                  
    
    #elseif os(macOS)
    
    var availableFontFamilies: [String] {
        NSFontManager.shared.availableFontFamilies
    }
    
    var availableFontFamilyNames: [String] {
        NSFontManager.shared.availableFonts
    }
    
    #endif
}


// MARK: - View Content Builders
extension AvailableFontsDemoView {

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
extension AvailableFontsDemoView {
}


#if DEBUG

// MARK: - Preview
struct AvailableFontsDemoView_Previews: PreviewProvider {

    static var previews: some View {
        AvailableFontsDemoView()
    }
}

#endif
