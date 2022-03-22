//
//  MovieDetailsViewController.swift
//  MovieList_2Codders
//
//  Created by Marija Naskova on 21.3.22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var selectedTitle = ""
    var selectedImage = ""
    var selectedOverview = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        titleLabel.text = selectedTitle
        descriptionLabel.text = selectedOverview
        urlString = "https://image.tmdb.org/t/p/w300" + selectedImage
        
        guard let posterImageURL = URL(string: urlString) else {
            self.movieImage.image = UIImage(named: "noImageAvailable")
            return
        }
        
        self.movieImage.image = nil
        
        getImageDataFrom(url: posterImageURL)
        
        title = "Description"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        layoutSubviews()
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(movieImage)
        print(titleLabel)
        print(descriptionLabel)
        print(selectedImage)
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
    
    let titleLabel: UITextView = {
        let label = UITextView()
        label.text="test"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont(name:"ArialRoundedMTBold", size: 15.0)
        return label
    }()
    let descriptionLabel: UITextView = {
        let label = UITextView()
        label.textAlignment = .left
        label.backgroundColor = .systemGray5
        label.layer.cornerRadius = 10.0
        label.isScrollEnabled = false
        label.isEditable = false
        label.font =  UIFont.systemFont(ofSize: 17.0)
        return label
    }()
    
    func layoutSubviews(){
        
        titleLabel.frame = CGRect(x: (view.frame.size.width/2)-150, y: view.frame.size.height/2, width: (view.frame.size.width)-20, height: 40)
        descriptionLabel.frame = CGRect(x: (view.frame.size.width/2)-150, y: (view.frame.size.height/2)+40, width: (view.frame.size.width)-20, height: 200)
        movieImage.frame = CGRect(x: 10, y: 65, width: view.frame.size.width-20, height: (view.frame.size.height/3)+20)
    }
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    private var urlString: String = ""
    
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.movieImage.image = image
                }
            }
        }.resume()
    }
    
}
