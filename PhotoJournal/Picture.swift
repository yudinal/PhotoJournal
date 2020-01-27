//
//  Picture.swift
//  PhotoJournal
//
//  Created by Lilia Yudina on 1/27/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import Foundation

struct Picture: Codable, Equatable {
    var photoData: Data
    var photoName: String
    var date: String
}
