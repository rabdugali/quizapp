//
//  HistoryViewController.swift
//  quizapp
//
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var player: Player?
    var cellID: String = "TableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(HistoryViewController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView()
    }
    
    @objc func back(sender: UIBarButtonItem){
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.popViewController(animated: true)
    }
    
}



extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        player?.history.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
        let score = player?.history[indexPath.row] ?? 0
        cell.attempLabel.text = "\(indexPath.row + 1) attempt"
        cell.scoreLabel.text = "\(score)/10"
        return cell
    }
    
    
}
