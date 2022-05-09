//
//  CharacterView.swift
//  ComicVineSwiftUIApp
//
//  Created by Arnau Rivas Rivas on 8/5/22.
//

import SwiftUI

struct CharacterView: View {
    
    @ObservedObject var model = CharacterViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
