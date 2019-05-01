//
//  RootJSON.swift
//  gitme
//
//  Created by Nick Bruinsma on 01/05/2019.
//  Copyright © 2019 appeeme. All rights reserved.
//

import Foundation

class RootJSON: Decodable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [Repo]
    
    init(total_count: Int, incomplete_results: Bool, items: [Repo]) {
        self.total_count = total_count
        self.incomplete_results = incomplete_results
        self.items = items
    }
}
