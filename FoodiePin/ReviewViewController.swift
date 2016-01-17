//
//  ReviewViewController.swift
//  FoodiePin
//
//  Created by lily on 11/18/15.
//  Copyright © 2015 Seab Jackson. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var ratingStackView: UIStackView!
    
    var rating: String?
    
    @IBAction func ratingSelected(sender: UIButton) {
        switch (sender.tag) {
        case 100: rating = "dislike"
        case 200: rating = "good"
        case 300: rating = "great"
        default: break
        }
        
        performSegueWithIdentifier("unwindToDetailView", sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let scale = CGAffineTransformMakeScale(0.0 , 0.0)
        
        let translate = CGAffineTransformMakeTranslation(0, 500)
        
        ratingStackView.transform = CGAffineTransformConcat(scale, translate)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransformIdentity
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
