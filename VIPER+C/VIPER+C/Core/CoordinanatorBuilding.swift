//
//  CoordinanatorBuilding.swift
//  VIPER+C
//
//  Created by vazov on 15.07.2021.
//

import Foundation

protocol Coordinatable: AnyObject {
    associatedtype InputType
    associatedtype OutputType
    
    func start(with option: InputType, animated: Bool)
    var output: ((OutputType) -> Void)? { get set }
}

typealias CoordinatableFactoryResult<Input, Output> = AnyCoordinatable<Input, Output>

class AnyCoordinatable<InputType, OutputType>: Coordinatable {
    private let setOutputClosure: (((OutputType) -> Void)?) -> Void
    private let getOutputClosure: () -> ((OutputType) -> Void)?
    private let startClosure: (InputType, Bool) -> Void

    init<T: Coordinatable>(_ coordinator: T) where T.InputType == InputType, T.OutputType == OutputType {
        startClosure = { option, animated in
            coordinator.start(with: option, animated: animated)
        }

        getOutputClosure = { () -> ((OutputType) -> Void)? in
            coordinator.output
        }

        setOutputClosure = { output in
            coordinator.output = output
        }
    }

    func start(with option: InputType, animated: Bool) {
        startClosure(option, animated)
    }

    var output: ((OutputType) -> Void)? {
        get {
            getOutputClosure()
        }

        set {
            setOutputClosure(newValue)
        }
    }
}
