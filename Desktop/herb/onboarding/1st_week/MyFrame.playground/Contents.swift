import UIKit

enum FrameColor {
    case white, black, yellow, red, blue, green, brown, cyan, purple, pink, orange, gray
}

let letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
               "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

class Frame {

    private(set) var id : String
    var origin : CGPoint
    var size : CGSize
    private(set) var center : CGPoint
    var upperFrame : Frame?
    private(set) var lowerFrame : [Frame] = [Frame]()
    var color : FrameColor = FrameColor.white

    init(origin : CGPoint, size : CGSize) {
        
        self.id = ""
        for index in 0...2 {
            for _ in 0...2 {
                self.id.append(letters[Int.random(in: 0...letters.count-1)])
            }
            if index < 2 {
                self.id.append("-")
            }
        }
        self.origin = origin
        self.size = size
        self.center = CGPoint(x: self.origin.x + self.size.width/2, y: self.origin.y + self.size.height/2)

    }

    convenience init(x : CGFloat, y : CGFloat, width : CGFloat, height : CGFloat) {
        
        self.init(origin : CGPoint(x: x, y: y), size: CGSize(width: width, height: height))

    }
    
    func add(frame : Frame) {
        
        frame.origin = CGPoint(x: frame.origin.x - self.origin.x, y: frame.origin.y - self.origin.y)
        frame.center = CGPoint(x: frame.center.x - self.origin.x, y: frame.center.y - self.origin.y)
        frame.upperFrame = self
        self.lowerFrame.append(frame)
        
    }
    
    func insert(frame : Frame, at index : Int) {
        
        if index > 0 && self.lowerFrame.count >= index {
            
            frame.origin = CGPoint(x: frame.origin.x - self.origin.x, y: frame.origin.y - self.origin.y)
            frame.center = CGPoint(x: frame.center.x - self.origin.x, y: frame.center.y - self.origin.y)
            frame.upperFrame = self
            self.lowerFrame.insert(frame, at: index-1)
        
        }
        
    }

    func removeFromSuper() {
        
        if let upperReal = self.upperFrame {

            self.origin = CGPoint(x: self.origin.x + upperReal.origin.x, y: self.origin.y + upperReal.origin.y)
            self.center = CGPoint(x: self.center.x + upperReal.origin.x, y: self.center.y + upperReal.origin.y)

            //상위 클래스에서 제거
            var index : Int = 0
            for equivalentFrame in upperReal.lowerFrame {
                if equivalentFrame === self {
                    break
                }
                index += 1
            }
            upperReal.lowerFrame.remove(at: index)
            
            //상위클래스 재설정
            self.upperFrame = nil
            
        }
        
    }
    
    func remove(frame : Frame) {
        
        if let upperFrameReal = frame.upperFrame {
            if upperFrameReal === self {
                frame.removeFromSuper()
            }
        }
        
    }
    
    func recursiveDescription(index : Int) -> String {
    
        var str : String = ""
        
        if index > 0 {
            for _ in 0...index {
                str.append(" ")
            }
            str.append("ㄴ ")
        }
        
        str.append("Frame(\(self.id)) \(self.color) origin(x:\(self.origin.x), y:\(self.origin.y)) size(width:\(self.size.width), height:\(self.size.height))\n")
        
        for lower in lowerFrame {
            str.append(lower.recursiveDescription(index: index+1))
        }
        
        return str
    
    }
    
    func hitTest(point : CGPoint) -> Frame? {
        
        if (0 <= point.x && point.x <= self.size.width) && (0 <= point.y && point.y <= self.size.height) {
            
            for lower in lowerFrame.reversed() {
                let newPoint : CGPoint = CGPoint(x: point.x - lower.origin.x, y: point.y - lower.origin.y)
                if let lowerHit = lower.hitTest(point: newPoint) {
                    return lowerHit
                }
            }
            
            return self
            
        }
        else {
            return nil
        }
        
    }
    
    func isPoint(inside: CGPoint) -> Bool {
        
        if (0 <= inside.x && inside.x <= self.size.width) && (0 <= inside.y && inside.y <= self.size.height) {
            return true
        }
        else {
            return false
        }
        
    }
    
    func convert(point: CGPoint, from: Frame?) -> CGPoint {

        var fromPoint = point
        if let fromReal = from {
            fromPoint.x += fromReal.origin.x
            fromPoint.y += fromReal.origin.y
        }
        let convertPoint = CGPoint(x: fromPoint.x - self.origin.x, y: fromPoint.y - self.origin.y)

        return convertPoint

    }

    func convert(point: CGPoint, to: Frame?) -> CGPoint {

        if let toReal = to {
            
            let pointFromWhole = getPointFromWhole(newPoint: point, curFrame: self)
            let originFromWhole = getPointFromWhole(newPoint: toReal.origin, curFrame: toReal)
            
            return CGPoint(x: pointFromWhole.x - originFromWhole.x, y: pointFromWhole.y - originFromWhole.y)

        }
        else {
            return point
        }

    }
    
