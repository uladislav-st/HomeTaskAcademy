import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var firstBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mass = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
//        var text = ""
//        for i in mass {
//            text.append("\(i)")
//            if i != mass.last {
//                text.append(", ")
//            }
//        }
//        label.text = text
        
        let mapped = mass.map{ $0 * 5 }
        print(mapped)
        
        let filt = mass.filter{ $0 % 2 == 0}
        print(filt)
        
        let sorted = mass.sorted(by: >)
        print(sorted)
        
        let reduced = mass.reduce(0, +)
        print(reduced)
        
        let res = div(a: 10, b: 0)
        
        //        if res.trust == true {
        //            print(res.res)
        //        } else {
        //            print("Error")
        //        }
        
        if res.1 == true {
            print(res.0)
        }else{
            print("Error")
        }
        
        // фильтир
        let x = [(1, "x"), (4, "y"), (6, "a")]
        let result = x.map { ($0.0 * $0.0, $0.1) }
                       .filter { $0.0 % 2 == 0 }
                       .sorted { $0.0 < $1.0 }
        print(result)
        // end
    }
    @IBAction func btnPressed(_ sender:UIButton){
        let mass = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        var text = ""
        for i in mass {
            text.append("\(i)")
            if i != mass.last {
                text.append(", ")
            }
        }
        label.text = text
    }
    
    // факториал числа
    func factorial(_ n: Int) -> Int {
        guard n >= 0 else {
            fatalError("Факториал не определен для отрицательных чисел")
        }
        return n == 0 ? 1 : n * factorial(n - 1)
    }
    // end
    
    func div(a: Int, b: Int) -> (Int, Bool) {
        if b == 0 {
            return (0, false)
        } else {
            return (a / b, true)
        }
    }
    
    //    func div(a: Int, b: Int) -> (res: Int, trust: Bool) {
    //        if b == 0 {
    //            return (0, false)
    //        } else {
    //            return (a / b, true)
    //        }
    //    }
    
    
}

