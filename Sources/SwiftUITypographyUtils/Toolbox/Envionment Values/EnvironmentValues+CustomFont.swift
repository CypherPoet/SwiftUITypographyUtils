import SwiftUI


public struct CustomFontKey: EnvironmentKey {
    public static var defaultValue = CustomFont.systemDefault
}


extension EnvironmentValues {
    
    public var customFont: CustomFont {
        get { self[CustomFontKey.self] }
        set { self[CustomFontKey.self] = newValue }
    }
}



// MARK: -  View Modifier Support
extension View {
    
    public func customFont(_ customFont: CustomFont) -> some View {
        environment(\.customFont, customFont)
    }
}
