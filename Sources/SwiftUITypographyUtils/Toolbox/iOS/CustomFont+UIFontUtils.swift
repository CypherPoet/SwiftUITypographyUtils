#if !os(macOS)

import SwiftUI


extension CustomFont {
    
    /// Get the scaled font for the given text style using the
    /// style dictionary supplied at initialization.
    ///
    /// - Parameter textStyle: The `UIFont.TextStyle` for the
    ///   font.
    /// - Returns: A `UIFont` of the custom font that has been
    ///   scaled for the users currently selected preferred
    ///   text size.
    ///
    /// - Note: If the style dictionary does not have
    ///   a font for this text style the default preferred
    ///   font is returned.
    public func scaledFont(
        forTextStyle textStyle: UIFont.TextStyle
    ) -> UIFont {
        guard
            let styleKey = StyleKey(textStyle),
            let fontDescription = styleDictionary?[styleKey.rawValue],
            let font = UIFont(
                name: fontDescription.fontName,
                size: fontDescription.fontSize
            )
        else {
            return UIFont.preferredFont(forTextStyle: textStyle)
        }
        
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        
        return fontMetrics.scaledFont(for: font)
    }
}


extension CustomFont.StyleKey {
    
    internal init?(_ textStyle: UIFont.TextStyle) {
        switch textStyle {
        case .largeTitle:
            self = .largeTitle
        case .title1:
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
        case .caption1:
            self = .caption
        case .caption2:
            self = .caption2
        default:
            return nil
        }
    }
}

#endif
