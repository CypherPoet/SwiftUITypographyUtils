import SwiftUITypographyUtils


extension CustomFont {
    
    enum SettingsFileNames {
        static let futura = "FuturaSettings"
        static let phosphateInline = "PhosphateInlineSettings"
        
        static let invalidFormat = "IncorrectlyFormattedSettings"
        
        /// Settings that use a font name that isn't registered in the running application.
        static let unregistered = "__UnregisteredFont__"
        
        /// Name for a non-existant file.
        static let missingFile = "__MissingFile__"
    }
}
