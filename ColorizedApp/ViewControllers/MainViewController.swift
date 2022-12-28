//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Дмитрий Поляков on 02.12.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(color: UIColor)
}

// MARK: - MainViewController

final class MainViewController: UIViewController {
    
    // MARK: - Public Properties

    
    // MARK: - Override Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.backgroundColor = view.backgroundColor
        settingsVC.delegate = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IB Actions
    
    @IBAction func SettingsAction(_ sender: UIBarButtonItem) {
        
        
    }
    
    
    // MARK: - Private Methods
    
}

// MARK: - SettingsViewControllerDelegate

extension MainViewController: SettingsViewControllerDelegate {
    
    func setColor(color: UIColor) {
        view.backgroundColor = color
    }

}
