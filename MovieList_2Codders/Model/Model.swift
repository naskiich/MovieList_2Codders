//
//  Model.swift
//  MovieList_2Codders
//
//  Created by Marija Naskova on 19.3.22.
//

import Foundation

struct MoviesData: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Decodable {
    
    let title: String?
    let posterImage: String?
    let overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case posterImage = "poster_path"
    }
}

