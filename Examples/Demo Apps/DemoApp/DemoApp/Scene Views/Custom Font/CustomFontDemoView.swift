// CustomFontDemoView.swift
//
// Created by CypherPoet.
// ✌️
//

import SwiftUI
import SwiftUITypographyUtils


struct CustomFontDemoView {
    
    private let sampleTransactions: [WalletTransactionInfo] = WalletTransactionInfo.previewItems
    
    
    @AppStorage(UserDefaults.CustomKeys.fontDisplayMode)
    private var fontDisplayMode: FontDisplayMode = .prometo

    @ScaledMetric(relativeTo: .body)
    private var baseFontSize: CGFloat = pointSize(for: .body)
}



// MARK: - `View` Body
extension CustomFontDemoView: View {
    
    var body: some View {
        List {
            Section(
                content: {
                    FontDisplayModeFilterCarouselView()
                },
                header: {
                    ListHeaderView(title: "Font Settings")
                        .scenePadding(.horizontal)
                },
                footer: {}
            )
            .listRowBackground(Color.clear)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listSectionSeparator(.hidden)
            .ignoresSafeArea(.all, edges: .horizontal)
            
            transactionSection
                .listSectionSeparator(.hidden)
        }
        .listStyle(.grouped)
        .headerProminence(.increased)
        .listSectionSeparator(.hidden)
        .ignoresSafeArea([.all], edges: [.horizontal])
        .navigationTitle("Custom Fonts Demo")
        .background(.ultraThinMaterial)
        .padding(.vertical, 24)
    }
}


// MARK: - Computeds
extension CustomFontDemoView {
}


// MARK: - View Content Builders
extension CustomFontDemoView {
    
    private var toolbarContent: some ToolbarContent {
        Group {
            ToolbarItem(placement: .automatic) {
            }
            ToolbarItem(placement: .automatic) {
            }
        }
    }
    
    
    private var transactionSection: some View {
        Section(
            content: {
                ForEach(sampleTransactions) { walletTransaction in
                    WalletTransactionInfoListItemView(
                        transaction: walletTransaction
                    )
                }
            },
            header: {
                ListHeaderView(title: "Latest Transactions")
            },
            footer: {}
        )
    }
}


// MARK: - Private Helpers
extension CustomFontDemoView {
}




#if DEBUG

// MARK: - Preview
struct CustomFontDemoView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationStack {
            CustomFontDemoView()
        }
    }
}

#endif



