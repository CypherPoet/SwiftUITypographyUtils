// MainAppViewer.swift
//
// Created by CypherPoet.
// ✌️
//
    
import SwiftUI


struct MainAppViewer {
    
    @AppStorage(UserDefaults.CustomKeys.fontDisplayMode)
    private var fontDisplayMode: FontDisplayMode = .prometo
}


// MARK: - `View` Body
extension MainAppViewer: View {

    var body: some View {
        NavigationStack {
            
            Text("SwiftUI Typography Utils")
                .customFont(
                    fontDisplayMode.customLargeTitleFont,
                    forTextStyle: .largeTitle
                )
                .multilineTextAlignment(.center)
                .padding(.vertical)
            
            List {
                NavigationLink("Custom Font") {
                    CustomFontDemoView()
                }
            }
        }
        .navigationTitle("SwiftUI Typography Utils")
    }
}


// MARK: - Computeds
extension MainAppViewer {
}


// MARK: - View Content Builders
extension MainAppViewer {

    private var toolbarContent: some ToolbarContent {
        Group {
            ToolbarItem(placement: .automatic) {
            }
            ToolbarItem(placement: .automatic) {
            }
        }
    }
}


// MARK: - Private Helpers
extension MainAppViewer {
}


#if DEBUG

// MARK: - Preview
struct MainAppViewer_Previews: PreviewProvider {

    static var previews: some View {
        MainAppViewer()
    }
}

#endif
