//
//  ViewController.swift
//  Animations Tests
//
//  Created by Кирилл on 05.04.2022.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var springAnimationView: SpringView!
    @IBOutlet var springAnimationLabel: UILabel!
    @IBOutlet var buttonLabel: UIButton!
    
    let animations = RandomSetting.getRandomSetting()

    private var settingIndex = 0

    @IBAction func runSpringAnimation(_ sender: SpringButton) {
        springAnimationView.animation = animations[settingIndex].preset
        springAnimationView.curve = animations[settingIndex].curve
        springAnimationView.force = animations[settingIndex].force
        springAnimationView.duration = animations[settingIndex].duration
        springAnimationView.delay = animations[settingIndex].delay
        springAnimationView.animate()

        settingIndex += 1
         
        if settingIndex == springAnimationView.animation.count - 1 {
            settingIndex = 0
        }

        springAnimationLabel.text = "preset: \(springAnimationView.animation) \ncurve: \(springAnimationView.curve) \nforce: \(String(format: "%.2f", springAnimationView.force)) \nduration: \(String(format: "%.2f", springAnimationView.duration)) \ndelay: \(String(format: "%.2f", springAnimationView.delay))"
        
        buttonLabel.setTitle("Run: \(animations[settingIndex].preset)", for: .normal)
    }
}

