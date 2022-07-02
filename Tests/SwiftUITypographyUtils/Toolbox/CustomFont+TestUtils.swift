import SwiftUITypographyUtils


extension CustomFontTests {
    
    enum SettingsFileNames {
        static let futura = "FuturaSettings"
        static let phosphateInline = "PhosphateInlineSettings"
        
        static let invalidFormat = "IncorrectlyFormattedSettings"
        
        /// Settings that use a font name that isn't registered in the running application.
        static let unregistered = "__UnregisteredFontSettings__"
        
        /// Name for a non-existent file.
        static let missingFile = "__MissingFile__"
    }
}
