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
            image.layer.cornerRadius = 5.0
            image.contentMode = .scaleAspectFill
            image.backgroundColor = .lightGray
            image.clipsToBounds = true
            return image
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text="test"
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
        contentView.backgroundColor = .systemBlue
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
        
        titleLabel.frame = CGRect(x: contentView.frame.size.width/3, y: contentView.frame.size.height-90, width: contentView.frame.size.width-10, height: 30)
        descriptionLabel.frame = CGRect(x: contentView.frame.size.width/3, y: contentView.frame.size.height-60, width: contentView.frame.size.width-10, height: 60)
        movieImage.frame = CGRect(x: 5, y: 0, width: contentView.frame.size.width/3.5, height: contentView.frame.size.width-20)
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
        
        // Before we download the image we clear out the old one
        self.movieImage.image = nil
        
        getImageDataFrom(url: posterImageURL)
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionLabel.text = nil
        titleLabel.text = nil
        
    }
    
}


