//
//  ResultViewController.swift
//  quizapp
//
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultInPercentLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultInPercentLabel.text = "\(player!.score * 10)%"
        resultLabel.text = player!.getTraditionalGrade()
        player?.score = 0
    }

    @IBAction func tryAgainTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "QuizViewController") as! QuizViewController
        vc.player = self.player
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func mainMenuTapped(_ sender: UIButton) {
        for viewController in (navigationController?.viewControllers)! {
            if viewController is ViewController {
                let vc = viewController as! ViewController
                vc.player = self.player
                navigationController?.popToViewController(vc, animated: true)
                break
            }
        }
    }
}
