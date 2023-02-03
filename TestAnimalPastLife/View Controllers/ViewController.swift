//
//  ViewController.swift
//  TestAnimalPastLife
//
//  Created by Карина Чадаева on 03.02.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var beginButton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    
    var userName: String = ""
    
    
    //MARK: - Private properties
    private let primaryColor = UIColor(
        red: 213/255,
        green: 255/255,
        blue: 93/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 255/255,
        green: 225/255,
        blue: 186/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradient(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    
    @IBAction func beginButtonAction() {
        if let text = nameTextField.text {
            userName = text
        }
        
        if userName.count == 0 {
            showAlert(title: "Упс! 😿", message: "Введи имя, чтобы иметь возможность пройти тест")
        }
        performSegue(withIdentifier: "showQuestions", sender: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {}
    
    //MARK: - Alert Controller
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
        }
    
    
    //MARK: - Set gradient Background
    func addVerticalGradient(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    
    
    
}
