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

    @Published var characterInformation: CharactersViewModel? {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        getCharacterInformationAPI()
    }
    
    var parameters: [String : String] =

    [
        "format" : "json",
        "api_key" : comicVineApiKey,
        "filter": "gender:female,name:Dream Girl"
    ]
    
    func getCharacterInformationAPI() {
        NetworkManager().getAPIInformation(
            responsesAPI: "getCharacters",
            parameters: parameters) {
                self.characterInformation = $0
            }
    }
}
