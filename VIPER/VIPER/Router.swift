//
//  Router.swift
//  VIPER
//
//  Created by Jackie Lu on 2024/10/17.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    var entry: EntryPoint?
        
    static func start() -> any AnyRouter {
        let router = UserRouter()
        
        // Assign VIP
        var view: AnyView = UserViewController()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
