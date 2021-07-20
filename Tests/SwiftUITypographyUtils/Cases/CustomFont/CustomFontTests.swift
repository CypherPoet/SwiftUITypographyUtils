import XCTest
import SwiftUI
@testable import SwiftUITypographyUtils


class CustomFontTests: XCTestCase {
    private typealias SystemUnderTest = CustomFont

    private var sut: SystemUnderTest!
    private var settingsFileName: String?
    private var bundle: Bundle!
}


// MARK: - Lifecycle
extension CustomFontTests {

    override func setUpWithError() throws {
        // Put setup code here.
        // This method is called before the invocation of each
        // test method in the class.
        try super.setUpWithError()


        bundle = .module
        
        #if os(macOS)
        _ = NSFont.registerFont(bundle: bundle, fontName: "Phosphate-Inline", fontExtension: "ttc")
        #else
        _ = UIFont.registerFont(bundle: bundle, fontName: "Phosphate-Inline", fontExtension: "ttc")
        #endif
        
        sut = try makeSUT()
    }


    override func tearDownWithError() throws {
        // Put teardown code here.
        // This method is called after the invocation of each
        // test method in the class.
        sut = nil
        bundle = nil
        
        try super.tearDownWithError()
    }
}


// MARK: - Factories
extension CustomFontTests {

    /// Initializes an instance of the System Under test by using properties of the test class
    /// as its initializer arguments;
    private func makeSUT() throws -> SystemUnderTest {
        try .init(
            settingsFileName: settingsFileName,
            bundle: bundle
        )
    }

    /// Helper to make the system under test from any default initializer
    /// and then test its initial conditions
    private func makeSUTFromDefaults() -> SystemUnderTest {
        try .init()
    }
}


// MARK: - "Given" Helpers (Conditions Exist)
extension CustomFontTests {

    private func givenSomething() {
        // some state or condition is established
    }
}


// MARK: - "When" Helpers (Actions Are Performed)
extension CustomFontTests {

    private func whenSomethingHappens() {
        // perform some action
    }
}


// MARK: - Test Initial Conditions From Default Initialization
extension CustomFontTests {

    func test_Init_WithDefaultProperties_SetsStyleDictionaryToNil() throws {
        XCTAssertNil(sut.styleDictionary)
    }
}


// MARK: - Test - Initialization Error Handling
extension CustomFontTests {

    func test_Init_GivenMissingSettingsFileName_ThrowsSettingsFileNotFoundError() throws {
        settingsFileName = CustomFont.SettingsFileNames.missingFile
  
        XCTAssertThrowsError(try makeSUT()) { error in
            let customFontError = try! XCTUnwrap(
                error as? CustomFont.Error,
                "Unexpected error type: \(error)"
            )

            switch customFontError {
            case .settingsFileNotFound:
                break
            default:
                XCTFail("Unexpected CustomFont error: \(customFontError)")
            }
        }
    }
    
    
    func test_Init_GivenInvalidSettingsFileFormat_ThrowsFileDecodingError() throws {
        settingsFileName = CustomFont.SettingsFileNames.invalidFormat
  
        XCTAssertThrowsError(try makeSUT()) { error in
            let customFontError = try! XCTUnwrap(
                error as? CustomFont.Error,
                "Unexpected error type: \(error)"
            )

            switch customFontError {
            case .settingsFileDecodingFailed:
                break
            default:
                XCTFail("Unexpected CustomFont error: \(customFontError)")
            }
        }
    }
    
}

// MARK: - Test Initializing with Custom Arguments
extension CustomFontTests {

    func test_Init_GivenValidSettingsFileName_MakesStyleDictionaryFromSettings() throws {
        settingsFileName = CustomFont.SettingsFileNames.phosphateInline
        
        sut = try makeSUT()
        
        let styleDictionary = try XCTUnwrap(sut.styleDictionary)
        
        XCTAssertNotNil(styleDictionary[CustomFont.StyleKey.largeTitle.rawValue]?.fontName, "PhosphateInline")
    }
}


#if canImport(UIKit)

// MARK: - Test - scaledUIFontForTextStyle
extension CustomFontTests {
    
    func test_scaledUIFontForTextStyle_GivenUIFontTextStyle_WhenUsingABuiltInFontThatHasAStyleDictionary_GetsPreferredFontForCustomFontTextStyle() throws {
        settingsFileName = CustomFont.SettingsFileNames.futura
        
        sut = try makeSUT()
        
        let uiFont = sut.scaledUIFont(forTextStyle: .largeTitle)
        
        XCTAssertEqual(uiFont.familyName, "Futura")
        XCTAssertEqual(uiFont.pointSize, 34)
    }
    
    
    func test_scaledUIFontForTextStyle_GivenUIFontTextStyle_WhenUsingAnAddedFontThatHasAStyleDictionary_GetsPreferredFontForCustomFontTextStyle() throws {
        settingsFileName = CustomFont.SettingsFileNames.phosphateInline
        
        sut = try makeSUT()
        
        let uiFont = sut.scaledUIFont(forTextStyle: .largeTitle)
        
        XCTAssertEqual(uiFont.familyName, "Phosphate")
        XCTAssertEqual(uiFont.pointSize, 34)
    }
    
    
    func test_scaledUIFontForTextStyle_GivenUIFontTextStyle_WhenFontIsUnregistered_GetsPreferredSystemFontForTextStyle() throws {
        settingsFileName = CustomFont.SettingsFileNames.unregistered
        
        sut = try makeSUT()
        
        let uiFont = sut.scaledUIFont(forTextStyle: .largeTitle)
        
        XCTAssertEqual(uiFont.familyName, ".AppleSystemUIFont")
        XCTAssertEqual(uiFont.pointSize, 34)
    }
}


#elseif canImport(AppKit)

// MARK: - Test - nsFontForTextStyle
extension CustomFontTests {
    
    func test_nsFontForTextStyle_GivenNSFontTextStyle_WhenUsingABuiltInFontThatHasAStyleDictionary_GetsPreferredFontForCustomFontTextStyle() throws {
        settingsFileName = CustomFont.SettingsFileNames.futura
        
        sut = try makeSUT()
        
        let nsFont = sut.nsFont(forTextStyle: .largeTitle)
        
        XCTAssertEqual(nsFont.familyName, "Futura")
        XCTAssertEqual(nsFont.pointSize, 34)
    }
    
    
    func test_nsFontForTextStyle_GivenNSFontTextStyle_WhenUsingAnAddedFontThatHasAStyleDictionary_GetsPreferredFontForCustomFontTextStyle() throws {
        settingsFileName = CustomFont.SettingsFileNames.phosphateInline
        
        sut = try makeSUT()
        
        let nsFont = sut.nsFont(forTextStyle: .largeTitle)
        
        XCTAssertEqual(nsFont.familyName, "Phosphate")
        XCTAssertEqual(nsFont.pointSize, 34)
    }
}

#endif
