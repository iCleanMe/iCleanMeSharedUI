//
//  UIImage+Extensions.swift
//
//
//  Created by Nikolai Nobadi on 7/3/24.
//

#if canImport(UIKit)
import UIKit

extension UIImage {
    static func gradientImage(height: CGFloat = 40, colors: [UIColor]? = nil) -> UIImage? {
        let gradientLayer = CAGradientLayer()
        let gradientColors = colors ?? GradientType.seaNight.makeStops().map { UIColor($0.color) }
        
        gradientLayer.frame = CGRect(origin: .zero, size: .init(width: UIScreen.main.bounds.width, height: height))
        gradientLayer.colors = gradientColors.map { $0.cgColor }

        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
#endif
