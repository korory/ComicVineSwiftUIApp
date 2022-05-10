//
//  URLEnum.swift
//  ComicVineSwiftUIApp
//
//  Created by Arnau Rivas Rivas on 10/5/22.
//

import Foundation

public enum URLEnum: String {
    case getCharacters
    case getCharacter
    
    func getURL() -> String {
        switch self {
        case .getCharacters:
            return rawValue
        case .getCharacter:
            return rawValue
        }
    }
}
