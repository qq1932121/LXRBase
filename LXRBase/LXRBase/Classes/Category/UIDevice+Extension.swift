import UIKit


/// 约束TabBar/导航栏约束适配结构体
public struct Constants {
    
    /// 屏幕宽
    static var ScreenWidth: CGFloat{
        return UIScreen.main.bounds.size.width
    }
    /// 屏幕高
    static var ScreenHeigth: CGFloat{
        return UIScreen.main.bounds.size.height
    }
    /// 屏幕比例
    static var screenScale: CGFloat {
        return UIScreen.main.scale
    }
    /// 是否PhoneX
    static var isPhoneX : Bool{
        return Constants.navBarHeight == 88
    }
    /// 导航栏高度
    static var navBarHeight: CGFloat {
        switch UIDevice.current.kind {
        case .iPhoneX:
            return 88
        default:
            return 64
        }
    }
    /// TabBar高度
    static var tabBarHeight: CGFloat {
        switch UIDevice.current.kind {
        case .iPhoneX:
            return 88
        default:
            return 49
        }
    }
    /// 状态栏高度
    static var statusBarHeight: CGFloat {
        switch UIDevice.current.kind {
        case .iPhoneX:
            return 44
        default:
            return 20
        }
    }
    /// PhoneX内边距适配
    static var adjustInsetForIPhoneX: UIEdgeInsets {
        switch UIDevice.current.kind {
        case .iPhoneX:
            return UIEdgeInsets(top: 0, left: 0, bottom: 34, right: 0)
        default:
            return UIEdgeInsets.zero
        }
    }
}


public extension UIDevice {

    enum DeviceKind: String {
    case iPhone4
    case iPhone5
    case iPhone6
    case iPhone6Plus
    case iPhoneX
    case iPhoneXr_Or_Xs
    case iPad
    case Unknown
  }

    var kind: DeviceKind {
    guard userInterfaceIdiom == .phone else {
      return .iPad
    }

    let result: DeviceKind
    switch UIScreen.main.nativeBounds.height {
    case 960:
      result = .iPhone4
    case 1136:
      result = .iPhone5
    case 1334:
      result = .iPhone6
    case 2208:
      result = .iPhone6Plus
    case 2436,1792:             // 1792 iPhoneXR
      result = .iPhoneX
    default:
      result = .Unknown
    }

    return result
  }
    
    static func isPhone() -> Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }

    static func isPad() -> Bool {
        return UIDevice().userInterfaceIdiom == .pad
    }

    
}
