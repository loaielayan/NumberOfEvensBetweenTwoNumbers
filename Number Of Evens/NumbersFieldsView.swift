//
//  ContentView.swift
//  Number Of Evens
//
//  Created by Loai Elayan on 6/13/21.
//

import SwiftUI

struct NumbersFieldsView: View {
    @State private var firstNumber = ""
    @State private var secondNumber = ""
    @State private var resultLabel = ""
    @State private var showingAlert = false
    @State private var activeAlert: ActiveAlert = .first
    //@State private var showingSecondAlert = false
    
    enum ActiveAlert {
        case first, second
    }
    
    var body: some View {

        VStack(alignment: .leading){

            Text("enter the first integer number")
            TextField("First Number", text: $firstNumber)
            Text("enter the second integer number")
            TextField("Second Number", text: $secondNumber)
            
            //Text($resultLabel)
            Text(resultLabel)
            
            Button("Count") {
                self.count()
                
            }
            .alert(isPresented: $showingAlert) {
                switch activeAlert {
                case .first:
                    return Alert(title: Text("Text should be numbers"), message: Text(""), dismissButton: .default(Text("OK")))
                case .second:
                    return Alert(title: Text("First number should be smaller than second number"), message: Text(""), dismissButton: .default(Text("OK")))
                }
                
            }

            
            
            Spacer()
            
            

            
        }.padding()
        
        
    }
    
     func count(){
        
        let firstNum = Int(firstNumber)
        let secondNum = Int(secondNumber)
        

        
        var numberOfEvens = 0


        if validateFirstAndSecondNumbersAreIntegers(first: firstNum, second: secondNum){
            
            if validateFirstNumberIsSmallerThanSecondNumber(first: firstNum!, second: secondNum!){
                
                if firstNum! % 2 == 0 && secondNum! % 2 == 0 { //  the two numbers are even
                    
                    numberOfEvens = (secondNum! - firstNum! / 2) + 1
                    
                }else if firstNum! % 2 != 0 && secondNum! % 2 != 0{ // the two numbers are odd
                    
                    numberOfEvens = (secondNum! - firstNum!) / 2
                    
                }else{ // one of the numbers is odd and the other is even
                    numberOfEvens = ( (secondNum! - firstNum!) + 1 ) / 2
                }

//                var curentNumber = firstNum!
//
//                while curentNumber <= secondNum! {
//                    if curentNumber % 2 == 0{
//                        counter = counter + 1
//                    }
//                    curentNumber = curentNumber + 1
//                }
                
            }else{
                return
            }
            

            
        }else {
 
            return
        }
        


        resultLabel = "number of evens \(numberOfEvens)"
        //return counter
    }
    
    func validateFirstNumberIsSmallerThanSecondNumber(first: Int, second: Int) -> Bool{
        
        if first >= second{
            activeAlert = .second
            showingAlert = true
//            let alert = UIAlertController(title: "first number should be smaller than second number", message: "", preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK", style: .cancel) { (action) in
//
//            }
//            alert.addAction(action)
//            //self.present(alert, animated: true, completion: nil)
            
            return false
        }
        
        return true
        
    }
    
    func validateFirstAndSecondNumbersAreIntegers(first: Int?, second: Int?)->Bool{
        if first == nil || second == nil{
            activeAlert = .first
            showingAlert = true
//            let alert = UIAlertController(title: "text should be numbers", message: "", preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK", style: .cancel) { (action) in
//
//            }
//            alert.addAction(action)
//            //self.present(alert, animated: true, completion: nil)
//            // validation message
            return false
        }
        return true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NumbersFieldsView()
            
        }
    }
}
