//
//  ViewController.swift
//  quizapp
//
//

import UIKit

class ViewController: UIViewController {

    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func startTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "QuizViewController") as! QuizViewController
        vc.player = self.player ?? Player()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func historyTapped(_ sender: UIButton) {
        if player != nil {
            let vc = storyboard?.instantiateViewController(identifier: "HistoryViewController") as! HistoryViewController
            vc.player = self.player
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "You haven't passed any quiz yet!", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
}

