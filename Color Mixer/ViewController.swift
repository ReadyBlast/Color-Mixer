//
//  ViewController.swift
//  Color Mixer
//
//  Created by XE on 13.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redSliderValue: UILabel!
    @IBOutlet weak var greenSliderValue: UILabel!
    @IBOutlet weak var blueSliderValue: UILabel!
    @IBOutlet weak var coloredView: UIView!
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        redSlider.value = (redSlider.maximumValue - redSlider.minimumValue) / 2 + redSlider.minimumValue
        greenSlider.value = (greenSlider.maximumValue - greenSlider.minimumValue) / 2 + greenSlider.minimumValue
        blueSlider.value = (blueSlider.maximumValue - blueSlider.minimumValue) / 2 + blueSlider.minimumValue
        
        colorValueChanger(color: "red", value: redSlider.value)
        colorValueChanger(color: "blue", value: greenSlider.value)
        colorValueChanger(color: "green", value: blueSlider.value)
    }
    
    func colorValueChanger(color: String, value: Float) {
        switch color {
        case "red":
            coloredView.backgroundColor = UIColor(red: CGFloat(value / 255.0), green: CGFloat(greenSlider.value / 255.0), blue: CGFloat(blueSlider.value / 255.0), alpha: CGFloat(1.0))
            redSliderValue.text = "\(Int(redSlider.value))"
        case "green":
            coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value / 255.0), green: CGFloat(value / 255.0), blue: CGFloat(blueSlider.value / 255.0), alpha: CGFloat(1.0))
            greenSliderValue.text = "\(Int(greenSlider.value))"
        case "blue":
            coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value / 255.0), green: CGFloat(greenSlider.value / 255.0), blue: CGFloat(value / 255.0), alpha: CGFloat(1.0))
            blueSliderValue.text = "\(Int(blueSlider.value))"
        default: break
        }
    }
    
    func allColorValuesChanger(value: Float) {
        redSlider.value = value
        blueSlider.value = value
        greenSlider.value = value
        
        colorValueChanger(color: "red", value: value)
        colorValueChanger(color: "blue", value: value)
        colorValueChanger(color: "green", value: value)
    }



    @IBAction func setMinValue(_ sender: Any) {
        allColorValuesChanger(value: 0.0)
    }
    @IBAction func setMediumValue(_ sender: Any) {
        allColorValuesChanger(value: 127.0)
    }
    @IBAction func setMaxValue(_ sender: Any) {
        allColorValuesChanger(value: 255.0)
    }
    
    @IBAction func changeRColorValue(_ sender: Any) {
        colorValueChanger(color: "red", value: redSlider.value)
    }
    
    @IBAction func changeGColorValue(_ sender: Any) {
        colorValueChanger(color: "green", value: greenSlider.value)
    }
    
    @IBAction func changeBColorValue(_ sender: Any) {
        colorValueChanger(color: "blue", value: blueSlider.value)
    }
}

