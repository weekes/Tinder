//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Jeremiah Lee on 3/2/16.
//  Copyright © 2016 Marcel Weekes. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    var originalProfileCenter: CGPoint!
    
    override func drawRect(rect: CGRect) {
    //    imageView.image = image
        let pgr = UIPanGestureRecognizer(target: self, action: "onDrag:")
        imageView.addGestureRecognizer(pgr)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        imageView.frame = bounds
        addSubview(imageView)
            
        // custom initialization logic
    }
    
    func onDrag(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(sender.view)
        let velocity = sender.velocityInView(sender.view)
        let translation = sender.translationInView(sender.view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
//            print("Gesture began at: \(point)")
            originalProfileCenter = sender.view!.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            sender.view?.center.x = originalProfileCenter.x + translation.x
//            self.view.center.x = originalProfileCenter.x + translation.x
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
        }
    }
}
