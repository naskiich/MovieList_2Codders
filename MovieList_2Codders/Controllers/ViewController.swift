//
//  ViewController.swift
//  MovieList_2Codders
//
//  Created by Marija Naskova on 17.3.22.
//

import UIKit

class ListMoviesViewController: UIViewController {

    
    var movies: [MoviesData] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue
        collectionView.backgroundColor = UIColor.lightGray
        view.addSubview(collectionView)
        addConstraintsToCollectionView()

        title = "Movie List"
        navigationController?.navigationBar.isTranslucent = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ListMovieCollectionViewCell.self, forCellWithReuseIdentifier: ListMovieCollectionViewCell.identifier)

    }

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    fileprivate func addConstraintsToCollectionView(){
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension ListMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListMovieCollectionViewCell.identifier, for: indexPath) as! ListMovieCollectionViewCell

//        cell.configure(action: movies[indexPath.row])
        cell.layer.cornerRadius = 10.0
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width)-10
        let height: CGFloat = 100
        return CGSize(width: width, height: height)
    }
}

