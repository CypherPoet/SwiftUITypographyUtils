import SwiftUI


#if os(macOS)

import Cocoa

extension View {
    
    public static func pointSize(for textStyle: Font.TextStyle) -> CGFloat {
        NSFont.preferredFont(
            forTextStyle: NSFont.TextStyle(fromSwiftUIFontTextStyle: textStyle)
        )
        .pointSize
    }
}

#else


extension View {
    
    public static func pointSize(for textStyle: Font.TextStyle) -> CGFloat {
        UIFont.preferredFont(
            forTextStyle: UIFont.TextStyle(fromSwiftUIFontTextStyle: textStyle)
        )
        .pointSize
    }
}

#endif

