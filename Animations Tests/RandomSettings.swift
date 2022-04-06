//
//  RandomSettings.swift
//  Animations Tests
//
//  Created by Кирилл on 05.04.2022.
//

import Foundation
import UIKit

struct RandomSetting {
    let preset: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
}

extension RandomSetting {
    static func getRandomSetting() -> [RandomSetting] {
        
        var randomSettings: [RandomSetting] = []
        
        let presets = DataManager.shared.preset.shuffled()
        let curves = DataManager.shared.curve.shuffled()
        
        let iterationCount = min(
            presets.count,
            curves.count
        )
        
        for index in 0..<iterationCount {
            let setting = RandomSetting(preset: presets[index],
                                        curve: curves[index],
                                        force: CGFloat.random(in: 1...4),
                                        duration: CGFloat.random(in: 1...4),
                                        delay: CGFloat.random(in: 0...0.5))
            randomSettings.append(setting)
        }
        return randomSettings
    }
}

