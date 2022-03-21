//
//  MovieDetailsViewController.swift
//  MovieList_2Codders
//
//  Created by Marija Naskova on 21.3.22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var selectedItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        titleLabel.text = selectedItem
        descriptionLabel.text = selectedItem
        movieImage.image = UIImage(named: selectedItem)
        title = "Description"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        view.addSubview(titleLabel)
        print("You selected cell")
    }
    
    let movieImage: UIImageView! = {
        let image = UIImageView()
        image.layer.cornerRadius = 5.0
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .lightGray
        image.clipsToBounds = true
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text="test"
        label.textColor = UIColor.black
        label.backgroundColor = .systemYellow
        return label
    }()
    let descriptionLabel: UITextField = {
        let label = UITextField()
        //label.numberOfLines = 3
        //label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.text="label testxt lorem ipsum dolor sit amer "
        label.sizeToFit()
        label.backgroundColor = .systemRed
        return label
    }()
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
}
