//
//  Coordinator.swift
//  TQIBank
//
//  Created by Luis Teodoro on 12/01/22.
//
import UIKit
import Foundation

public enum PresentationType {
    case push(navigation: UINavigationController)
    case present(viewController: UIViewController)
}

public protocol Coordinator: AnyObject {

    associatedtype V: UIViewController
    var view: V? { get set }
    var navigation: UINavigationController? { get set }
    var presentationType: PresentationType? { get set }
    func start(usingPresentation presentation: PresentationType, animated: Bool)
    func stop()
    func start() -> V
}

extension Coordinator {

    public func start() -> V {
        if view == nil {
            fatalError("Error coordinator!")
        }
        return self.view!
    }

    public func start(usingPresentation presentation: PresentationType, animated: Bool = true) {
        presentationType = presentation
        switch presentationType {
        case .push(let navigation)?:
            self.navigation = navigation
            navigation.pushViewController(start(), animated: animated)
        case .present(let navigation)?:
            self.navigation = UINavigationController(rootViewController: start())
            guard let nav = self.navigation else { return }
            nav.modalPresentationStyle = .fullScreen
            navigation.present(nav, animated: animated, completion: nil)
        case .none:
            break
        }
    }

}
