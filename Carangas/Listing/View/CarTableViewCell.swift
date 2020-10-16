//
//  CarTableViewCell.swift
//  Carangas
//
//  Created by Usuário Convidado on 15/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

protocol VehicleCellViewModelProtocol {
    var name: String {get}
    var brand: String {get}
}

class CarTableViewCell: UITableViewCell {

    func configure(with viewModel: VehicleCellViewModelProtocol) {
        textLabel?.text = viewModel.name
        detailTextLabel?.text = viewModel.brand
    }

}
