#if canImport(UIKit)

import SwiftUI


extension CustomFont {
    
    /// Get the scaled font for the given text style using the
    /// style dictionary supplied at initialization.
    ///
    /// - Parameter textStyle: The `UIFont.TextStyle` for the
    ///   font.
    /// - Returns: A `UIFont` representatoin of the ``CustomFont`` that has been
    ///   scaled for the user's currently selected preferred
    ///   text size.
    ///
    /// ### 📝 Note
    ///
    /// The default preferred system font is returned if:
    ///
    /// - The ``CustomFont``'s style dictionary does not have a font for this text style.
    /// - A matching `UIFont` can't be found for the ``CustomFont``'s family name.
    public func scaledUIFont(
        forTextStyle textStyle: UIFont.TextStyle
    ) -> UIFont {
        guard
            let styleDictionary = styleDictionary,
            let styleKey = StyleKey(textStyle),
            let matchingUIFont = matchingUIFont(for: styleKey, in: styleDictionary)
        else {
            return UIFont.preferredFont(forTextStyle: textStyle)
        }
        
        return UIFontMetrics(forTextStyle: textStyle)
            .scaledFont(for: matchingUIFont)
    }
    
    
    internal func matchingUIFont(
        for styleKey: StyleKey,
        in styleDictionary: StyleDictionary
    ) -> UIFont? {
        guard let customFontDescription = styleDictionary[styleKey.rawValue] else {
            return nil
        }
        
        return UIFont(
            name: customFontDescription.fontName,
            size: customFontDescription.fontSize
        )
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
