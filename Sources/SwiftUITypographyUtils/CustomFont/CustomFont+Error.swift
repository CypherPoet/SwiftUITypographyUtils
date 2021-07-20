import Foundation


extension CustomFont {

    public enum Error: Swift.Error {
        case settingsFileNotFound
        case dataLoadingFailed(Swift.Error)
        case settingsFileDecodingFailed(DecodingError)
    }
}


//extension CustomFont.Error: Equatable {
//    public static func == (lhs: CustomFont.Error, rhs: CustomFont.Error) -> Bool {
//        <#code#>
//    }
//}
