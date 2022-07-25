// FontDisplayMode.swift
//
// Created by CypherPoet.
// ✌️
//
    
import Foundation
import SwiftUITypographyUtils


enum FontDisplayMode: String {
    case prometo
    case prometoHeadlineSoletoBody
    case allianceNumberOne
    case polySans
    case system
}


extension FontDisplayMode: CaseIterable {}
extension FontDisplayMode: Codable {}


extension FontDisplayMode: Identifiable {
    var id: String { rawValue }
}


extension FontDisplayMode {
    
    var titleForDisplay: String {
        switch self {
        case .prometo:
            return "Prometo"
        case .prometoHeadlineSoletoBody:
            return "Prometo (Headline) + Soleto (Body)"
        case .system:
            return "Default System Font"
        case .allianceNumberOne:
            return "Alliance No. 1"
        case .polySans:
            return "PolySans"
        }
    }

    
    var customLargeTitleFont: CustomFont {
        switch self {
        case .prometo:
            return .prometo
        case .prometoHeadlineSoletoBody:
            return .prometo
        case .allianceNumberOne:
            return .allianceNumberOne
        case .polySans:
            return .polySans
        case .system:
            return .systemDefault
        }
    }
    
    
    var customTitleFont: CustomFont {
        switch self {
        case .prometo:
            return .prometo
        case .prometoHeadlineSoletoBody:
            return .prometo
        case .allianceNumberOne:
            return .allianceNumberOne
        case .polySans:
            return .polySans
        case .system:
            return .systemDefault
        }
    }
    
    
    var customTitle2Font: CustomFont {
        switch self {
        case .prometo:
            return .prometo
        case .prometoHeadlineSoletoBody:
            return .prometo
        case .allianceNumberOne:
            return .allianceNumberOne
        case .polySans:
            return .polySans
        case .system:
            return .systemDefault
        }
    }
    
    
    var customTitle3Font: CustomFont {
        switch self {
        case .prometo:
            return .prometo
        case .prometoHeadlineSoletoBody:
            return .prometo
        case .allianceNumberOne:
            return .allianceNumberOne
        case .polySans:
            return .polySans
        case .system:
            return .systemDefault
        }
    }
    
    
    var customHeadlineFont: CustomFont {
        switch self {
        case .prometo:
            return .prometo
        case .prometoHeadlineSoletoBody:
            return .prometo
        case .allianceNumberOne:
            return .allianceNumberOne
        case .polySans:
            return .polySans
        case .system:
            return .systemDefault
        }
    }
    
    
    var customSubheadlineFont: CustomFont {
        switch self {
        case .prometo:
            return .prometo
        case .prometoHeadlineSoletoBody:
            return .soleto
        case .allianceNumberOne:
            return .allianceNumberOne
        case .polySans:
            return .polySans
        case .system:
            return .systemDefault
        }
    }
    
    
    var customBodyFont: CustomFont {
        switch self {
        case .prometo:
            return .prometo
        case .prometoHeadlineSoletoBody:
            return .soleto
        case .allianceNumberOne:
            return .allianceNumberOne
        case .polySans:
            return .polySans
        case .system:
            return .systemDefault
        }
    }
    
    
    var customCalloutFont: CustomFont {
        switch self {
        case .prometo:
            return .prometo
        case .prometoHeadlineSoletoBody:
            return .soleto
        case .allianceNumberOne:
            return .allianceNumberOne
        case .polySans:
            return .polySans
        case .system:
            return .systemDefault
        }
    }
    
    
    var customFootnoteFont: CustomFont {
        switch self {
        case .prometo:
            return .prometo
        case .prometoHeadlineSoletoBody:
            return .soleto
        case .allianceNumberOne:
            return .allianceNumberOne
        case .polySans:
            return .polySans
        case .system:
            return .systemDefault
        }
    }
    
    
    var customCaptionFont: CustomFont {
        switch self {
        case .prometo:
            return .prometo
        case .prometoHeadlineSoletoBody:
            return .soleto
        case .allianceNumberOne:
            return .allianceNumberOne
        case .polySans:
            return .polySans
        case .system:
            return .systemDefault
        }
    }
    
    
    var customCaption2Font: CustomFont {
        switch self {
        case .prometo:
            return .prometo
        case .prometoHeadlineSoletoBody:
            return .soleto
        case .allianceNumberOne:
            return .allianceNumberOne
        case .polySans:
            return .polySans
        case .system:
            return .systemDefault
        }
    }
    
}
