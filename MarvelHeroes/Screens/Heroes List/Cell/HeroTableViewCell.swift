//
//  HeroesListTableViewCell.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 05/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import UIKit

class HeroTableViewCell: UITableViewCell {
    static let identifier = "heroCell"
    
    private var viewModel: HeroCellViewModel!
    
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(with viewModel: HeroCellViewModel) {
        self.viewModel = viewModel
        heroName.text = viewModel.name
        
        //TODO: Add placeholder Image
        guard let url = viewModel.imageUrl else { return }
        heroImage.dowloadFromServer(url: url, contentMode: .scaleAspectFill)
        heroImage.clipsToBounds = true
    }
    
}
