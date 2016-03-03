//
//  CardsViewController.swift
//  Tinder
//
//  Created by Marcel Weekes on 3/2/16.
//  Copyright © 2016 Marcel Weekes. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var navBarImageView: UIImageView!
    @IBOutlet weak var profileImageView: DraggableImageView!
    @IBOutlet weak var actionButtonsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        profileImageView.image = UIImage(named: "ryan")
        
        let actionButtonTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "onActionButtonTap:")
        actionButtonsImageView.userInteractionEnabled = true
        actionButtonsImageView.addGestureRecognizer(actionButtonTapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onActionButtonTap(sender: UITapGestureRecognizer) {
        profileImageView.resetProfileImage()        
    }
}

