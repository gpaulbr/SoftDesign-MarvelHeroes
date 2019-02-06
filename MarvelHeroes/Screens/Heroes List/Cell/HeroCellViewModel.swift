//
//  HeroesListTableViewModel.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import Foundation

class HeroCellViewModel {
    
    private let hero: Hero
    
    var name: String { return hero.name! }
    
    var imageUrl: URL? {
        return hero.thumbnail?.url
    }
    
    var description: String { return hero.description! }
    
    init(hero: Hero) {
        self.hero = hero
    }
}
