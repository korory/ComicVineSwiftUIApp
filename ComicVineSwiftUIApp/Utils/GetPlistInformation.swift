//
//  GetPlistInformation.swift
//  ComicVineSwiftUIApp
//
//  Created by Arnau Rivas Rivas on 7/5/22.
//

import Foundation

public func getURLInPlist(name: URLEnum) -> URL{
    
    if let infoPlistPath = Bundle.main.url(forResource: "URL", withExtension: "plist") {
        
        do {
            let infoPlistData = try Data(contentsOf: infoPlistPath)
            
            if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                if let index = dict.index(forKey: name.getURL()) {
                    guard let url = URL(string: dict[index].value as! String) else { return URL(fileURLWithPath: "") }
                    return url
                }
            }
        } catch let error{
            print(error.localizedDescription)
        }
        
    } else {
        return URL(fileURLWithPath: "")
    }
    
    return URL(fileURLWithPath: "")
}
