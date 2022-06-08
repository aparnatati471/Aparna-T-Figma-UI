//
//  BaseViewModel.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 07/06/22.
//

import Foundation

class BaseViewModel {
    
    var isLoading = Dynamics<Bool>(false)
    var failureMessage = Dynamics<Int?>(nil)
    var authenticationToken = Dynamics<String?>(nil)
    
}
