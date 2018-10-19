//
//  ViewController.swift
//  TSDrawAndAnimation
//
//  Created by 小铭 on 2018/10/16.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view = UIView.init(frame: CGRect(x: 100, y: 100, width: 30, height: 30))
        view.backgroundColor = .red
        let rotationA = CABasicAnimation.rotationAnimation(0, Double.pi / 2)

        let point1 = CGPoint(x: 115, y: 115)
        let point2 = CGPoint(x: 185, y: 185)
        let positionA = CABasicAnimation.positionAnimation(point1, point2, 1)
        
        let scalA = CABasicAnimation.scaleAnimation(0.8, 1.6, 0.5)

        let opacityA = CABasicAnimation.opacityAnimation(0.5, 1, 0.5)
        
        let strokeA = CABasicAnimation.strokeEndAnimation(0, 1, 3)
        
        let animationG = CAAnimationGroup()
        animationG.duration = 4
        animationG.fillMode = kCAFillModeForwards
        animationG.isRemovedOnCompletion = false
        animationG.animations = [opacityA,scalA,rotationA,positionA]
        
        view.layer.add(positionA, forKey: nil)
        
        let shapeLayer = CAShapeLayer.init()
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: 200, y: 200))
        path.addLine(to: CGPoint(x: 250, y: 220))
        path.addLine(to: CGPoint(x: 280, y: 250))
        path.addLine(to: CGPoint(x: 200, y: 180))
        path.addLine(to: CGPoint(x: 80, y: 200))
        path.addLine(to: CGPoint(x: 380, y: 250))
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapButt
        shapeLayer.lineJoin = kCALineJoinRound
        
        shapeLayer.add(strokeA, forKey: "strokeAAA")
        
        self.view.layer.addSublayer(shapeLayer)
        
        self.view.addSubview(DreawView.init(frame: CGRect(x: 300, y: 300, width: 60, height: 60)))
        
        self.view.addSubview(view)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
}

