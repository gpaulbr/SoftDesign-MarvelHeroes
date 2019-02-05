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
    
    var title: String { return hero.title }
    
    var releaseDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
        let date = dateFormatter.date(from: hero.releaseDate) ?? Date()
        dateFormatter.dateFormat = "yyyy MMMM dd"
        return dateFormatter.string(from: date)
    }
    
    var imageUrl: String {
        guard let path = hero.posterPath else {
            return "https://www.rvroundtable.com/wp-content/uploads/revslider/home5/placeholder-1200x500.png"
        }
        
        return "http://image.tmdb.org/t/p/w185\(path)"
    }
    
    init(hero: Hero) {
        self.hero = hero
    }
}
