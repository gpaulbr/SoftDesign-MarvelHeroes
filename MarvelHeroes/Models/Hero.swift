//
//  Hero.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import Foundation

public struct Hero: Decodable {
    let id: Int
    let name: String?
    let description: String?
    let thumbnail: Image?
}
