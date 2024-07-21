//
//  ContentViewModel.swift
//  Fraud_Detection
//
//  Created by Dheeraj Rathore  on 21/07/24.
//

import Foundation
import CoreML

class ContentViewModel {
        
    init(){
        // call for
        detectFraudTransaction()
    }
    
    
    func detectNonFraudTransaction(){
        do {
            let inputArray = try MLMultiArray(shape: [1, 6], dataType: .double)
            // Fill the input array with example values
            inputArray[0] = 15000 // transaction_amount
            inputArray[1] = 14 // transaction_time
            inputArray[2] = 60 // transaction_distance
            inputArray[3] = 45 // latitude
            inputArray[4] = 90 // longitude
            inputArray[5] = 1 // device_type (1 for 'iOS', 0 for 'Android')
            
            // Likely non-fraudulent transaction
            TransactionFraudDetector().testForFraudTransaction(inputArray)
            
        }
        catch let error{
            print(error)
        }
    }
    
    
    func detectFraudTransaction(){
        do {
            let inputArray = try MLMultiArray(shape: [1, 6], dataType: .double)
            // Fill the input array with example values
            inputArray[0] = 150000 // transaction_amount
            inputArray[1] = 4 // transaction_time
            inputArray[2] = 600 // transaction_distance
            inputArray[3] = 45 // latitude
            inputArray[4] = 90 // longitude
            inputArray[5] = 1 // device_type (1 for 'iOS', 0 for 'Android')
            
            // Likely fraudulent transaction
            TransactionFraudDetector().testForFraudTransaction(inputArray)
            
        }
        catch let error{
            print(error)
        }
    }
}
