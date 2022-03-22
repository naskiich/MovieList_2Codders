//
//  ViewController.swift
//  MovieList_2Codders
//
//  Created by Marija Naskova on 17.3.22.
//

import UIKit

class ListMoviesViewController: UIViewController {
    
    
    var movies = [Movie]()
    private var viewModel = MovieViewModel()
    var fetchingMore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        addConstraintsToCollectionView()
        setCollectionViewDellegates()
        collectionView.register(ListMovieCollectionViewCell.self, forCellWithReuseIdentifier: ListMovieCollectionViewCell.identifier)
        self.navigationItem.title = "Your Title"
        print("DATA", movies)
        
    }
    
    func setCollectionViewDellegates() {
        viewModel.fetchPopularMoviesData { [weak self] in
            self?.collectionView.dataSource = self
            self?.collectionView.delegate = self
            self?.collectionView.reloadData()
        }
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
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.configure(action: movie)
        //cell.configure(action: movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let item = movies[indexPath.row]
        //print("You selected cell 123#\(item)!")
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        print(movie)
        let rootVc = MovieDetailsViewController()
        rootVc.selectedTitle = movie.title!
        rootVc.selectedImage = movie.posterImage!
        rootVc.selectedOverview = movie.overview!
        let vc = UINavigationController(rootViewController: rootVc)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width)-10
        let height: CGFloat = 130
        return CGSize(width: width, height: height)
    }
}

