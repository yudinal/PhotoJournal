//
//  Extension+date.swift
//  PhotoJournal
//
//  Created by Lilia Yudina on 1/27/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import Foundation

extension String {
    func dateFormater(_ date: Date) -> String {
        let dateFormation = DateFormatter()
        dateFormation.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormation.string(from: date)
    }
}
