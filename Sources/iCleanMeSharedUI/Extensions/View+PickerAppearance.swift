//
//  View+PickerAppearance.swift
//
//
//  Created by Nikolai Nobadi on 7/3/24.
//

import SwiftUI

public extension View {
    func setSegmentedPickerAppearance() {
        let gradientColors = [
            UIColor(red: 100/255, green: 149/255, blue: 237/255, alpha: 1),
            UIColor(red: 25/255, green: 25/255, blue: 112/255, alpha: 1),
            UIColor(red: 100/255, green: 149/255, blue: 237/255, alpha: 1)
        ]
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(patternImage: self.gradientImage(size:  CGSize(width: 100, height: 40), colors: gradientColors.map({ $0.cgColor }))!)
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.font: UIFont(name: .boldFont, size: 20)!, .foregroundColor: UIColor.white], for: .selected
        )

        UISegmentedControl.appearance().setTitleTextAttributes(
            [.font: UIFont(name: .boldFont, size: 15)!, .foregroundColor: UIColor.black], for: .normal
        )
    }

    private func getGradientColors(colorScheme: ColorScheme) -> [UIColor] {
        switch colorScheme {
        case .light:
            return [
                UIColor(red: 100/255, green: 149/255, blue: 237/255, alpha: 1),
                UIColor(red: 25/255, green: 25/255, blue: 112/255, alpha: 1),
                UIColor(red: 100/255, green: 149/255, blue: 237/255, alpha: 1)
            ]
        case .dark:
            return [
                UIColor(red: 50/255, green: 75/255, blue: 119/255, alpha: 1),
                UIColor(red: 13/255, green: 13/255, blue: 56/255, alpha: 1),
                UIColor(red: 50/255, green: 75/255, blue: 119/255, alpha: 1)
            ]
        @unknown default:
            // Fallback on earlier versions
            return []
        }
    }
    
    private func gradientImage(size: CGSize, colors: [CGColor]) -> UIImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
