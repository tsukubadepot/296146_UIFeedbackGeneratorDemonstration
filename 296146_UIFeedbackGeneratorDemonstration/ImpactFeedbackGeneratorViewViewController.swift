//
//  ImpactFeedbackGeneratorViewViewController.swift
//  296146_UIFeedbackGeneratorDemonstration
//
//  Created by Jun Yamashita on 2020/10/06.
//

import UIKit

class ImpactFeedbackGeneratorView: UIViewController {
    @IBOutlet weak var switchView: UIView!
    @IBOutlet weak var flexibilitySwitch: UISwitch!
    @IBOutlet weak var intensityLabel: UILabel!
    @IBOutlet weak var intensityView: UIView!
    @IBOutlet weak var intensitySlider: UISlider!
    @IBOutlet weak var feedbackStyleView: UIView!
    @IBOutlet weak var feedbackStyleSegment: UISegmentedControl!
    
    var defaultBackgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultBackgroundColor = intensityView.backgroundColor
        
        switchView.layer.borderWidth = 1.0
        switchView.layer.borderColor = UIColor.lightGray.cgColor
        intensityView.layer.borderWidth = 1.0
        intensityView.layer.borderColor = UIColor.lightGray.cgColor
        feedbackStyleView.layer.borderWidth = 1.0
        feedbackStyleView.layer.borderColor = UIColor.lightGray.cgColor
        
        flexibilitySwitch.isOn = false
        
        setFeedbackStyle(flexibilitySwitch.isOn)
        
        updateValue(intensitySlider.value)
    }
    
    private func setFeedbackStyle(_ value: Bool) {
        if value {
            intensityView.alpha = 1.0
            intensityView.backgroundColor = defaultBackgroundColor
            intensitySlider.isEnabled = true
            
            feedbackStyleView.alpha = 0.3
            feedbackStyleSegment.isEnabled = false
            feedbackStyleView.backgroundColor = .gray
        } else {
            intensityView.alpha = 0.3
            intensityView.backgroundColor = .gray
            intensitySlider.isEnabled = false
            
            feedbackStyleView.alpha = 1.0
            feedbackStyleSegment.isEnabled = true
            feedbackStyleView.backgroundColor = defaultBackgroundColor
        }
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        setFeedbackStyle(flexibilitySwitch.isOn)
    }
    
    @IBAction func generateImpact(_ sender: UIButton) {
        if flexibilitySwitch.isOn {
            let feedback = UIImpactFeedbackGenerator()
            
            feedback.impactOccurred(intensity: CGFloat(intensitySlider.value))
        } else {
            let value = [2, 0, 1, 4, 3]
            let style = UIImpactFeedbackGenerator.FeedbackStyle.init(rawValue: value[feedbackStyleSegment.selectedSegmentIndex])!
            
            let feedback = UIImpactFeedbackGenerator(style: style)
        
            feedback.prepare()
            feedback.impactOccurred()
        }
    }
    
    private func updateValue(_ value: Float) {
        intensityLabel.text = String(format: "%.1f", value)
    }
    
    @IBAction func intensityChanged(_ sender: UISlider) {
        updateValue(sender.value)
    }
    
}
