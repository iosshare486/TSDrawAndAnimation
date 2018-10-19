# 绘图和动画
## 1.提供的功能
### 基于DrawRect画布的基础绘制和CAAnimation的基本动画
## 2.使用方法

### 1.绘制
<pre>
/// 画线
TSContextDrawClass.addLine(context: context, fromPoint: CGPoint(x: 30, y: 50), toPoint: CGPoint(x: 40, y: 55), lineColor: .red)
/// 虚线
TSContextDrawClass.addSquareLine(context: context, fromPoint: CGPoint(x: 30, y: 50), toPoint: CGPoint(x: 40, y: 55), lengths : [3 , 1] , lineColor: .cyan)
//绘制圆
TSContextDrawClass.addCircle(context: context, color: .red, rect: CGRect(x: 0, y: 0, width: 15, height: 15))
//绘制文字
TSContextDrawClass.addText(context: context, rect: CGRect(x: 0, y: 15, width: rect.size.width, height: rect.size.height - 30), text: "556677\n3333\n22", para: NSMutableParagraphStyle(), color: UIColor.yellow, font: UIFont.systemFont(ofSize: 12))
/// 画圆线
TSContextDrawClass.addCircleLine(color: .red, rect: CGRect(x: 10, y: 20, width: 30, height: 30))
/// 画方块
TSContextDrawClass.addDiamonds(context: context, color: .red, rect: CGRect(x: 10, y: 20, width: 30, height: 30))
/// 画圆角矩形线
TSContextDrawClass.drawRoundedRectangle(context: context, size: CGSize(width: 30, height: 30), lineWidth: 3, color: .yellow, radius: 3)
</pre>
### 2.动画
<pre>
CABasicAnimation类扩展基础动画：
///位移动画
public class func positionAnimation (_ fromeValue : Any?,
                                   _ toValue : Any?,
                                   _ duration : CFTimeInterval = 0) -> CABasicAnimation
                                   
///缩放动画
public class func scaleAnimation (_ fromeValue : Any?,
                                      _ toValue : Any?,
                                      _ duration : CFTimeInterval = 0) -> CABasicAnimation

/// 透明度动画
public class func opacityAnimation (_ fromeValue : Any?,
                                  _ toValue : Any?,
                                  _ duration : CFTimeInterval = 0) -> CABasicAnimation
                                  
/// 旋转动画
public class func rotationAnimation (_ fromeValue : Any?,
                                         _ toValue : Any?,
                                         _ duration : CFTimeInterval = 0) -> CABasicAnimation
                                         
/// 绘制轨迹动画
public class func strokeEndAnimation (_ fromeValue : Any?,
                                          _ toValue : Any?,
                                          _ duration : CFTimeInterval = 0) -> CABasicAnimation

</pre>