//
//  QuestionViewController.swift
//  TestAnimalPastLife
//
//  Created by Карина Чадаева on 03.02.23.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet var questionTextLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var rangeSlider: UISlider! {
        didSet {
            let answersCount = Float(questions[questionIndex].answers.count - 1)
            rangeSlider.maximumValue = answersCount
        }
    }
    @IBOutlet var progressView: UIProgressView!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangeStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var rangeLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    
    //MARK: - Properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    private var currentQuestion: Question {
        questions[questionIndex]
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        
        let currentAnswer = currentAnswers[currentIndex]
        answersChosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    
    @IBAction func answerButtonOfMultipleQuestionPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func answerButtonOfRangeQuestionPressed() {
        let index = lrintf(rangeSlider.value)
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    
    //MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultsVC = segue.destination as! ResultsViewController
        resultsVC.answers = answersChosen
    }
}


//MARK: - Private Methods
extension QuestionViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        
        questionTextLabel.text = currentQuestion.text
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentStackView(for: currentQuestion.type)
    }
    
    private func showCurrentStackView(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .range:
            showRangeStackVeiw(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
        setImage(for: currentQuestion)
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
        setImage(for: currentQuestion)
    }
    
    private func showRangeStackVeiw(with answers: [Answer]) {
        rangeStackView.isHidden = false
        
        for (label, answer) in zip(rangeLabels, answers) {
            label.text = answer.text
        }
        setImage(for: currentQuestion)
    }
    
    private func setImage(for question: Question) {
        imageView.image = UIImage(named: question.imageText)
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResults", sender: nil)
    }
}
