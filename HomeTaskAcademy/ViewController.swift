import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let number = 2048
        let result = sumOfDigits(of: number)
        print("Сумма = \(result)")
        
        add(a: 3, b: 3)
        add(a: 4.1, b: 3.7)
        add(x: 4, y: 7.2)
        add(x: 4.3, y: 5)
        substract(a: 28, b: 13)
        substract(a: 10.4, b: 7.8)
        substract(x: 10, y: 8.2)
        substract(x: 10.3, y: 8)
        multiply(a: 18, b: 16)
        multiply(a: 4.9, b: 18.9)
        multiply(x: 4, y: 18.9)
        multiply(x: 4.9, y: 18)
        divide(a: 21, b: 7)
        divide(a: 81.9, b: 9.1)
        divide(x: 81, y: 9.1)
        divide(x: 81.9, y: 9)

        
    }
    //universal func
    func add(a: Int, b: Int){
        let sum = a + b
        print(sum)
    }
    func add(a: Double, b: Double){
        let sum = a + b
        print(sum)
    }
    func add(x: Int, y: Double){
        let sum = x + Int(y)
        print(sum)
    }
    func add(x: Double, y: Int){
        let sum = x + Double(y)
        print(sum)
    }
    
    
    func substract(a: Int, b: Int){
        let sum = a - b
        print(sum)
    }
    func substract(a: Double, b: Double){
        let sum = a - b
        print(sum)
    }
    func substract(x: Int, y: Double){
        let sum = x - Int(y)
        print(sum)
    }
    func substract(x: Double, y: Int){
        let sum = x - Double(y)
        print(sum)
    }
    
    
    func multiply(a: Int, b: Int){
        let sum = a * b
        print(sum)
    }
    func multiply(a: Double, b: Double){
        let sum = a * b
        print(sum)
    }
    func multiply(x: Int, y: Double){
        let sum = x * Int(y)
        print(sum)
    }
    func multiply(x: Double, y: Int){
        let sum = x * Double(y)
        print(sum)
    }
    
    
    func divide(a: Int, b: Int){
        let  sum = a / b
        print(sum)
    }
    func divide(a: Double, b: Double){
        let sum = a / b
        print(sum)
    }
    func divide(x: Int, y: Double){
        let sum = x / Int(y)
        print(sum)
    }
    func divide(x: Double, y: Int){
        let sum = x / Double(y)
        print(sum)
    }
    
    
    //end
    
    //sum of digits of a 4-digit number
    func sumOfDigits(of number: Int) -> Int {
        var num = number
        var sum = 0
        
        while num > 0 {
            sum += num % 10
            num /= 10
        }
        return sum
    }
    //end
   
}
