//
//  TransactionFraudDetector.swift
//  Fraud_Detection
//
//  Created by Dheeraj Rathore  on 21/07/24.
//

import Foundation
import CoreML


class TransactionFraudDetector{
    
    private func  getModel() -> TransactionFraudDetectionModel? {
        // Load the model
        guard let modelURL = Bundle.main.url(forResource: "TransactionFraudDetectionModel", withExtension: "mlmodelc"),
              let model = try? TransactionFraudDetectionModel(contentsOf: modelURL) else {
            fatalError("Failed to load model")
        }
        return model
    }
    
    
    public func testForFraudTransaction(_ inputArray: MLMultiArray) {
        // Create the model input
        let input = TransactionFraudDetectionModelInput(x: inputArray)
        // get the model
        guard let model = getModel() else {
            return
        }
        // Make prediction
        guard let prediction = try? model.prediction(input: input) else {
            fatalError("Failed to make prediction")
        }
        print(prediction)
        // Output result
        print("Is Fraud: \(prediction.var_16[0].doubleValue)")
        
        let fraudProbability = prediction.var_16[0].doubleValue
        // Output result
        print("Transaction amount: \(inputArray[0])")
        print("Transaction time: \(inputArray[1])")
        print("Transaction distance: \(inputArray[2])")
        print("Latitude: \(inputArray[3])")
        print("Longitude: \(inputArray[4])")
        print("Device type: \(inputArray[5])")
        print("Fraud probability: \(fraudProbability)")
        print("Is Fraud: \(fraudProbability > 0.5 ? "Yes" : "No")")
        
    }
}


