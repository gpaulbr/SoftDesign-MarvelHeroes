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
    private var count: Int = 0
    
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        count += 1
        setupCell()
    }
    
    private func setupCell() {
        heroImage.isHidden = true
        loadingIndicator.startAnimating()
    }
    
    func configure(with viewModel: HeroCellViewModel) {
        self.viewModel = viewModel
        heroName.text = viewModel.name
        let auxCount = self.count
        //TODO: Add placeholder Image
        guard let url = viewModel.imageUrl else { return }
        heroImage.dowloadFromServer(url: url, contentMode: .scaleAspectFill) { () in
            if auxCount == self.count {
                DispatchQueue.main.async {
                    self.heroImage.isHidden = false
                    self.loadingIndicator.stopAnimating()
                }
            }
        }
        heroImage.clipsToBounds = true
    }
    
}
