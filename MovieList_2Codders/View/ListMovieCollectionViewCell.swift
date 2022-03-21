//
//  ListMovieCollectionViewCell.swift
//  MovieList_2Codders
//
//  Created by Marija Naskova on 20.3.22.
//

import UIKit

class ListMovieCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "ListMovieCollectionViewCell"
    
    let movieImage: UIImageView! = {
        let image = UIImageView()
        image.layer.cornerRadius = 10.0
        image.contentMode = .scaleToFill
        image.backgroundColor = .lightGray
        image.clipsToBounds = true
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text="test"
        label.font = UIFont(name:"ArialRoundedMTBold", size: 15.0)
        return label
    }()
    let descriptionLabel: UITextView = {
        let label = UITextView()
        label.textAlignment = .left
        label.backgroundColor = .systemGray5
        label.isScrollEnabled = false
        label.font = UIFont(name:"ArialRoundedMT", size: 10.0)
        return label
    }()
    
    
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
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray5
        contentView.layer.cornerRadius = 10.0
        contentView.clipsToBounds = true
        contentView.addSubview(movieImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = CGRect(x: contentView.frame.size.width/3, y: contentView.frame.size.height-120, width: contentView.frame.size.width-10, height: 30)
        descriptionLabel.frame = CGRect(x: (contentView.frame.size.width/3)-5, y: contentView.frame.size.height-90, width: (contentView.frame.size.width)-100, height: 80)
        movieImage.frame = CGRect(x: 5, y: 5, width: contentView.frame.size.width/3.5, height: contentView.frame.size.height-10)
    }
    public func configure(action: Movie){
        updateUI(title: action.title, overview: action.overview, poster: action.posterImage)
    }
    private var urlString: String = ""
    private func updateUI(title: String?, overview: String?, poster: String?) {
        
        self.titleLabel.text = title
        self.descriptionLabel.text = overview
        
        guard let posterString = poster else {return}
        urlString = "https://image.tmdb.org/t/p/w300" + posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            self.movieImage.image = UIImage(named: "noImageAvailable")
            return
        }
        
        self.movieImage.image = nil
        
        getImageDataFrom(url: posterImageURL)
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionLabel.text = nil
        titleLabel.text = nil
        
    }
    
}


