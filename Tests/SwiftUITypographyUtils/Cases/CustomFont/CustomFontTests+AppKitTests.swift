#if canImport(AppKit)

import XCTest
@testable import SwiftUITypographyUtils



// MARK: - Test - nsFontForTextStyle
extension CustomFontTests {
    
    func test_nsFontForTextStyle_WhenUsingABuiltInFontThatHasAStyleDictionary_GetsPreferredFontForCustomFontTextStyle() throws {
        settingsFileName = SettingsFileNames.futura
        
        sut = try makeSUT()
        
        let nsFont = sut.nsFont(forTextStyle: .largeTitle)
        
        XCTAssertEqual(nsFont.familyName, "Futura")
        XCTAssertEqual(nsFont.pointSize, 34)
    }
    
    
    func test_nsFontForTextStyle_WhenUsingAnAddedFontThatHasAStyleDictionary_GetsPreferredFontForCustomFontTextStyle() throws {
        settingsFileName = SettingsFileNames.phosphateInline
        
        sut = try makeSUT()
        
        let nsFont = sut.nsFont(forTextStyle: .largeTitle)
        
        XCTAssertEqual(nsFont.familyName, "Phosphate")
        XCTAssertEqual(nsFont.pointSize, 34)
    }
}

#endif
