//
//  NetworkManager.swift
//  ComicVineSwiftUIApp
//
//  Created by Arnau Rivas Rivas on 7/5/22.
//

import Foundation

protocol Services {
    func getAPIInformation<T: Decodable>(responsesAPI: URLEnum, parameters: [String : String], completion: @escaping(T) -> ())
}

protocol DecodeProtocol {
    func decodeJSON<T: Decodable>(data: Data, completion: @escaping(T) -> ())
}

class NetworkManager: Services, DecodeProtocol {
    
    //Fix all parameters [String: String] to [String: Any]
   public func getAPIInformation<T: Decodable>(responsesAPI: URLEnum, parameters: [String : String], completion: @escaping(T) -> ()) {
        
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
                self.decodeJSON(data: informationData) {
                    completion($0)
                }
            }
            
        }.resume()
    }
    
    func decodeJSON<T: Decodable>(data: Data, completion: @escaping(T) -> ()) {
        do {
            let informationData = try JSONDecoder().decode(T.self, from: data)
            DispatchQueue.main.async {
                completion(informationData)
            }
            
        } catch let error {
            print("Ha ocurrido un error: \(error.localizedDescription)")
        }
    }
}
