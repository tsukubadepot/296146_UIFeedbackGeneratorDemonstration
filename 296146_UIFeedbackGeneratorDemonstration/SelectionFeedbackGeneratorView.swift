//
//  SelectionFeedbackGeneratorView.swift
//  296146_UIFeedbackGeneratorDemonstration
//
//  Created by Jun Yamashita on 2020/10/06.
//

import UIKit

class SelectionFeedbackGeneratorView: UIViewController {
    @IBOutlet weak var dragView: UIView!
    
    var feedbackGenerator : UISelectionFeedbackGenerator? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func panGestureOnView(_ sender: UIPanGestureRecognizer) {
        print(#function)
        if dragView.bounds.contains(sender.location(in: dragView)) {
            
            switch sender.state {
            case .began:
                
                // Instantiate a new generator.
                feedbackGenerator = UISelectionFeedbackGenerator()
                
                // Prepare the generator when the gesture begins.
                feedbackGenerator?.prepare()
                
            case .changed:
                
                
                // Trigger selection feedback.
                feedbackGenerator?.selectionChanged()
                
                // Keep the generator in a prepared state.
                feedbackGenerator?.prepare()
                
            case .cancelled, .ended, .failed:
                
                // Release the current generator.
                feedbackGenerator = nil
                
            default:
                // Do Nothing.
                break
            }
        } else if let _ = feedbackGenerator {
            // パンしたまま View の外に出た場合
            switch sender.state {
            case .ended, .cancelled, .failed:
                feedbackGenerator = nil
            default:
                // do notiong
                break
            }
        }
    }
}
