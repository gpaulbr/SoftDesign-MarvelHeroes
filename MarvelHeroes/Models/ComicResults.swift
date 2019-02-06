//
//  ComicContainer.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 06/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import Foundation

public struct ComicResults: Decodable {
    public let available: Int
    public let items: [Comic]
    public let returned: Int
}
