import SwiftUI


/// A custom font that supports dynamic type
/// text styles.
public struct CustomFont {
    internal typealias StyleDictionary = [StyleKey.RawValue: FontDescription]
    
    internal var styleDictionary: StyleDictionary?
}


// MARK: -  Public Static Instances
extension CustomFont {
    // TODO: Remove this?
    public static let `default` = CustomFont()
}


extension CustomFont {
    
    internal struct FontDescription: Decodable {
        let fontSize: CGFloat
        let fontName: String
    }
    
    
    /// Create a ``CustomFont`` instance.
    ///
    /// - Parameters:
    ///   - settingsFileName: Name of the Property List file (without the extension) that contains the style dictionary used to scale fonts for each
    ///   text style.
    ///   - bundle: The `Bundle` containing the `settingsFileName`.
    ///     - Default: `Bundle.main`.
    ///
    /// - Throws: ``CustomFont/Error``
    public init(
        settingsFileName: String? = nil,
        bundle: Bundle = .main
    ) throws {
        guard let settingsFileName = settingsFileName else { return }
        
        guard let url = bundle.url(
            forResource: settingsFileName,
            withExtension: "plist"
        ) else {
            throw Error.settingsFileNotFound
        }

        let data = try loadSettings(inFileAt: url)
        
        do {
            styleDictionary = try PropertyListDecoder().decode(
                StyleDictionary.self,
                from: data
            )
        } catch let error as DecodingError {
            throw Error.settingsFileDecodingFailed(error)
        } catch let error {
            throw error
        }
    }
}


extension CustomFont {
    
    private func loadSettings(inFileAt url: URL) throws -> Data {
        do {
            return try Data(contentsOf: url)
        } catch {
            throw Error.dataLoadingFailed(error)
        }
    }
}


extension CustomFont {
    
    /// Get the scaled font for the given text style using the
    /// style dictionary supplied at initialization.
    ///
    /// - Parameter textStyle: The `Font.TextStyle` for the
    ///   font.
    /// - Returns: A `Font` of the custom font that has been
    ///   scaled for the users currently selected preferred
    ///   text size.
    ///
    /// > Note: If the style dictionary does not have a font for this text style, the default system font is returned.
    internal func scaledFont(forTextStyle textStyle: Font.TextStyle) -> Font {
        guard
            let styleKey = StyleKey(textStyle),
            let fontDescription = styleDictionary?[styleKey.rawValue]
        else {
            return Font.system(textStyle)
        }
        
        return Font.custom(
            fontDescription.fontName,
            size: fontDescription.fontSize,
            relativeTo: textStyle
        )
    }
}
