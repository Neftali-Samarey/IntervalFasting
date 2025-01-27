//
//  UIColorExtensions.swift
//
//  Created by Mihails Tumkins on 10/02/15.
//

import UIKit

extension UIColor {
    convenience init(r: Int, g:Int , b:Int) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
    }

    class func turquoiseColor()->UIColor {
        return UIColor(r: 26, g: 188, b: 156)
    }

    class func greenSeaColor()->UIColor {
        return UIColor(r: 22, g: 160, b: 133)
    }

    class func emeraldColor()->UIColor {
        return UIColor(r: 46, g: 204, b: 113)
    }

    class func nephritisColor()->UIColor {
        return UIColor(r: 39, g: 174, b: 96)
    }

    class func peterRiverColor()->UIColor {
        return UIColor(r: 52, g: 152, b: 219)
    }

    class func belizeHoleColor()->UIColor {
        return UIColor(r: 41, g: 128, b: 185)
    }

    class func amethystColor()->UIColor {
        return UIColor(r:155, g:89, b:182)
    }

    class func wisteriaColor()->UIColor {
        return UIColor(r:142, g:68, b:173)
    }

    class func wetAsphaltColor()->UIColor {
        return UIColor(r:52, g:73, b:94)
    }

    class func midnightBlueColor()->UIColor { 
        return UIColor(r:44, g:62, b:80)
    }

    class func sunflowerColor()->UIColor {
        return UIColor(r:241, g:196, b:15)
    }


    class func carrotColor()->UIColor {
        return UIColor(r:230, g:126, b:34)
    }

    class func pumpkinColor()->UIColor {
        return UIColor(r:211, g:84, b:0)
    }

    class func alizarinColor()->UIColor {
        return UIColor(r:231, g:76, b:60)
    }

    class func pomergranateColor()->UIColor {
        return UIColor(r:192, g:57, b:43)
    }

    class func cloudsColor()->UIColor {
        return UIColor(r:236, g:240, b:241)
    }

    class func silverColor()->UIColor {
        return UIColor(r:189, g:195, b:199)
    }

    class func concreteColor()->UIColor {
        return UIColor(r:149, g:165, b:166)
    }

    class func asbestosColor()->UIColor {
        return UIColor(r:127, g:140, b:141)
    }
    
    // Added colors
    
    class func fRedColor()->UIColor {
        return UIColor(r:231, g:91, b:76)
    }
    
    class func flatBrown()->UIColor {
        return UIColor(r:130, g:90, b:44)
    }
    
    class func flatSky()->UIColor {
        return UIColor(r:76, g:210, b:218)
    }
    
    class func flatLimeGreen()-> UIColor {
        return UIColor(r: 64, g: 204, b: 117)
    }
    
    class func materialBlue()-> UIColor {
        return UIColor(r: 80, g: 193, b: 233)
    }
    
    class func flatDark()-> UIColor {
        return UIColor(r: Int(0.17), g: Int(0.24), b: Int(0.31))
    }
    
    class func NewBlue()-> UIColor {
        return UIColor(r: Int(17), g: Int(38), b: Int(93))
    }

    class func spanishBlue()-> UIColor {
        return UIColor(r: Int(44), g: Int(44), b: Int(84))
    }
 
    class func darkspanishBlue() -> UIColor {
        return UIColor(r: 64, g: 64, b: 122)
    }
    
    class func dracularDark()-> UIColor {
        return UIColor(r: Int(45), g: Int(52), b: Int(54))
    }
    
    class func blueNights()-> UIColor {
        return UIColor(r: 53, g: 59, b: 72)
    }
    
    // rgb(116, 185, 255)
    class func americanBlue()-> UIColor {
        return UIColor(r: 116, g: 185, b: 255)
    }
    
    class func TipiePink()->UIColor {
        return UIColor(r: 255, g: 26, b: 65)
    }
    

    class func modernEmerald()->UIColor {
        return UIColor(r: 31, g: 192, b: 160)
    }
    
    
    // UI Flat clean Colors
    
    class func UIPinkOrange() -> UIColor {
         return UIColor(r: 230, g: 144, b: 130)
    }
    
    class func UIPinkOrangeDarkerShade() -> UIColor {
        return UIColor(r: 222, g: 125, b: 112)
    }
    
    class func UIMintGreen() -> UIColor {
        return UIColor(r: 164, g: 208, b: 199)
    }
   
}
