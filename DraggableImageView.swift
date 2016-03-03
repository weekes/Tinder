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
    @IBOutlet var contentView: DraggableImageView!
    // An empty implementation adversely affects performance during animation.
    */

    @IBOutlet var contentView: DraggableImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        get { return contentView.imageView.image }
        set { contentView.imageView.image = newValue }
    }
    var originalProfileCenter: CGPoint!
    
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
        if (self.subviews.count == 0) {
            imageView = UIImageView()
            let nib = UINib(nibName: "DraggableImageView", bundle: nil)
            nib.instantiateWithOwner(self, options: nil)
            contentView.frame = self.bounds
            addSubview(contentView)
            
            let pgr = UIPanGestureRecognizer(target: self, action: "onDrag:")
            contentView.addGestureRecognizer(pgr)
        }
        
        // custom initialization logic
    }
    
    func onDrag(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(sender.view)
        let velocity = sender.velocityInView(sender.view)
        let translation = sender.translationInView(sender.view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            originalProfileCenter = sender.view!.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            if let v = sender.view {
                
                var rad = translation.x.degreesToRadians
                if rad > 45 {
                    rad = 45
                }

                if translation.x > 0 { // to the right
                    print("rotate clockwise")
                    
                    v.transform = CGAffineTransformMakeRotation(rad)
                    
                } else if translation.x < 0 { // to the left
                    print("rotate counter-clockwise")
                    
                    v.transform = CGAffineTransformMakeRotation(-rad)
                }

                v.center.x = originalProfileCenter.x + translation.x
            }
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
        }
    }
}

extension CGFloat {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * CGFloat(M_PI) / 180.0
    }
}