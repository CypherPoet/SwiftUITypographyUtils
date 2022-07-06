import Foundation


extension WalletTransactionInfo {
    
    static let previewItems: [Self] = [
        .init(
            recipientName: "LN Markets",
            recipientShortAddress: "lnmarkets.com",
            recipientLocalImageName: "LNMarketsLogo",
            transactionDate: Date(timeIntervalSinceNow: -1 * 60 * 60 * 1),
            transactionAmount: 21.21
        ),
        
        .init(
            recipientName: "Amazon",
            recipientShortAddress: "amazon.com",
            recipientImageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/2500px-Amazon_icon.svg.png"),
            transactionDate: Date(timeIntervalSinceNow: -1 * 60 * 60 * 3),
            transactionAmount: 99.99
        ),
    
        .init(
            recipientName: "Waterstones",
            recipientShortAddress: "Gower Street, London",
            recipientImageURL: URL(string: "https://www.pinclipart.com/picdir/middle/404-4049710_huge-bookshelf-falls-over-at-waterstones-waterstones-logo.png"),
            transactionDate: try! Date(
                "2022-01-17T18:35:00-05:00",
                strategy: .iso8601
            ),
            transactionAmount: 4.59
        ),
    
        .init(
            recipientName: "CypherPoet",
            recipientShortAddress: "Personal Transaction",
            recipientLocalImageName: "CypherPoetLogo",
            transactionDate: try! Date(
                "2021-08-17T18:35:00-05:00",
                strategy: .iso8601
            ),
            transactionAmount: 1_000_000.01
        ),
        
        .init(
            recipientName: "Starbucks",
            recipientShortAddress: "Tottenham Court Rd, London",
            recipientImageURL: URL(string: "https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/640px-Starbucks_Corporation_Logo_2011.svg.png"),
            transactionDate: try! Date(
                "2020-08-17T18:35:00-05:00",
                strategy: .iso8601
            ),
            transactionAmount: 4.59
        ),

    ]
}
