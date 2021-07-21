import SwiftUI

#if canImport(Cocoa)

import Cocoa

extension Font {
    
    public static func pointSize(for textStyle: Font.TextStyle) -> CGFloat {
        NSFont.preferredFont(
            forTextStyle: NSFont.TextStyle(fromSwiftUIFontTextStyle: textStyle)
        )
        .pointSize
    }
}

#elseif canImport(UIKit)

extension Font {
    
    public static func pointSize(for textStyle: Font.TextStyle) -> CGFloat {
        UIFont.preferredFont(
            forTextStyle: UIFont.TextStyle(fromSwiftUIFontTextStyle: textStyle)
        )
        .pointSize
    }
}


#endif


extension View {
    
    public static func pointSize(for textStyle: Font.TextStyle) -> CGFloat {
        Font.pointSize(for: textStyle)
    }
}
