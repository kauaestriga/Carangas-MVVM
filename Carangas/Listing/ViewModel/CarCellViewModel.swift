//
//  CarCellViewModel.swift
//  Carangas
//
//  Created by Usuário Convidado on 15/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

struct CarCellViewModel: VehicleCellViewModelProtocol {
    
    private var car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    var name: String{
        car.name
    }
    
    var brand: String {
        car.brand.uppercased()
    }
}
