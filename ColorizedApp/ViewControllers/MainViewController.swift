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

    // MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.backgroundColor = view.backgroundColor
        settingsVC.delegate = self
    }
    
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setColor(color: UIColor) {
        view.backgroundColor = color
    }
}
