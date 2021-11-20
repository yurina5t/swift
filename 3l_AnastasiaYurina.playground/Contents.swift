import UIKit
import Foundation
import Darwin


// Задание №1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

enum Transmission {
    case manual, auto
}
enum Door {
    case open, close
}
enum Engine {
    case start, turnOff
}
enum Window {
    case open, close
}
struct SportCar {
    let color: UIColor
    let bluetooth: Bool
    let transmission: Transmission
    var maxSpeed: Double
    var doorState: Door
}

struct TrunkCar {
    let color: UIColor
    let bluetooth: Bool
    let transmission: Transmission
    var maxSpeed: Double
    var doorState: Door
}

var Porsche918Spyder = SportCar(color: .red, bluetooth: true, transmission: .auto, maxSpeed: 345.0, doorState: .close)
var AudiR8 = SportCar(color: .blue, bluetooth: true, transmission: .auto, maxSpeed: 332.0, doorState: .close)
var RenaultMagnum = TrunkCar(color: .black, bluetooth: false, transmission: .manual, maxSpeed: 120.0, doorState: .open)

Porsche918Spyder.color
AudiR8.color
Porsche918Spyder.maxSpeed
RenaultMagnum.maxSpeed

// Задание 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

struct SportCar1 {
    var brand: String
    var yearOfRelease: Int
    var bodyVolume: Double
    var EngineStart: Engine
    var windowState: Window
    var nowBodyVolume: Double
}

struct TrunkCar1 {
    var brand: String
    var yearOfRelease: Int
    var bodyVolume: Double
    var EngineStart: Engine
    var windowState: Window
    var nowBodyVolume: Double
}

var Porsche = SportCar1(brand: "Porsche", yearOfRelease: 2020, bodyVolume: 110, EngineStart: .start, windowState: .open, nowBodyVolume: 50.5)
var MAN = TrunkCar1(brand: "MAN", yearOfRelease: 2017, bodyVolume: 4200, EngineStart: .turnOff, windowState: .close, nowBodyVolume: 2150)


Porsche.brand
Porsche.EngineStart
MAN.nowBodyVolume

/* Задание 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
Задание 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
Задание 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.*/

enum actionEngine: String {
    case on = "двигатель запущен"
    case off = "двигатель заглушен"
}
enum actionWindows: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}
enum actionCargo {
    case nullCargo(empty: String)
    case fullCargo(full: String)
    case partCargo(kg: Double)
}

struct SportCar2 {
    var brand: String
    var yearOfRelease: Int
    var Kuzov: actionCargo
    var EngineStart: actionEngine
    var windowState: actionWindows
    
    mutating func actWindows(action: actionWindows){
        switch action{
        case .close:
            print(action.rawValue)
            self.windowState = .close
        case .open:
            print(action.rawValue)
            self.windowState = .open
        }
    }
    mutating func actionEng(action: actionEngine){
        switch action{
        case .on:
            print(action.rawValue)
            self.EngineStart = .on
        case .off:
            print(action.rawValue)
            self.EngineStart = .off
        }
    }
    
    func description(){
        print("Автомобиль \(brand), \(yearOfRelease) года выпуска. Сейчас \(EngineStart.rawValue). \(windowState.rawValue). Кузов \(Kuzov).")
    }
}

struct TruckCar2 {
    var brand: String
    var yearOfRelease: Int
    var Kuzov: actionCargo
    var EngineStart: actionEngine
    var windowState: actionWindows
   
    mutating func actWindows(action: actionWindows){
        switch action{
        case .close:
            print(action.rawValue)
            self.windowState = .close
        case .open:
            print(action.rawValue)
            self.windowState = .open
        }
    }
    mutating func actionEng(action: actionEngine){
        switch action{
        case .on:
            print(action.rawValue)
            self.EngineStart = .on
        case .off:
            print(action.rawValue)
            self.EngineStart = .off
        }
    }
    func description(){
        print("Автомобиль \(brand), \(yearOfRelease) года выпуска. Сейчас \(EngineStart.rawValue). \(windowState.rawValue). Кузов \(Kuzov).")
    }
}

var BMWM8 = SportCar2(brand: "BMW", yearOfRelease: 2020, Kuzov: .nullCargo(empty: "Кузов пустой"), EngineStart: .off, windowState: .close)
var IsuzuElf = TruckCar2(brand: "Isuzu", yearOfRelease: 2017, Kuzov: .partCargo(kg: 120), EngineStart: .on, windowState: .open)

//Задание 6. Вывести значения свойств экземпляров в консоль.


BMWM8.EngineStart
BMWM8.windowState
BMWM8.actionEng(action: .on)
IsuzuElf.actWindows(action: .close)
IsuzuElf.windowState
IsuzuElf.Kuzov

BMWM8.description()
IsuzuElf.description()


