//
//  NetworkingService.swift
//  GeniusPlazaCodeChallegnge
//
//  Created by Kadeem Palacios on 4/11/19.
//  Copyright © 2019 Kadeem Palacios. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkingService {

    static func requestData(completion: @escaping ([itunesData]) -> ()) {
        var result:[itunesData] = []
        let appleMsuicString = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
        let url = URL(string: appleMsuicString)
        Alamofire.request(url!).responseJSON { (response) in
            switch response.result {
            case .success :
                do {
                    let json = try JSON(data: response.data!)["feed"]["results"].array!

                    for packet in json {
                        let title = packet["name"].string!
                        let mediaType = packet["kind"].string!
                        let artist = packet["artistName"].string!
                        let artworkUrl = packet["artworkUrl100"].string!

                        let unit = itunesData(title: title, mediaType: mediaType, image: artworkUrl, artist: artist)

                        result.append(unit)
                    }

                    completion(result)
                }
                catch {
                    print(error)
                }

            case .failure(let error):
                print(error)
            }
        }

    }
}
