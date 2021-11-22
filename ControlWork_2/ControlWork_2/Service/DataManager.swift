//
//  DataManager.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import UIKit
import Combine

//MARK: - API Service

class DataManager {

    private let activityUrl = "https://www.boredapi.com/api/activity"

    var publisher: AnyPublisher<ActivityData, Error> {
        let url = URL(string: activityUrl)!

        return URLSession.shared.dataTaskPublisher(for: url)
            .compactMap { $0.data }
            .decode(type: ActivityData.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

}
