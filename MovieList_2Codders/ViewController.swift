//
//  ViewController.swift
//  MovieList_2Codders
//
//  Created by Marija Naskova on 17.3.22.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    let cellId = "cellId"
    
    func configureLayout() {
        let configuration = UICollectionLayoutListConfiguration(appearance: .grouped)
      collectionView.collectionViewLayout =
        UICollectionViewCompositionalLayout.list(using: configuration)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        collectionView.backgroundColor = UIColor.white
                view.addSubview(collectionView)
        addConstraintsToCollectionView()
        configureLayout()
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
                cell.backgroundColor = UIColor.lightGray
                return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
      
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let width = UIScreen.main.bounds.width
         let height: CGFloat = 100
         return CGSize(width: width, height: height)
    }

}

