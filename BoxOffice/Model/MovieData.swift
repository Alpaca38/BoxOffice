//
//  MovieData.swift
//  BoxOffice
//
//  Created by 조규연 on 6/5/24.
//

import Foundation

struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [BoxOffice]
}

struct BoxOffice: Codable {
    let rank: String
    let movieNm: String
    let openDt: String
}
