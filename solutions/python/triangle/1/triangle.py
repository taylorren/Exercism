def equilateral(sides):
    if any(side==0 for side in sides):
        return False
    
    if sides[0]==sides[1] and sides[1] ==sides[2]:
        return True
    return False

def is_triangle(sides): 
    if any(side==0 for side in sides):
        return False
    
    side0=sides[0]
    side1=sides[1]
    side2=sides[2]

    if side0+side1<side2 or side1+side2<side0 or side2+side0<side1:
        return False
    
    return True

def isosceles(sides):
    if not is_triangle(sides): 
        return False
        
    if sides[0]==sides[1] or sides[1] ==sides[2] or sides[2] ==sides[0]:
        return True
    return False

def scalene(sides):
    if not is_triangle(sides): 
        return False
    
    if not isosceles(sides) and not equilateral(sides): 
        return True
    return False
