//
//  ViewController.swift
//  Color Mixer
//
//  Created by XE on 13.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBOutlet weak var redValueSlider: UISlider!
    @IBOutlet weak var greenValueSlider: UISlider!
    @IBOutlet weak var blueValueSlider: UISlider!
    @IBOutlet weak var alphaValueSlider: UISlider!
    
    let minColorValue: Float = 0
    let maxColorValue: Float = 255
//    let minAlphaValue: Float = 0
//    let maxAlphaLabel: Float = 100
    
    var mediumColorValue: Float {
        return (maxColorValue - minColorValue) / 2 + minColorValue
    }
//    var mediumAlphaValue: Float {
//        return (maxAlphaLabel - minAlphaValue) / 2 + minAlphaValue
//    }
    
    var slidersArray: [UISlider] {
        return [redValueSlider, greenValueSlider, blueValueSlider, alphaValueSlider]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetupForSliders()
        
        updateColorView()
    }

    @IBAction func minButtonPressed(_ sender: Any) {
        updateAllSlidersValue(minColorValue)
        
        updateSlidersLabels()
        
        updateColorView()
    }
    @IBAction func mediumButtonPressed(_ sender: Any) {
        updateAllSlidersValue(mediumColorValue)
        
        updateSlidersLabels()
        
        updateColorView()
    }
    @IBAction func maxButtonPressed(_ sender: Any) {
        updateAllSlidersValue(maxColorValue)
        
        updateSlidersLabels()
        
        updateColorView()
    }
    @IBAction func redValueChanged(_ sender: Any) {
        updateSlidersLabels()
        updateColorView()
    }
    @IBAction func greenValueChanged(_ sender: Any) {
        updateSlidersLabels()
        updateColorView()
    }
    @IBAction func blueValueChanged(_ sender: Any) {
        updateSlidersLabels()
        updateColorView()
    }
    
    func updateColorView() {
        let redValue = CGFloat(redValueSlider.value) / CGFloat(maxColorValue)
        let greenValue = CGFloat(greenValueSlider.value) / CGFloat(maxColorValue)
        let blueValue = CGFloat(blueValueSlider.value) / CGFloat(maxColorValue)
        let alphaValue = CGFloat(alphaValueSlider.value) / CGFloat(maxColorValue)
        
        colorView.backgroundColor = UIColor(red: redValue,
                                            green: greenValue,
                                            blue: blueValue,
                                            alpha: alphaValue)
    }
    
    func updateSlidersLabels() {
        redValueLabel.text = "\(Int(redValueSlider.value))"
        greenValueLabel.text = "\(Int(greenValueSlider.value))"
        blueValueLabel.text = "\(Int(blueValueSlider.value))"
        alphaValueLabel.text = "\(Int(alphaValueSlider.value / maxColorValue * 100))%"
    }
    
    func updateAllSlidersValue(_ value: Float) {
        for slider in slidersArray {
            slider.value = value
        }
    }
    
    func setupBoundaryValue(for slider: UISlider) {
        slider.minimumValue = minColorValue
        slider.maximumValue = maxColorValue
    }
    
    func initialSetupForSliders() {
        for slider in slidersArray {
            setupBoundaryValue(for: slider)
        }
        updateAllSlidersValue(mediumColorValue)
        updateSlidersLabels()
    }
}
