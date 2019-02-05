//
//  StoryboardInstantiable.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardInstantiable {
    
    /// viewController identifier inside storyboard file
    static var viewControllerID: String { get }
    /// storyboard bundle name
    static var storyboardBundle: Bundle? { get }
    /// storyboard file name
    static var storyboardIdentifier: String { get }
    
}

extension StoryboardInstantiable {
    
    static var storyboardBundle: Bundle? { return nil }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: storyboardBundle)
        
        guard let viewController =
            storyboard.instantiateViewController(withIdentifier: viewControllerID) as? Self else {
                
                fatalError("Could not instantiate \(self)")
        }
        return viewController
    }
    
}
