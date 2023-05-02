//
//  ViewController.swift
//  Animation Fair (HW 3.1)
//
//  Created by Александр Мосолов on 02.05.2023.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    @IBOutlet var springAnimationView: SpringView!
    
    @IBOutlet var buttonToShowAnimation: SpringButton!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    var nextAnimation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonToShowAnimation.titleLabel?.numberOfLines = 2
        buttonToShowAnimation.titleLabel?.textAlignment = NSTextAlignment.center
    }
    
    @IBAction func runSpringAnimation(_ sender: SpringButton) {
        if nextAnimation == "" {
            let startAnimationIndex = Int.random(in: 0...animationTypes.count - 1)
            springAnimationView.animation = animationTypes[startAnimationIndex]
            let animationCurve = Int.random(in: 0...curves.count - 1)
            springAnimationView.curve = curves[animationCurve]
            let randomNumberForForce = Double.random(in: 0...2)
            springAnimationView.force = randomNumberForForce
            let randomNumberForDuration = Double.random(in: 0...2)
            springAnimationView.duration = randomNumberForDuration
            let randomNumberForDelay = Double.random(in: 0...1)
            springAnimationView.delay = randomNumberForDelay
            presetLabel.text = animationTypes[startAnimationIndex]
            curveLabel.text = curves[animationCurve]
            forceLabel.text = String(format: "%.2f", randomNumberForForce)
            durationLabel.text = String(format: "%.2f", randomNumberForDuration)
            delayLabel.text = String(format: "%.2f", randomNumberForDelay)
        } else {
            springAnimationView.animation = nextAnimation
            let animationCurve = Int.random(in: 0...curves.count - 1)
            springAnimationView.curve = curves[animationCurve]
            let randomNumberForForce = Double.random(in: 0...2)
            springAnimationView.force = randomNumberForForce
            let randomNumberForDuration = Double.random(in: 0...2)
            springAnimationView.duration = randomNumberForDuration
            let randomNumberForDelay = Double.random(in: 0...1)
            springAnimationView.delay = randomNumberForDelay
            presetLabel.text = nextAnimation
            curveLabel.text = curves[animationCurve]
            forceLabel.text = String(format: "%.2f", randomNumberForForce)
            durationLabel.text = String(format: "%.2f", randomNumberForDuration)
            delayLabel.text = String(format: "%.2f", randomNumberForDelay)
        }
        
        springAnimationView.animate()
        nextAnimation = getNextAnimationType()
    }
    
    private func getNextAnimationType () -> String {
        let nextAnimationType = animationTypes[Int.random(in: 0...animationTypes.count - 1)]
        buttonToShowAnimation.setTitle(
            "Run to next animation : \(nextAnimationType)", for: .normal)
        return nextAnimationType
    }
    
}

