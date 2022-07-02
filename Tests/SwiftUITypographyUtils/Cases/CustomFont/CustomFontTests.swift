import XCTest
@testable import SwiftUITypographyUtils


final class CustomFontTests: XCTestCase {
    internal typealias SystemUnderTest = CustomFont

    internal var sut: SystemUnderTest!
    internal var settingsFileName: String?
    internal var bundle: Bundle!
}


// MARK: - Lifecycle
extension CustomFontTests {

    override func setUp() async throws {
        try await super.setUp()

        bundle = .module
    }


    override func tearDown() async throws {
        try await super.tearDown()
        
        sut = nil
        settingsFileName = nil
        bundle = nil
    }
}


// MARK: - Factories
extension CustomFontTests {

    internal func makeSUT() throws -> SystemUnderTest {
        // 💡 Pass in arguments by using current
        // properties of the test class instance.
        
        try .init(
            settingsFileName: settingsFileName,
            bundle: bundle
        )
    }

    /// Helper to make the system under test from any default initializer
    /// and then test its initial conditions
    internal func makeSUTFromDefaults() -> SystemUnderTest {
        .init()
    }
}


// MARK: - "Given" Helpers (Conditions Exist)
extension CustomFontTests {

    internal func givenCustomFontIsAddedToApplication() {
        #if os(macOS)
        _ = NSFont.registerFont(bundle: bundle, fontName: "Phosphate-Inline", fontExtension: "ttc")
        #else
        _ = UIFont.registerFont(bundle: bundle, fontName: "Phosphate-Inline", fontExtension: "ttc")
        #endif
    }
}


// MARK: - "When" Helpers (Actions Are Performed)
extension CustomFontTests {

    internal func whenSomethingHappens() {
        // perform some action
    }
}


// MARK: - Test - Init with Default Properties
extension CustomFontTests {

    func test_Init_WithDefaultProperties_SuccessfullyInitializes() throws {
        sut = makeSUTFromDefaults()
        
        XCTAssertNotNil(sut)
    }
}


// MARK: - Test Initializing with Custom Arguments
extension CustomFontTests {

    func test_Init_WhenSettingsFileNameIsValid_ItMakesStyleDictionaryFromSettings() throws {
        settingsFileName = SettingsFileNames.phosphateInline
        
        sut = try makeSUT()
        
        let styleDictionary = try XCTUnwrap(sut.styleDictionary)
        
        XCTAssertNotNil(
            styleDictionary[CustomFont.StyleKey.largeTitle.rawValue]?.fontName,
            "PhosphateInline"
        )
    }
}

// MARK: - Test - Initialization Error Handling
extension CustomFontTests {

    func test_Init_WhenSettingsFileNameIsMissing_ItThrowsSettingsFileNotFoundError() throws {
        settingsFileName = SettingsFileNames.missingFile
  
        do {
            sut = try makeSUT()
            XCTFail("Error should be thrown before reaching this line")
        } catch let error as SystemUnderTest.Error {
            guard case .settingsFileNotFound = error else {
                XCTFail("Unknown Error was thrown")
                return
            }
        } catch {
            XCTFail("Unknown Error was thrown")
        }
    }
    
    
    func test_Init_WhenSettingsFileHasInvalidFormat_ItThrowsInvalidFormatError() throws {
        settingsFileName = SettingsFileNames.invalidFormat
        
        do {
            sut = try makeSUT()
            XCTFail("Error should be thrown before reaching this line")
        } catch let error as SystemUnderTest.Error {
            guard
                case .settingsFileDecodingFailed(let decodingError) = error,
                case .keyNotFound(let codingKey, _) = decodingError
            else {
                XCTFail("Unknown Error was thrown")
                return
            }

            XCTAssertEqual(codingKey.stringValue, "fontName")
        } catch {
            XCTFail("Unknown Error was thrown")
        }
    }
}

