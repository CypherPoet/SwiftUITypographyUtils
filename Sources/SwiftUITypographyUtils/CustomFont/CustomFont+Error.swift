import Foundation


extension CustomFont {

    public enum Error: Swift.Error {
        case settingsFileNotFound
        case dataLoadingFailed(Swift.Error)
        case settingsFileDecodingFailed(DecodingError)
    }
}
