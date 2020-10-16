//
//  CarFormViewController.swift
//  Carangas
//
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarFormViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tfBrand: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPrice: UITextField!
    @IBOutlet weak var scGasType: UISegmentedControl!
    @IBOutlet weak var btAddEdit: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    // MARK: - Properties
    var viewModel: CarFormViewModel?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - IBActions
    @IBAction func addEdit(_ sender: UIButton) {
        viewModel?.saveCar(name: tfName.text!, brand: tfBrand.text!, gasIndex: scGasType.selectedSegmentIndex, price: tfPrice.text!)
    }
    
    // MARK: - Methods
    private func setupView() {
        
        viewModel?.delegate = self
        
        if let viewModel = viewModel {
            tfName.text = viewModel.name
            tfPrice.text = viewModel.price
            tfBrand.text = viewModel.brand
            scGasType.selectedSegmentIndex = viewModel.fuelIndex
            btAddEdit.setTitle(viewModel.buttonTitle, for: .normal)
            title = viewModel.title
        }
    }
    
    private func checkResult(_ result: Result<Void, APIError>, withError message: String) {
        DispatchQueue.main.async {
            switch result {
            case .success:
                self.navigationController?.popViewController(animated: true)
            case .failure(let apiError):
                Alert.show(title: "Erro", message: "\(message) \(apiError.errorMessage)", presenter: self)
            }
        }
    }
}

extension CarFormViewController: CarFormViewModelDelegate {
    func onCarCreated(result: Result<Void, APIError>) {
        checkResult(result, withError: "Falha ao criar o carro. Motivo:")
    }
    
    func onCarUpdated(result: Result<Void, APIError>) {
        checkResult(result, withError: "Falha ao atualizar o carro. Motivo:")
    }
}
    
