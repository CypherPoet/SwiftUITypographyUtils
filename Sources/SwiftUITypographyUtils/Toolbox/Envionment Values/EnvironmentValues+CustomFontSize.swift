import SwiftUI


public struct CustomFontSizeKey: EnvironmentKey {
    #if os(macOS)

    public static var defaultValue: Double = NSFont.labelFontSize
    
    #elseif canImport(UIKit)
    
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
