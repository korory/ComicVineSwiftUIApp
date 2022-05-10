//
//  CharacterViewModel.swift
//  ComicVineSwiftUIApp
//
//  Created by Arnau Rivas Rivas on 8/5/22.
//

import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    
    let didChange = PassthroughSubject<CharacterViewModel, Never>()
    let service: Services?

    @Published var characterInformation: CharactersModel? {
        didSet {
            didChange.send(self)
        }
    }
    
    init(service: Services) {
        self.service = service
        getCharacterInformationAPI()
    }
    
    func getCharacterInformationAPI() {
        let parameters: [String : String] = [
            "format" : "json",
            "api_key" : comicVineApiKey,
            "filter": "gender:female,name:Dream Girl"
        ]
        
        service?.getAPIInformation(
            responsesAPI: URLEnum.getCharacters,
            parameters: parameters) {
                self.characterInformation = $0
            }
    }
}
