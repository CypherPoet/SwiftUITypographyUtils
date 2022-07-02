#if os(macOS)

import SwiftUI

extension CustomFont {
    
    /// Get the scaled font for the given text style using the
    /// style dictionary supplied at initialization.
    ///
    /// - Parameter textStyle: The `NSFont.TextStyle` for the
    ///   font.
    /// - Returns: A `NSFont` representatoin of the ``CustomFont`` that has been
    ///   scaled for the user's currently selected preferred
    ///   text size.
    ///
    /// The default preferred system font is returned if:
    ///   - The ``CustomFont``'s style dictionary does not have a font for this text style.
    ///   - A matching `UIFont` can't be found for the ``CustomFont``'s family name.
    public func nsFont(
        forTextStyle textStyle: NSFont.TextStyle
    ) -> NSFont {
        guard
            let styleDictionary = styleDictionary,
            let styleKey = StyleKey(textStyle),
            let matchingNSFont = matchingNSFont(for: styleKey, in: styleDictionary)
        else {
            return NSFont.preferredFont(forTextStyle: textStyle)
        }
        
        return matchingNSFont
    }
    
    
    internal func matchingNSFont(
        for styleKey: StyleKey,
        in styleDictionary: StyleDictionary
    ) -> NSFont? {
        guard let customFontDescription = styleDictionary[styleKey.rawValue] else {
            return nil
        }
        
        return NSFont(
            name: customFontDescription.fontName,
            size: customFontDescription.fontSize
        )
    }
}



extension CustomFont.StyleKey {
   
    internal init?(_ textStyle: NSFont.TextStyle) {
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
