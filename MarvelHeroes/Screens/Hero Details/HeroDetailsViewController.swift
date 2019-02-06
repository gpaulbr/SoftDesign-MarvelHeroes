//
//  HeroDetailsViewController.swift
//  MarvelHeroes
//
//  Created by Gabriel Paul on 06/02/19.
//  Copyright © 2019 gp. All rights reserved.
//

import UIKit

class HeroDetailsViewController: UIViewController {
    var viewModel: HeroDetailsViewModel!
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroDescriptionTextView: UITextView!
    
    @IBOutlet weak var comicsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comicsTableView.dataSource = self
        comicsTableView.delegate = self
        
        navigationItem.title = viewModel.name
        heroDescriptionTextView.text = viewModel.description
        comicsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "comicCell")
        
        guard let url = viewModel.imageUrl else { return }
        heroImage.dowloadFromServer(url: url, contentMode: .scaleAspectFill) {
            () in
            print("whatever")
        }
        heroImage.clipsToBounds = true
    }
}

extension HeroDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.0)
    }
}

extension HeroDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Appears in:"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "comicCell") else { return UITableViewCell() }
        
        cell.textLabel?.text = viewModel.comicTitle(for: indexPath)
        return cell
    }
}

extension HeroDetailsViewController: StoryboardInstantiable {
    static var viewControllerID: String {
        return "HeroDetailsViewController"
    }
    
    static var storyboardIdentifier: String {
        return "HeroDetails"
    }
}
