//
//  DreawView.swift
//  TSDrawAndAnimation
//
//  Created by 小铭 on 2018/10/17.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

class DreawView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            
//            TSContextDrawClass.addLine(context: context, fromPoint: CGPoint(x: 30, y: 50), toPoint: CGPoint(x: 40, y: 55), lineColor: .blue)
            //绘制圆
            TSContextDrawClass.addCircle(context: context, color: .red, rect: CGRect(x: 0, y: 0, width: 15, height: 15))
            TSContextDrawClass.addText(context: context, rect: CGRect(x: 0, y: 15, width: rect.size.width, height: rect.size.height - 30), text: "556677\n3333\n22", para: NSMutableParagraphStyle(), color: UIColor.yellow, font: UIFont.systemFont(ofSize: 12))
            TSContextDrawClass.addSquareLine(context: context, fromPoint: CGPoint(x: 30, y: 50), toPoint: CGPoint(x: 40, y: 55), lengths : [3 , 1] , lineColor: .cyan)
        }
    }

}
