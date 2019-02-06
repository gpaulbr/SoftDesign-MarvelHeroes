//
//  DataContainer.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import Foundation

/// All successful responses return this, and contains all
/// the metainformation about the returned chunk.
public struct DataContainer<Results: Decodable>: Decodable {
    public let offset: Int
    public let limit: Int
    public let total: Int
    public let count: Int
    public let results: Results
}
