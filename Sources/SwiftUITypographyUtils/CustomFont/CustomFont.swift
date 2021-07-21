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
    
    internal enum StyleKey: String, Decodable {
        case largeTitle
        case title
        case title2
        case title3
        case headline
        case subheadline
        case body
        case callout
        case footnote
        case caption
        case caption2
    }
    
    
    internal struct FontDescription: Decodable {
        let fontSize: CGFloat
        let fontName: String
    }
    
    /// Create a ``CustomFont`` instance.
    /// - Parameters:
    ///   - settingsFileName: Name of the Property List file (without the extension) that contains the style dictionary used to scale fonts for each
    ///   text style.
    ///   - bundle: The `Bundle` containing the `settingsFileName`.
    ///     - Default: `Bundle.main`.
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


extension CustomFont.StyleKey {

    internal init?(_ textStyle: Font.TextStyle) {
        switch textStyle {
        case .largeTitle:
            self = .largeTitle
        case .title:
            self = .title
        case .title2:
            self = .title2
        case .title3:
            self = .title3
        case .headline:
            self = .headline
        case .subheadline:
            self = .subheadline
        case .body:
            self = .body
        case .callout:
            self = .callout
        case .footnote:
            self = .footnote
        case .caption:
            self = .caption
        case .caption2:
            self = .caption2
        @unknown default:
            return nil
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
    /// - Note: If the style dictionary does not have
    ///   a font for this text style the default system
    ///   font is returned.
    internal func scaledFont(forTextStyle textStyle: Font.TextStyle) -> Font {
        #if canImport(UIKit)
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
        
        #elseif canImport(Cocoa)
        
        return Font(
            nsFont(
                forTextStyle: NSFont.TextStyle(fromSwiftUIFontTextStyle: textStyle)
            )
        )
        
        #else
        preconditionFailure("Unknown operating system environment")
        #endif
    }
}


extension View {
    
    public func customFont(
        _ customFont: CustomFont,
        size: CGFloat,
        scaledRelativeTo baseTextStyle: Font.TextStyle = .body
    ) -> some View {
        guard
            let styleKey = CustomFont.StyleKey(baseTextStyle),
            let fontDescription = customFont.styleDictionary?[styleKey.rawValue]
        else {
            return font(.system(baseTextStyle))
        }
        
        return font(.custom(
            fontDescription.fontName,
            size: fontDescription.fontSize,
            relativeTo: baseTextStyle
        ))
    }
    
    
    public func customFont(
        _ customFont: CustomFont,
        forTextStyle baseTextStyle: Font.TextStyle = .body
    ) -> some View {
        font(customFont.scaledFont(forTextStyle: baseTextStyle))
    }
    
    
    /// Convenience wrapper for the standard `Font.custom(_:fixedSize:)` method.
    public func customFont(
        named name: String,
        fixedSize size: CGFloat
    ) -> some View {
        font(.custom(name, fixedSize: size))
    }
}


// MARK: -  Environment Value Support

public struct ScaledFontKey: EnvironmentKey {
    public static var defaultValue = CustomFont.default
}

extension EnvironmentValues {
    public var scaledFont: CustomFont {
        get { self[ScaledFontKey.self] }
        set { self[ScaledFontKey.self] = newValue }
    }
}


public struct CustomFontSizeKey: EnvironmentKey {
    #if os(macOS)
    public static var defaultValue: Double = NSFont.labelFontSize
    #else
    public static var defaultValue: Double = UIFont.labelFontSize
    #endif
}


extension EnvironmentValues {

    public var customFontSize: Double {
        get { self[CustomFontSizeKey.self] }
        set { self[CustomFontSizeKey.self] = newValue }
    }
}


// MARK: -  View Modifier Support
extension View {
    
    public func customFontSize(_ fontSize: Double) -> some View {
        environment(\.customFontSize, fontSize)
    }
}
