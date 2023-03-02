//
//  ViewController.swift
//  ScreenLogger
//
//  Created by Eren Erten on 4.02.2023.
//

import UIKit

class LogViewController: UIViewController {
    @IBOutlet weak var selam: UITextField!
    
    @IBOutlet weak var addLogButton: UIButton!
    @IBOutlet weak var logTableView: UITableView!
    
    @IBAction func printaction(_ sender: Any) {
        if let text = selam.text{
            text.isEmpty ? () : print(text)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        makeDelegations()
     
    }
    
    func prepareButton(buttonToPrepare:UIButton, title : String){
        buttonToPrepare.setTitle(title, for: .normal)
        buttonToPrepare.layer.cornerRadius = 15
        buttonToPrepare.setTitleColor(.blue, for: .normal)
        buttonToPrepare.backgroundColor = .lightGray
    }
    func makeDelegations(){
        logTableView.dataSource = self
        logTableView.delegate = self
        Logger.delegate = self
    }
    
    func bindUI() {
        prepareButton(buttonToPrepare: addLogButton, title: "Add To Log")
    }
}



extension LogViewController:textSetterDelegate {
    func reloadTable() {
        self.logTableView.reloadData()
    }

}
extension LogViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Logger.logArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogTableViewCell", for: indexPath) as! LogsTableViewCell
        cell.configureCell(Logger.logArray[indexPath.row])
        return cell
    }
    
    
    
}

