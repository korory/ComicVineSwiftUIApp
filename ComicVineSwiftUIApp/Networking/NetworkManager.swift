//
//  NetworkManager.swift
//  ComicVineSwiftUIApp
//
//  Created by Arnau Rivas Rivas on 7/5/22.
//

import Foundation

class NetworkManager {
    
    //Fix all parameters [String: String] to [String: Any]
   public func getAPIInformation(responsesAPI: String, parameters: [String : String], completion: @escaping(CharactersViewModel) -> ()) {
        
       var components = URLComponents(url: getURLInPlist(name: responsesAPI), resolvingAgainstBaseURL: true)
        
        components?.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        let request = URLRequest(url: components?.url ?? URL(fileURLWithPath: ""))
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let informationData = data, error == nil,
                  let informationResponse = response as? HTTPURLResponse else {
                fatalError("This URL is corrupted or cannot be accessed right now.")
            }
            
            if informationResponse.statusCode == 200  {
                
                do {
                    let charactersInformation = try JSONDecoder().decode(CharactersViewModel.self, from: informationData)
                    DispatchQueue.main.async {
                        //Devolver ese objeto en el completion
                        completion(charactersInformation)
                    }
                    
                } catch let error {
                    print("Ha ocurrido un error: \(error.localizedDescription)")
                }
            }
            
        }.resume()
    }
}
