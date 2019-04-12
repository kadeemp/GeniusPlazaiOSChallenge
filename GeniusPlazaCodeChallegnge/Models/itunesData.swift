//
//  itunesData.swift
//  GeniusPlazaCodeChallegnge
//
//  Created by Kadeem Palacios on 4/11/19.
//  Copyright © 2019 Kadeem Palacios. All rights reserved.
//

import Foundation
struct itunesData {
    let title:String
    let mediaType:String
    let image:String
    let artist:String
    init(title:String,mediaType:String,image:String,artist:String) {
        self.title = title
        self.mediaType = mediaType
        self.image = image
        self.artist = artist
    }
}
