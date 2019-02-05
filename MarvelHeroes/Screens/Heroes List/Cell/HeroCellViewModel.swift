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
    
    var name: String { return hero.name }
    
    var imageUrl: String {
        guard let thumbnail = hero.thumbnail else {
            return "https://www.rvroundtable.com/wp-content/uploads/revslider/home5/placeholder-1200x500.png"
        }
        
        return "\(thumbnail.path)\(thumbnail.extension)"
    }
    
    var description: String { return hero.description }
    
    init(hero: Hero) {
        self.hero = hero
    }
}
