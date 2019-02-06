//
//  HeroDetailsViewModel.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 06/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import Foundation

class HeroDetailsViewModel {
    
    private var hero: Hero
    
    var name: String { return hero.name ?? "Unknown Name"}
    var description: String { return hero.description ?? "Unknown"}
    var imageUrl: URL? { return hero.thumbnail?.url }
    
    var numberOfRows: Int { return hero.comics?.returned ?? 0 }
    
    init(_ hero: Hero) {
        self.hero = hero
    }
    
    func comicTitle(for indexPath: IndexPath) -> String {
        return hero.comics?.items[indexPath.row].name ?? "Unknown Comic"
    }
}
