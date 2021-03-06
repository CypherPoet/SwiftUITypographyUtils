import SwiftUI


extension CustomFont {
    
    public enum StyleKey: String, Decodable {
        case largeTitle
        case title
        case title2
        case title3
        case headline
        case subheadline
        case body
        case callout
        case caption
        case caption2
        case footnote
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
        case .caption:
            self = .caption
        case .caption2:
            self = .caption2
        case .footnote:
            self = .footnote
        @unknown default:
            return nil
        }
    }
}

