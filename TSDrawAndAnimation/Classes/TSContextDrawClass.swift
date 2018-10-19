//
//  TSContextDrawClass.swift
//  TSDrawAndAnimation
//
//  Created by 小铭 on 2018/10/17.
//  Copyright © 2018年 caiqr. All rights reserved.
//  基础画布画板绘图 （）

import UIKit

public class TSContextDrawClass {
    
    /// 画线
    ///
    /// - Parameters:
    ///   - context: 绘制画布
    ///   - fromPoint: 起始点
    ///   - toPoint: 重点
    ///   - lineWitdh: 线宽
    ///   - lineColor: 线的颜色
    public class func addLine(context : CGContext ,fromPoint : CGPoint, toPoint : CGPoint, lineWitdh: CGFloat = 0.5, lineColor: UIColor) {
        let lengths:[CGFloat] = [lineWitdh,0]
        context.setStrokeColor(lineColor.cgColor);//设置画笔颜色方法一
        context.setLineDash(phase: 0, lengths: lengths)
        context.setLineWidth(lineWitdh)
        context.move(to: fromPoint)//开始点位置
        context.addLine(to: toPoint)//结束点位置
        context.strokePath();
        
    }
    
    /// 虚线
    ///
    /// - Parameters:
    ///   - context: 画布
    ///   - fromPoint: 起始点
    ///   - toPoint: 终点
    ///   - lengths: 线的间隔
    ///   - lineWitdh: 线宽
    ///   - lineColor: 线的颜色
    public class func addSquareLine (context : CGContext,
                                     fromPoint : CGPoint,
                                     toPoint : CGPoint,
                                     lengths : [CGFloat] = [3, 3],
                                     lineWitdh : CGFloat = 0.5,
                                     lineColor : UIColor)  {
        
        context.setLineCap(CGLineCap.square)
        let lengths : [CGFloat] = lengths
        
        context.setStrokeColor(lineColor.cgColor)
        context.setLineWidth(lineWitdh)
        context.setLineDash(phase: 0, lengths: lengths)
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        context.strokePath()
    }
    
    
    /// 画一组线
    ///
    /// - Parameters:
    ///   - context: 画布
    ///   - lineGroup: 绘制点
    ///   - color: 线的颜色
    public class func addOneGroupLine(context : CGContext,
                                      lineGroup : Array<CGPoint>,
                                      color : UIColor) {
        
        for i in 0..<lineGroup.count - 1 {
            
            addLine(context: context, fromPoint: lineGroup[i], toPoint: lineGroup[i + 1], lineColor: color)
        }
        
    }
    
    
    /// 画圆
    ///
    /// - Parameters:
    ///   - context: 画布
    ///   - color: 颜色
    ///   - rect: 绘制区域
    public class func addCircle(context : CGContext,
                                color : UIColor,
                                rect : CGRect) {
        
        context.setFillColor(color.cgColor)
        context.fillEllipse(in : rect)
        context.fillPath()
    }
    
    /// 画圆线
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - rect: 绘制区域
    ///   - lineWidth: 线宽
    public class func addCircleLine(color : UIColor,
                                    rect : CGRect,
                                    lineWidth : CGFloat = 0.5) {
        if lineWidth > 0 {
            let path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height / 2.0)
            path.lineWidth = lineWidth
            color.setStroke()
            path.stroke()
        }
    }
    
    
    /// 画方块
    ///
    /// - Parameters:
    ///   - context: 画布
    ///   - color: 颜色
    ///   - rect: 区域
    public class func addDiamonds(context : CGContext,
                                  color : UIColor,
                                  rect : CGRect) {
        
        //绘制矩形
        context.setFillColor(color.cgColor);
        context.addRect(rect)
        context.fillPath()
    }
    
    /// 画圆角矩形线
    ///
    /// - Parameters:
    ///   - context: 画布
    ///   - size: 大小
    ///   - lineWidth: 线宽
    ///   - color: 颜色
    ///   - radius: 圆角
    public class func drawRoundedRectangle(context : CGContext?,
                                           size:CGSize,
                                           lineWidth : CGFloat,
                                           color : UIColor,
                                           radius : CGFloat){
        if context == nil
        {
            return
        }
        let w : CGFloat = size.width;
        let h : CGFloat = size.height;
        let x : CGFloat = 0
        let y : CGFloat = 0
        context?.setLineWidth(lineWidth)
        context?.setStrokeColor(color.cgColor)
        
        let min = w > h ? h : w
        var radius : CGFloat = radius
        if radius > min
        {
            radius = min / 2;
        }
        
        context?.move(to: CGPoint(x: x, y: h-radius))
        context?.addArc(tangent1End: CGPoint(x: x, y: y), tangent2End: CGPoint(x: w, y: y), radius: radius);
        context?.addArc(tangent1End: CGPoint(x: w, y: y), tangent2End: CGPoint(x: w, y: h), radius: radius);
        context?.addArc(tangent1End: CGPoint(x: w, y: h), tangent2End: CGPoint(x: x, y: h), radius: radius);
        context?.addArc(tangent1End: CGPoint(x: x, y: h), tangent2End: CGPoint(x: x, y: y), radius: radius);
        
        
        context?.strokePath()
        
    }
    
    
    /// 绘制文字
    ///
    /// - Parameters:
    ///   - context: 画布
    ///   - rect: 绘制位置
    ///   - text: 绘制文字内容
    ///   - para: 文字布局设置
    ///   - color: 文字颜色
    ///   - font: 文字字体
    public class func addText(context : CGContext,
                              rect : CGRect,
                              text : NSString,
                              para : NSMutableParagraphStyle,
                              color : UIColor,
                              font : UIFont) {
            
//        let para = NSMutableParagraphStyle()
//        para.lineBreakMode = NSLineBreakMode.byWordWrapping
//        para.alignment = .center
//
        let textAttributes : [NSAttributedStringKey : Any] = [NSAttributedStringKey.font : font,
                                                              NSAttributedStringKey.foregroundColor : color,
                                                              NSAttributedStringKey.paragraphStyle : para]
        
        let size = text.size(withAttributes: textAttributes)
        
        text.draw(in: CGRect(x: rect.origin.x, y: (rect.height - size.height) / 2 + rect.origin.y, width : rect.size.width, height : rect.size.height), withAttributes: textAttributes)
        
    }
}
