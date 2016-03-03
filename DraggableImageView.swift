//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Jeremiah Lee on 3/2/16.
//  Copyright © 2016 Marcel Weekes. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet weak var contentView: DraggableImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        get { return contentView.imageView.image }
        set {
            contentView.imageView.image = newValue
        }
    }
    var originalProfileCenter: CGPoint!
    var originalPanStart: CGPoint!
    
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
        let translation = sender.translationInView(sender.view)
        
        if sender.state == UIGestureRecognizerState.Began {
            originalProfileCenter = sender.view!.center
            originalPanStart = point
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("translation.x = \(translation.x)")
            if let profileImageView = sender.view {
                
                let midY = CGRectGetMidY(profileImageView.bounds)
                let maxRotation = CGFloat(15.0)
                var rad = min(translation.x.degreesToRadians, maxRotation.degreesToRadians)

                if translation.x > 0 { // to the right
                    print("rotate clockwise")
                    rad = point.y < midY ? rad : -rad
                    
                } else if translation.x < 0 { // to the left
                    print("rotate counter-clockwise")
                    rad = point.y > midY ? -rad : rad
                }

                profileImageView.center.x = originalProfileCenter.x + translation.x
                profileImageView.center.y = originalProfileCenter.y + translation.y
                profileImageView.transform = CGAffineTransformMakeRotation(rad)
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            if let profileImageView = sender.view {
                if abs(translation.x) < 50 {
                    resetProfileImage()
                } else if translation.x > 50 {
                    profileImageView.center.x = 600
                } else if translation.x < -50 {
                    profileImageView.center.x = -600
                }
            }
        }
    }
    
    func resetProfileImage() {
        contentView.transform = CGAffineTransformIdentity
        contentView.center = originalProfileCenter
    }
}

extension CGFloat {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * CGFloat(M_PI) / 180.0
    }
}