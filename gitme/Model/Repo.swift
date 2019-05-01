//
//  Repo.swift
//  gitme
//
//  Created by Nick Bruinsma on 01/05/2019.
//  Copyright © 2019 appeeme. All rights reserved.
//

import UIKit

//struct Owner: Decodable {
//    public private(set) var avatar_url: String
//
//    init(avatar_url: String) {
//        self.avatar_url = avatar_url
//    }
//}

class Repo: Decodable {
//    public private(set) var image: UIImage
    public private(set) var name: String
    public private(set) var description: String
    public private(set) var forks: Int
//    public private(set) var language: String
    public private(set) var watchers: Int
    public private(set) var html_url: String
//    public private(set) var owner: Owner

    init(name: String, description: String, forks: Int, watchers: Int, html_url: String) {
//        self.image = image
        self.name = name
        self.description = description
        self.forks = forks
//        self.language = language
        self.watchers = watchers
        self.html_url = html_url
    }
    
}
