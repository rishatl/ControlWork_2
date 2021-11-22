//
//  ActivityData.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import Foundation

//MARK: - ActivityData

struct ActivityData: Decodable {

    let activity: String?

    init(activity: String? = nil) {
        self.activity = activity
    }

}
