import UIKit
import Foundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mass = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15]
        //        let mass = [Int]()
        //        sum(arr: mass)
        //        sum1()
        //        sumArray(arr: mass)
        //        comparNumb(arr: mass)
        
        corpNumb(arr: mass)
        
        let findEvenNumb = evenNumb(arr: mass)
        print(findEvenNumb)
        
        filtMass(arr: mass)
    }
    //    func sumArray (arr: [Int]){
    //        if arr.count != 0{
    //            var res = 0
    //            for item in arr {
    //                res += item
    //            }
    //            print(res)
    //        } else {
    //            print("Нечего считать")
    //        }
    //    }
    
    // Task 1 & 2
    func corpNumb(arr: [Int]){
        let minNum = arr.min()
        let maxNum = arr.max()
        print(maxNum)
        print(minNum)
    }
    // Task 3
    func evenNumb(arr: [Int]) -> [Int]{
        var findNumb : [Int] = []
        for items in arr {
            if items % 2 == 0{
                findNumb.append(items)
            }
        }
        return findNumb
    }
    // Task 4
    func filtMass(arr: [Int]){
        for items in arr{
            if items % 15 == 0 {
                print("FuzzBuzz")
            } else if items % 5 == 0 {
                print("Buzz")
            } else if items % 3 == 0 {
                print("Fuzz")
            }
        }
    }
    //    func sum(arr: [Int]) -> Int{
    //        return arr[0] + arr[1] + arr[2] + arr[3] + arr[4] + arr[5] + arr[6] + arr[7] + arr[8] + arr[9]
    //        }
    //
    //    func sum1(){
    //        let mass = [1, 2, 3, 4]
    //        let sum = mass[0] + mass[1] + mass[2] + mass[3]
    //        print(sum)
    //    }
}
