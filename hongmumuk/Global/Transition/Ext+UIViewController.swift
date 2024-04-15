//
//  Ext+UIViewController.swift
//  hongmumuk
//
//  Created by Dongwan Ryoo on 4/15/24.
//

import UIKit

extension UIViewController {
    
    //타입을 사용자가 정의한 후, 덧셈기능을 추가하는 프로토콜을 채택해준다.
    //코드 중복과 재사용에 대응하기 좋아서 추상적인 표현 가능.
    func sumInt<T:AdditiveArithmetic>(a:T, b:T) -> T {
        return a + b
    }
    
    func configureBorder<T:UIView>(view:T) {
        
    }
    
    enum TransitionStyle {
        case present
        case presentNavigation
        case presentFullNavigation
        case push
    }
    
    //클래스에 인스턴스를 넘기는게 아니라 클래스 그 자체를 넘기는 것. <T: UIViewController>
    func transition<T: UIViewController>(viewController: T.Type, storyboard: String,  style: TransitionStyle) {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: viewController )) as? T else { return }
        
        switch style {
        case .present:
            present(vc, animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
