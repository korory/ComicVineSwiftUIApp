//
//  CharactersViewModel.swift
//  ComicVineSwiftUIApp
//
//  Created by Arnau Rivas Rivas on 6/5/22.
//

import Foundation

// MARK: - CharactersViewModel
public struct CharactersModel: Codable {
    var error: String?
    var limit, offset, numberOfPageResults, numberOfTotalResults: Int?
    var statusCode: Int?
    var results: [Result]?
    var version: String?
    //Algo de INT para el tests?
}

// MARK: - Result
struct Result: Codable {
    var aliases: String?
    var apiDetailURL: String?
    var birth: String?
    var characterEnemies, characterFriends: [FirstAppearedInIssue]?
    var countOfIssueAppearances: Int?
    var creators: [FirstAppearedInIssue]?
    var dateAdded, dateLastUpdated, deck, description: String?
    var firstAppearedInIssue: FirstAppearedInIssue?
    var gender, id: Int?
    var image: ImageModel?
    var issueCredits: [FirstAppearedInIssue]?
    var issuesDiedIn, movies: [FirstAppearedInIssue]?
    var name: String?
    var origin: FirstAppearedInIssue?
    var powers: [FirstAppearedInIssue]?
    var publisher: FirstAppearedInIssue?
    var realName: String?
    var siteDetailURL: String?
    var storyArcCredits: [FirstAppearedInIssue]?
    var teamEnemies, teamFriends, teams, volumeCredits: [FirstAppearedInIssue]?
    
    enum CodingKeys: String, CodingKey {
        case aliases = "aliases"
        case apiDetailURL = "api_detail_url"
        case birth = "birth"
        case characterEnemies = "character_enemies"
        case characterFriends = "character_friends"
        case countOfIssueAppearances = "count_of_issue_appearances"
        case creators = "creators"
        case dateAdded = "date_added"
        case dateLastUpdated = "date_last_updated"
        case deck = "deck"
        case description = "description"
        case firstAppearedInIssue = "first_appeared_in_issue"
        case gender = "gender"
        case id = "id"
        case image = "image"
        case issueCredits = "issue_credits"
        case issuesDiedIn = "issues_died_in"
        case movies = "movies"
        case name = "name"
        case origin = "origin"
        case powers = "powers"
        case publisher = "publisher"
        case realName = "real_name"
        case siteDetailURL = "site_detail_url"
        case storyArcCredits = "story_arc_credits"
        case teamEnemies = "team_enemies"
        case teamFriends = "team_friends"
        case teams = "teams"
        case volumeCredits = "volume_credits"
    }
}

// MARK: - FirstAppearedInIssue
struct FirstAppearedInIssue: Codable {
    var apiDetailURL: String?
    var id: Int?
    var name: String?
    var siteDetailURL: String?
    var issueNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case apiDetailURL = "api_detail_url"
        case id = "id"
        case name = "name"
        case siteDetailURL = "site_detail_url"
        case issueNumber = "issue_number"
    }
}

// MARK: - ImageModel
struct ImageModel: Codable {
    var iconURL, mediumURL, screenURL, screenLargeURL: String?
    var smallURL, superURL, thumbURL, tinyURL: String?
    var originalURL: String?
    var imageTags: String?
    
    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case mediumURL = "medium_url"
        case screenURL = "screen_url"
        case screenLargeURL = "screen_large_url"
        case smallURL = "small_url"
        case superURL = "super_url"
        case thumbURL = "thumb_url"
        case tinyURL = "tiny_url"
        case originalURL = "original_url"
        case imageTags = "image_tags"
    }
}
