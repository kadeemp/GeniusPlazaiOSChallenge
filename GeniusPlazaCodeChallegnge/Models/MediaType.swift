//
//  MediaType.swift
//  GeniusPlazaCodeChallegnge
//
//  Created by Kadeem Palacios on 4/11/19.
//  Copyright © 2019 Kadeem Palacios. All rights reserved.
//

import Foundation

class MediaType {

    static let appleMusic =  "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
    static let itunesMusic = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/10/explicit.json"
    static let iOSApps = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/10/explicit.json"
    static let macApps = "https://rss.itunes.apple.com/api/v1/us/macos-apps/top-free-mac-apps/all/10/explicit.json"
    static let audioBooks = "https://rss.itunes.apple.com/api/v1/us/audiobooks/top-audiobooks/all/10/explicit.json"
    static let books = "https://rss.itunes.apple.com/api/v1/us/books/top-free/all/10/explicit.json"
    static let tvShows = "https://rss.itunes.apple.com/api/v1/us/tv-shows/top-tv-episodes/all/10/explicit.json"
    static func allLinks() -> [String] {
        let links = [appleMusic, itunesMusic, iOSApps, macApps, audioBooks, books, tvShows]
        return links
    }

}
enum MediaEnum {

    case appleMusic
    case itunesMusic
    case iOSApps
    case macApps
    case audioBooks
    case books
    case tvShows
}
