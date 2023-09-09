//
//  ViewController.swift
//  LinkedAnimationTask
//
//  Created by Andrii's Macbook  on 07.09.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var animatedView: UIView!
    @IBOutlet weak var slider: UISlider!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedView.layer.cornerRadius = 6
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        print(animatedView.frame.origin)
        print(sender.value)
        
        let transition = CGFloat(sender.value) * (self.view.bounds.width - self.view.layoutMargins.left - animatedView.bounds.width * 1.5)
        let scale = 1 + 0.5 * CGFloat(sender.value)
        let rotated = (.pi / 2) * CGFloat(sender.value)
        UIView.animate(withDuration: 0.5) {
            self.animatedView.transform = CGAffineTransform.identity
                .translatedBy(x: transition, y: 0)
                .scaledBy(x: scale, y: scale)
                .rotated(by: rotated)
        }
    }
    
    @IBAction func touchUpInside(_ sender: UISlider) {
        slider.setValue(slider.maximumValue, animated: true)
        let transition = CGFloat(sender.value) * (self.view.bounds.width - self.view.layoutMargins.left - animatedView.bounds.width * 1.5)
        let scale = 1 + 0.5 * CGFloat(sender.value)
        let rotated = (.pi / 2) * CGFloat(sender.value)
        UIView.animate(withDuration: 0.5) {
            self.animatedView.transform = CGAffineTransform.identity
                .translatedBy(x: transition, y: 0)
                .scaledBy(x: scale, y: scale)
                .rotated(by: rotated)
        }
    }
}

