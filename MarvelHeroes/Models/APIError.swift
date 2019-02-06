//
//  APIError.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import Foundation

/// Dumb error to model simple errors
/// In a real implementation this should be more exhaustive
public enum APIError: Error {
    case encoding
    case decoding
    case server(message: String)
}