    func getPointFromWhole(newPoint: CGPoint, curFrame: Frame) -> CGPoint {
        
        if let curUpperFrameReal = curFrame.upperFrame {
            return getPointFromWhole(newPoint: CGPoint(x: newPoint.x + curUpperFrameReal.origin.x, y: newPoint.y + curUpperFrameReal.origin.y), curFrame: curUpperFrameReal)
        }
        else {
            return newPoint
        }
        
    }
    
    
}

var point1 = CGPoint(x: 128, y: 200)
var point2 = CGPoint(x: 255, y: 200)
var point3 = CGPoint(x: 382, y: 200)
var point4 = CGPoint(x: 196, y: 716)
var point5 = CGPoint(x: 324, y: 716)
var point6 = CGPoint(x: 450, y: 716)
var points = [point1, point2, point3, point4, point5, point6]

//example 1
var white = Frame(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 768, height: 1024))

var orange = Frame(origin: CGPoint(x: 20, y: 20), size: CGSize(width: 728, height: 440))
orange.color = FrameColor.orange
var red = Frame(origin: CGPoint(x: 20, y: 484), size: CGSize(width: 352, height: 520))
red.color = FrameColor.red
var blue = Frame(origin: CGPoint(x: 396, y: 484), size: CGSize(width: 352, height: 320))
blue.color = FrameColor.blue
var green = Frame(origin: CGPoint(x: 396, y: 828), size: CGSize(width: 352, height: 176))
green.color = FrameColor.green
white.add(frame: orange)
white.add(frame: red)
white.add(frame: blue)
white.add(frame: green)

var purple = Frame(origin: CGPoint(x: 56, y: 56), size: CGSize(width: 314, height: 372))
purple.color = FrameColor.purple
var gray = Frame(origin: CGPoint(x: 202, y: 90), size: CGSize(width: 512, height: 200))
gray.color = FrameColor.gray
var cyan = Frame(origin: CGPoint(x: 316, y: 140), size: CGSize(width: 256, height: 256))
cyan.color = FrameColor.cyan
orange.add(frame: purple)
orange.add(frame: gray)
orange.add(frame: cyan)

var yellow = Frame(origin: CGPoint(x: 94, y: 694), size: CGSize(width: 200, height: 100))
yellow.color = FrameColor.yellow
red.add(frame: yellow)

print("example 1\n")

print(">> recursiveDescription")
print(white.recursiveDescription(index: 0))

print(">> hitTest")
for point in points {
    if let frameHit = white.hitTest(point: point) {
        print("point\(point) --> Frame(\(frameHit.id)) \(frameHit.color)")
    }
}

print("\n>> point")
print("Frame(\(gray.id)) gray contains")
for index in 0...2 {
    let convertPoint = white.convert(point: points[index], to: gray)
    print("   point\(points[index]) => \(convertPoint) \(gray.isPoint(inside: convertPoint))")
}
print("Frame(\(yellow.id)) yellow contains")
for index in 3...5 {
    let convertPoint = white.convert(point: points[index], to: yellow)
    print("   point\(points[index]) => \(convertPoint) \(yellow.isPoint(inside: convertPoint))")
}

//example 2
cyan.removeFromSuper()
yellow.removeFromSuper()
red.removeFromSuper()

var black = Frame(origin: CGPoint(x: 94, y: 162), size: CGSize(width: 200, height: 100))
black.color = FrameColor.black
orange.insert(frame: black, at: 2)

var pink = Frame(origin: CGPoint(x: 294, y: 688), size: CGSize(width: 200, height: 100))
pink.color = FrameColor.pink
white.add(frame: pink)

var red2 = Frame(origin: CGPoint(x: 20, y: 484), size: CGSize(width: 352, height: 520))
red2.color = FrameColor.red
white.add(frame: red2)

print("\nexample2\n")

print(">> recursiveDescription")
print(white.recursiveDescription(index: 0))

print(">> hitTest")
for point in points {
    if let frameHit = white.hitTest(point: point) {
        print("point\(point) --> Frame(\(frameHit.id)) \(frameHit.color)")
    }
}

print("\n>> point")
print("Frame(\(purple.id)) purple contains")
for index in 0...2 {
    let convertPoint = white.convert(point: points[index], to: purple)
    print("   point\(points[index]) => \(convertPoint) \(purple.isPoint(inside: convertPoint))")
}
print("Frame(\(red.id)) red contains")
for index in 3...5 {
    let convertPoint = white.convert(point: points[index], to: red)
    print("   point\(points[index]) => \(convertPoint) \(red.isPoint(inside: convertPoint))")
}
