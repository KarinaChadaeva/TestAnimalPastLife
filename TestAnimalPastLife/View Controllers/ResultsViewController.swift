//
//  ResultsViewController.swift
//  TestAnimalPastLife
//
//  Created by Карина Чадаева on 03.02.23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var imageAnimal: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    var answers: [Answer]!
    var user: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let maxAnimal = getMaxAnimal()
        updateResult(with: maxAnimal)
    }
    


}

//MARK: - Private Methods
extension ResultsViewController {
    private func getMaxAnimal() -> AnimalType? {
        return Dictionary(grouping: answers, by: { $0.type })
            .sorted(by: { $0.value.count > $1.value.count })
            .first?.key
    }
    
    private func updateResult(with animal: AnimalType?) {
        typeLabel.text = "ты \(animal?.rawValue ?? "❓")!"
        descriptionLabel.text = animal?.definition ?? "Упс! Мы не смогли обработать результат. Возникла ошибка."
        
        switch animal {
        case .lion:
            imageAnimal.image = UIImage(named: "lion.jpeg")
        case .sloth:
            imageAnimal.image = UIImage(named: "sloth.jpeg")
        case .monkey:
            imageAnimal.image = UIImage(named: "monkey.jpeg")
        case .snake:
            imageAnimal.image = UIImage(named: "snake.jpeg")
        default:
            imageAnimal.image = UIImage(named: "img3.jpg")
        }
    }
}
