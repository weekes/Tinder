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
    @IBOutlet weak var actionButtonsImageView: UIImageView!
    
    var originalProfileCenter: CGPoint!
    
    @IBOutlet weak var profileImageView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let ryan = UIImage(named: "ryan")
        profileImageView.image = ryan
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

