// WalletTransactionInfoListItemView.swift
//
// Created by CypherPoet.
// ✌️
//
    
import SwiftUI
import SwiftUITypographyUtils


struct WalletTransactionInfoListItemView {
    var transaction: WalletTransactionInfo
    
    @AppStorage(UserDefaults.CustomKeys.fontDisplayMode)
    private var fontDisplayMode: FontDisplayMode = .prometo
    
    @ScaledMetric(relativeTo: .body)
    private var baseFontSize: CGFloat = pointSize(for: .body)
}


// MARK: - `View` Body
extension WalletTransactionInfoListItemView: View {

    var body: some View {
        HStack(spacing: baseFontSize * 0.8) {
            transactionImageView
                .frame(
                    minWidth: 48,
                    maxWidth: max(48, baseFontSize * 3.0),
                    minHeight: 48,
                    maxHeight: max(48, baseFontSize * 3.0),
                    alignment: .center
                )
                .cornerRadius(baseFontSize * 0.8)
            
            VStack(alignment: .leading, spacing: baseFontSize * 0.1) {
                Text(transaction.recipientName)
                    .customFont(
                        fontDisplayMode.customHeadlineFont,
                        forTextStyle: .headline
                    )
                
                VStack(alignment: .leading, spacing: baseFontSize * 0.35) {
                    Text(transaction.recipientShortAddress)

                    HStack {
                        Text(
                            transaction.transactionDate,
                            formatter: Self
                                .CustomDateFormatters
                                .relativeTransactionDate
                        )
                        
                        Spacer()
                        
                        Text(
                            CustomCurrencyFormatters
                                .transactionAmount
                                .string(
                                    from: NSNumber(value: transaction.transactionAmount)
                                )!
                        )
                    }
                    .customFont(
                        fontDisplayMode.customCaptionFont,
                        forTextStyle: .caption
                    )
                }
                .customFont(
                    fontDisplayMode.customSubheadlineFont,
                    forTextStyle: .caption2
                )
                .foregroundColor(.secondary)
            }
        }
        .listRowSeparator(.visible)
        .lineLimit(1)
    }
}

extension WalletTransactionInfoListItemView {
    
    enum CustomDateFormatters {
        static let relativeTransactionDate = RelativeDateTimeFormatter()
    }
    
    enum CustomCurrencyFormatters {
        static let transactionAmount: NumberFormatter = {
            let formatter = NumberFormatter()
            
            formatter.numberStyle = .currency
            formatter.currencySymbol = "BTC"
            formatter.maximumIntegerDigits = 4
            formatter.maximumFractionDigits = 2
            
            return formatter
        }()
    }
    
}

// MARK: - Computeds
extension WalletTransactionInfoListItemView {
}



// MARK: - View Content Builders
extension WalletTransactionInfoListItemView {

    private var toolbarContent: some ToolbarContent {
        Group {
            ToolbarItem(placement: .automatic) {
            }
            ToolbarItem(placement: .automatic) {
            }
        }
    }
    
    
    @ViewBuilder
    private var transactionImageView: some View {
        if let imageURL = transaction.recipientImageURL {
            AsyncImage(
                url: imageURL,
                content: { image in
                    image
                        .resizable()
                },
                placeholder: {
                    ProgressView()
                }
            )
        } else if let imageName = transaction.recipientLocalImageName {
            Image(imageName)
                .resizable()
        }
    }
}


// MARK: - Private Helpers
extension WalletTransactionInfoListItemView {
}


#if DEBUG

// MARK: - Preview
struct WalletTransactionInfoListItemView_Previews: PreviewProvider {

    static var previews: some View {
        WalletTransactionInfoListItemView(
            transaction: WalletTransactionInfo.previewItems.first!
        )
        
        NavigationStack {
            List(WalletTransactionInfo.previewItems) { infoItem in
                NavigationLink(value: infoItem.self) {
                    WalletTransactionInfoListItemView(
                        transaction: infoItem
                    )
                }
            }
        }
    }
}

#endif
