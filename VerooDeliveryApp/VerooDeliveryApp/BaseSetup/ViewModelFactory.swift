//
//  ViewModelfactory.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 08/06/22.
//

import Foundation

class ViewModelFactory {
    
    static func getViewModel<VM>(viewModel: VM) -> VM {
        switch viewModel {
            case is BaseViewModel:
                return BaseViewModel() as! VM
            default:
                return BaseViewModel() as! VM
        }
    }
    
}
