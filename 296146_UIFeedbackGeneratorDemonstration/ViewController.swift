//
//  ViewController.swift
//  296146_UIFeedbackGeneratorDemonstration
//
//  Created by Jun Yamashita on 2020/10/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let cellTitles = [
        ["UIImpactFeedbackGenerator", "Makes impact feedback when a user interact with an UI."],
        ["UISelectionFeedbackGenerator", "Use selection feedback generators to indicate a change in selection."],
        ["UINotificationFeedbackGenerator", "Use notification feedback generators to indicate successes, failures, and warnings."]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.title = "Simple demos for UIFeedbackGenerator"
     }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueIdentifier = cellTitles[indexPath.row][0]
        performSegue(withIdentifier: segueIdentifier, sender: segueIdentifier)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let title = sender as? String else {
            return
        }
        
        let destinationView = segue.destination
        
        switch segue.destination {
        case is ImpactFeedbackGeneratorView:
            print("ImpactFeedback")
            (destinationView as! ImpactFeedbackGeneratorView).navigationItem.title = title
        case is SelectionFeedbackGeneratorView:
            print("Selection")
            (destinationView as! SelectionFeedbackGeneratorView).navigationItem.title = title
        case is NotificationFeedbackGeneratorView:
            print("Notification")
            (destinationView as! NotificationFeedbackGeneratorView).navigationItem.title = title
        default:
            fatalError("unknown destination")
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = cellTitles[indexPath.row][0]
        cell.detailTextLabel?.text = cellTitles[indexPath.row][1]
        
        return cell
    }
}
