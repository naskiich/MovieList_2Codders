//
//  Response.swift
//  MovieList_2Codders
//
//  Created by Marija Naskova on 18.3.22.
//

import Foundation

let url = "https://api.themoviedb.org/3/movie/550?api_key=b6a9832bcc144add68cf9d0901cb3091"

struct Response: Codable {
    let movieList: MyMovieList
    let status: String
}
struct MyMovieList: Codable {
    let original_title: String
    let overview: String
    let poster_path: String
}
