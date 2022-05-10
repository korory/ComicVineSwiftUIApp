//
//  ComicVineSwiftUIAppTests.swift
//  ComicVineSwiftUIAppTests
//
//  Created by Arnau Rivas Rivas on 10/5/22.
//

import XCTest
import ComicVineSwiftUIApp

protocol Service {
    func getAPIInformation<T: Decodable>(responsesAPI: URLEnum, modelInformation: Data, completion: @escaping(T) -> ())
}

protocol DecodeProtocol {
    func decodeJSON<T: Decodable>(data: Data, completion: @escaping(T) -> ())
}

class ServiceSpy: Service, DecodeProtocol {
    func getAPIInformation<T: Decodable>(responsesAPI: URLEnum, modelInformation: Data, completion: @escaping(T) -> ()) {
        let informationData = modelInformation
        self.decodeJSON(data: informationData) {
            completion($0)
        }
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


class ComicVineSwiftUIAppTests: XCTestCase {
    let service: Service = ServiceSpy()
    var characterDes: CharactersModel?
    
    func test() {
        let jsonData = getDataFromJSONFile()
        service.getAPIInformation(responsesAPI: URLEnum.getCharacters, modelInformation: jsonData) {
            self.resultsOk(allCharacters: $0)
        }
    }
    
    func resultsOk(allCharacters: CharactersModel) {
        self.characterDes = allCharacters
        XCTAssertNotNil(self.characterDes)
    }
    
    func getDataFromJSONFile() -> Data {
        do {
            if let file = Bundle.main.url(forResource: "characters", withExtension: "json") {
                let data = try Data(contentsOf: file)
                return data
            }
        } catch {
            print(error.localizedDescription)
                }
        return Data()
    }
}
