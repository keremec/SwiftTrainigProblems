import UIKit

//MARK: Answer - 1

func isPalindrome(str:String) -> Bool {
    return str == String(str.reversed())
}

//MARK: Answer - 2

func printArrCount(list: [AnyHashable]){
    var count: [AnyHashable: Int] = [:]
    // counting and storing the values
    for item in list{
        count[item] = (count[item] ?? 0) + 1
    }
    // printing the result
    for (key,value) in count{
        print("\(key): \(value)")
    }
}

//MARK: Answer - 3

func printPyramid(value:Int){
    for i in 0...value {
        for _ in 0...i{
            print("*", terminator: "")
        }
        print("")
    }
}


//MARK: Answer - 4
func printPyramidCentered(value:Int){
    var row = value
    let space = value - 1
    for i in 1...value {
        // add space before stars
        for _ in stride(from:row, to: 0, by: -1){
         print(" ", terminator: "")
        }
        // print stars
        for _ in 1...i{
            print("*", terminator: " ")
        }
        // to newline
        print("")
        row -= 1
    }
}

//MARK: Answer - 5.1
func multiplesThereorFive(maxNum:Int) -> Int {
    var sum:Double = 0
    
    var max:Double
    var min:Double
    var inc:Double
    var count:Double
    //Add Multipies of 3
    inc = 3
    max = Double(maxNum) - Double(maxNum % Int(inc))
    min = inc
    count = ((max - min) / inc) + 1
    sum += ((max + min) / 2 ) * count
    
    //Add Multipies of 5
    inc = 5
    max = Double(maxNum) - Double(maxNum % Int(inc))
    min = inc
    count = ((max - min) / inc) + 1
    sum += ((max + min) / 2 ) * count
    
    //Subtract Multipies of 15
    inc = 15
    max = Double(maxNum) - Double(maxNum % Int(inc))
    min = inc
    count = ((max - min) / inc) + 1
    sum -= ((max + min) / 2 ) * count
    return Int(sum)
}

//Max num is included
print(multiplesThereorFive(maxNum: 999))


//MARK: Answer - 5.2
func evenFibonacciSum(maxValue:Int) -> Int {
    
    if(maxValue < 2){
        return 0
    }
    
    var f1 = 0
    var f2 = 2
    var fnext = 0
    var sum = f1 + f2
    
    while (f2 <= maxValue){
        fnext = (4 * f2) + f1
        if(fnext > maxValue){
            break
        }
        f1 = f2
        f2 = fnext
        sum += f2
    }
    
    return sum
}

print(evenFibonacciSum(maxValue: 4000000))

//MARK: Answer - 5.3

func largestPrime(maxValue:Int) -> Int {
    var num = maxValue
    var maxPrime = 0
    
    // first getting rid of the even factors
    while num % 2 == 0 {
       maxPrime = 2
        num /= 2
    }
    
    // check all even numbers between 3 and the root of the number
    for i in stride(from: 3, to: Int(sqrt(Double(num))) + 1, by: 2){
        while num % i == 0{
            maxPrime = i
            num /= i
        }
    }
    
    //Return the input if the input itself is a prime number
    guard maxPrime != 0 else {
        return maxValue
    }
    
    return maxPrime
}

print(largestPrime(maxValue: 600851475143))
