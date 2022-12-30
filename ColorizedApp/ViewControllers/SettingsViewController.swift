//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Дмитрий Поляков on 11.11.2022.
//

import UIKit

// MARK: - SettingsViewController

final class SettingsViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    // MARK: - Public Properties
    var backgroundColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = backgroundColor
        
        setToolbar(for: redTextField, greenTextField, blueTextField)
        
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - IB Actions
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            setValue(for: redLabel)
            setValue(for: redTextField)
        case greenSlider:
            setValue(for: greenLabel)
            setValue(for: greenTextField)
        default:
            setValue(for: blueLabel)
            setValue(for: blueTextField)
        }
    }
    
    @IBAction func doneButtonAction() {
        view.endEditing(true)
        
        delegate.setColor(color: colorView.backgroundColor
                          ?? UIColor(
                            red: 1,
                            green: 1,
                            blue: 1,
                            alpha: 1)
        )
        
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                redTextField.text = string(from: redSlider)
            case greenTextField:
                greenTextField.text = string(from: greenSlider)
            default:
                blueTextField.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for sliders: UISlider...) {
        let ciColor = CIColor(color: backgroundColor)
        sliders.forEach { slider in
            switch slider {
            case redSlider:
                redSlider.value = Float(ciColor.red)
            case greenSlider:
                greenSlider.value = Float(ciColor.green)
            default:
                blueSlider.value = Float(ciColor.blue)
            }
        }
    }
    
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setToolbar(for textFields: UITextField...) {
        let toolbar = UIToolbar()
        let done = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneTapped)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        toolbar.items = [flexBarButton, done]
        toolbar.sizeToFit()
        
        textFields.forEach { textField in
            textField.inputAccessoryView = toolbar
        }
    }
    
    @objc private func doneTapped() {
        view.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let textFieldText = textField.text else { return }
        guard let numberValue = Float(textFieldText) else { return }
        
        switch textField {
        case redTextField:
            redSlider.setValue(numberValue, animated: true)
        case greenTextField:
            greenSlider.setValue(numberValue, animated: true)
        default:
            blueSlider.setValue(numberValue, animated: true)
        }
        
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
        
    }
}
