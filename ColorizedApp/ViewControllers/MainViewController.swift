//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Дмитрий Поляков on 02.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.backgroundColor = view.backgroundColor
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColor()
    }
    
    // MARK: - IB Actions
    @IBAction func SettingsAction(_ sender: UIBarButtonItem) {
        
        
    }
    
    
    // MARK: - Private Methods
    private func setupColor() {
        let color = CGColor(
            red: CGFloat(1),
            green: CGFloat(0),
            blue: CGFloat(0),
            alpha: 1.0
        )
        view.backgroundColor = UIColor(cgColor: color)
    }
}
