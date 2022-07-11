import SwiftUI

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
        
        return font(
            .custom(
                fontDescription.fontName,
                size: fontDescription.fontSize,
                relativeTo: baseTextStyle
            )
        )
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
