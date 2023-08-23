//
//  BezierPathGroup.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 22/08/2023.
//

import UIKit

class BezierPathGroup: NSObject{

    @objc dynamic public class func drawCanvas1(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 240, height: 120), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 240, height: 120), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 240, y: resizedFrame.height / 120)

        //// Color Declarations
        let color = UIColor(red: 1.000, green: 0.000, blue: 0.000, alpha: 1.000)

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 55.5, y: 78.5))
        bezierPath.addCurve(to: CGPoint(x: 97.5, y: 32.5), controlPoint1: CGPoint(x: 55.5, y: 78.5), controlPoint2: CGPoint(x: 51.5, y: 32.5))
        bezierPath.addCurve(to: CGPoint(x: 145.5, y: 32.5), controlPoint1: CGPoint(x: 143.5, y: 32.5), controlPoint2: CGPoint(x: 145.5, y: 32.5))
        bezierPath.addLine(to: CGPoint(x: 179.5, y: 32.5))
        color.setFill()
        bezierPath.fill()
        UIColor.black.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()


        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 179.5, y: 32.5))
        bezier2Path.addCurve(to: CGPoint(x: 137.5, y: 78.5), controlPoint1: CGPoint(x: 179.5, y: 32.5), controlPoint2: CGPoint(x: 183.5, y: 78.5))
        bezier2Path.addCurve(to: CGPoint(x: 89.5, y: 78.5), controlPoint1: CGPoint(x: 91.5, y: 78.5), controlPoint2: CGPoint(x: 89.5, y: 78.5))
        bezier2Path.addLine(to: CGPoint(x: 55.5, y: 78.5))
        color.setFill()
        bezier2Path.fill()
        UIColor.black.setStroke()
        bezier2Path.lineWidth = 1
        bezier2Path.stroke()
        
        context.restoreGState()

    }




    @objc(StyleKitNameResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}

