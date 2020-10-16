//
//  CarFormViewModel.swift
//  Carangas
//
//  Created by Usuário Convidado on 15/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

protocol CarFormViewModelDelegate: class{
    func onCarCreated(result: Result<Void, APIError>)
    func onCarUpdated(result: Result<Void, APIError>)
}

class CarFormViewModel {
    
    private var car: Car
    private var service = CarAPI()
    weak var delegate: CarFormViewModelDelegate?
    
    init(car: Car? = nil) {
        self.car = car ?? Car()
    }
    
    private var isEditing: Bool {
        car._id != nil
    }
    
    var name: String {
        car.name
    }
    
    var brand: String {
        car.brand
    }
    
    var title: String {
        isEditing ? "Edição" : "Cadastro"
    }
    
    var buttonTitle: String {
        isEditing ? "Alterar carro" : "Cadastrar carro"
    }
    
    var fuelIndex: Int {
        car.gasType
    }
    
    var price: String {
        "\(car.price)"
    }
    
    func saveCar(name: String, brand: String, gasIndex: Int, price: String) {
        car.brand = brand
        car.name = name
        car.gasType = gasIndex
        car.price = Int(price) ?? 0
        
        if isEditing {
            service.updateCar(car) { [weak self] (result) in
                self?.delegate?.onCarUpdated(result: result)
            }
        } else {
            service.createCar(car) { [weak self] (result) in
                self?.delegate?.onCarCreated(result: result)
            }
        }
    }
    
}
