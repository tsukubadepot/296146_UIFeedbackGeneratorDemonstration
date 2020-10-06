//
//  NotificationFeedbackGeneratorView.swift
//  296146_UIFeedbackGeneratorDemonstration
//
//  Created by Jun Yamashita on 2020/10/06.
//

import UIKit

class NotificationFeedbackGeneratorView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPushed(_ sender: UIButton) {
        let feedback = UINotificationFeedbackGenerator()
        
        feedback.notificationOccurred(UINotificationFeedbackGenerator.FeedbackType.init(rawValue: sender.tag)!)
    }
}

