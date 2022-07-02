#if canImport(UIKit)

import XCTest
@testable import SwiftUITypographyUtils


// MARK: - Test - scaledUIFontForTextStyle
extension CustomFontTests {
    
    func test_scaledUIFontForTextStyle_WhenUsingABuiltInFontThatHasAStyleDictionary_GetsPreferredFontForCustomFontTextStyle() throws {
        settingsFileName = SettingsFileNames.futura
        
        sut = try makeSUT()
        
        let uiFont = sut.scaledUIFont(forTextStyle: .largeTitle)
        
        XCTAssertEqual(uiFont.familyName, "Futura")
        XCTAssertEqual(uiFont.pointSize, 34)
    }
    
    
    func test_scaledUIFontForTextStyle_WhenUsingAnAddedFontThatHasAStyleDictionary_GetsPreferredFontForCustomFontTextStyle() throws {
        givenCustomFontIsAddedToApplication()
        
        settingsFileName = SettingsFileNames.phosphateInline
        
        sut = try makeSUT()
        
        let uiFont = sut.scaledUIFont(forTextStyle: .largeTitle)
        
        XCTAssertEqual(uiFont.familyName, "Phosphate")
        XCTAssertEqual(uiFont.pointSize, 34)
    }
    
    
    func test_scaledUIFontForTextStyle_WhenFontIsUnregistered_GetsPreferredSystemFontForTextStyle() throws {
        settingsFileName = SettingsFileNames.unregistered
        
        sut = try makeSUT()
        
        let uiFont = sut.scaledUIFont(forTextStyle: .largeTitle)
        
        XCTAssertEqual(uiFont.familyName, ".AppleSystemUIFont")
        XCTAssertEqual(uiFont.pointSize, 34)
    }
}

#endif
