//
//  TQIRouter.swift
//  TQIBank
//
//  Created by Roberth Diorges on 12/01/22.
//

public protocol RouterDelegate {
    func coordinator(for location: RouterLocation) -> Coordinator?
}

public struct TQIRouter {
    
    static var routes: [String : RouterDelegate] = [:]
    
    public static func register(route: String, routerDelegate: RouterDelegate) {
        guard !TQIRouter.routes.contains(where: { $0.key == route }) else {
            fatalError("Esse modulo já registrou uma rota: ( \(route) )")
        }
        
        TQIRouter.routes[route] = routerDelegate
        debugPrint("[PBRouter] Rota registrada com sucesso: \(route)")
     }
    
    public static func coordinator(for location: RouterLocation) -> Coordinator? {
        return TQIRouter.routes[location.path]?.coordinator(for: location)
    }
}
