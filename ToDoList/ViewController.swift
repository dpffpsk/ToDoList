//
//  ViewController.swift
//  ToDoList
//
//  Created by won on 2022/08/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task]()
    
    // edit 버튼
    @IBAction func tapEditButton(_ sender: Any) {
        
    }
    
    // add 버튼
    @IBAction func tapAddButton(_ sender: Any) {
        let alert = UIAlertController(title: "TO DO LIST", message: nil, preferredStyle: .alert)
        let success = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
        })
        let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        alert.addAction(success)
        alert.addAction(cancel)
        alert.addTextField()
        
        self.present(alert, animated: true, completion: nil)
        
        self.tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
}
