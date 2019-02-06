//
//  GetHeroes.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import Foundation

public enum OrderBy: String, Encodable {
    case name = "name"
    case modified = "modified"
    case descName = "-name"
    case descModified = "-modified"
}

public struct GetHeroes: APIRequest {
    public typealias Response = [Hero]
    
    public var resourceName: String {
        return "characters"
    }
    
    // Parameters
    public let name: String?
    public let nameStartsWith: String?
    public let limit: Int?
    public let offset: Int?
    public let orderBy: OrderBy
    
    // Note that nil parameters will not be used
    public init(orderBy: OrderBy = .descModified,
                name: String? = nil,
                nameStartsWith: String? = nil,
                limit: Int? = nil,
                offset: Int? = nil) {
        self.orderBy = orderBy
        self.name = name
        self.nameStartsWith = nameStartsWith
        self.limit = limit
        self.offset = offset
    }
}
