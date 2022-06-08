//
//  BaseViewController.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 07/06/22.
//

import Foundation
import UIKit

class BaseViewController<T, U>: UIViewController, CoordinatorBoard {

    var coordinator: T?
    var viewModel: U = ViewModelFactory.getViewModel(viewModel: BaseViewModel()) as! U
    
}
