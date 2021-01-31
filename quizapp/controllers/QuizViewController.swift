//
//  QuizViewController.swift
//  quizapp
//
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var numberOfQuestionLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var player: Player?
    var quiz = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureQuiz()
        configureView()
        // Do any additional setup after loading the view.
    }
    
    
    func configureQuiz(){
        quiz.append(
            Question(
                question: "What is 1 + 2?",
                options: [
                    Option(option: "1", isAnswer: false),
                    Option(option: "2", isAnswer: false),
                    Option(option: "3", isAnswer: true),
                    Option(option: "4", isAnswer: false)]
            )
        )
        quiz.append(
            Question(
                question: "What is 2 + 2?",
                options: [
                    Option(option: "1", isAnswer: false),
                    Option(option: "2", isAnswer: false),
                    Option(option: "3", isAnswer: false),
                    Option(option: "4", isAnswer: true)]
            )
        )
        quiz.append(
            Question(
                question: "What is 2 + 10?",
                options: [
                    Option(option: "13", isAnswer: false),
                    Option(option: "20", isAnswer: false),
                    Option(option: "12", isAnswer: true),
                    Option(option: "8", isAnswer: false)]
            )
        )
        quiz.append(
            Question(
                question: "What is 1 + 9?",
                options: [
                    Option(option: "10", isAnswer: true),
                    Option(option: "1", isAnswer: false),
                    Option(option: "32", isAnswer: false),
                    Option(option: "4", isAnswer: false)]
            )
        )
        quiz.append(
            Question(
                question: "What is 4 + 9?",
                options: [
                    Option(option: "10", isAnswer: false),
                    Option(option: "13", isAnswer: true),
                    Option(option: "15", isAnswer: false),
                    Option(option: "12", isAnswer: false)]
            )
        )
        quiz.append(
            Question(
                question: "What is 10 + 2?",
                options: [
                    Option(option: "10", isAnswer: false),
                    Option(option: "11", isAnswer: false),
                    Option(option: "12", isAnswer: true),
                    Option(option: "14", isAnswer: false)]
            )
        )
        quiz.append(
            Question(
                question: "What is 9 - 9?",
                options: [
                    Option(option: "0", isAnswer: true),
                    Option(option: "1", isAnswer: false),
                    Option(option: "2", isAnswer: false),
                    Option(option: "-1", isAnswer: false)]
            )
        )
        quiz.append(
            Question(
                question: "What is 23 / 123?",
                options: [
                    Option(option: "0.18692187", isAnswer: false),
                    Option(option: "0.18691187", isAnswer: false),
                    Option(option: "0.18693187", isAnswer: false),
                    Option(option: "0.18699187", isAnswer: true)]
            )
        )
        quiz.append(
            Question(
                question: "What is 12 * 92?",
                options: [
                    Option(option: "1001", isAnswer: false),
                    Option(option: "1010", isAnswer: false),
                    Option(option: "1014", isAnswer: true),
                    Option(option: "1040", isAnswer: false)]
            )
        )
        quiz.append(
            Question(
                question: "What is (15665 * 95562)/1238283?",
                options: [
                    Option(option: "1208", isAnswer: false),
                    Option(option: "1209.54659", isAnswer: false),
                    Option(option: "1208.91487", isAnswer: true),
                    Option(option: "1210.54515", isAnswer: false)]
            )
        )
        quiz.shuffle()
    }
    
    func configureView(){
        let currentQuestion = quiz[0]
        numberOfQuestionLabel.text = "\(11 - quiz.count)/10"
        questionLabel.text = currentQuestion.question
        button1.setTitle(currentQuestion.options[0].option, for: .normal)
        button2.setTitle(currentQuestion.options[1].option, for: .normal)
        button3.setTitle(currentQuestion.options[2].option, for: .normal)
        button4.setTitle(currentQuestion.options[3].option, for: .normal)
    }
    
    
    @IBAction func optionTapped(_ sender: UIButton) {
        let currentQuestion = quiz[0]
        if currentQuestion.options[sender.tag].isAnswer {
            player!.score += 1
        }
        quiz.remove(at: 0)
        if quiz.count > 0 {
            configureView()
        } else {
            let vc = storyboard?.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
            player!.updateHistory()
            vc.player = self.player
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
