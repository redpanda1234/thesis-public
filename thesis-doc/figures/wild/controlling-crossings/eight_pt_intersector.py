import svgwrite
from svg_turtle import SvgTurtle

from math import sqrt

from turtle import *
from time import sleep


# Two types of units; a and its mirror image b
def unit_a(l):
    """
    l is the `single-unit length` for this level of the recursion.
    """
    # Something vaugely like this except a 45 degree angle
    #
    #    |\
    # ___| |
    #      |
    # Start drawing
    pendown()

    # Draw horizontal leg in the shape
    # forward(l)

    # Draw up
    left(90)
    forward(l)

    # Draw the slanty part
    right(90 + (90 - 33.69))  # 33.69 is arctan(3/2)
    forward(l * sqrt(13) / 6)  # 13/6 comes from the 3 2 right triangle

    # Draw the retrun
    right(33.69)
    forward(5 * l / 6)


# Two types of units; a and its mirror image b
def unit_b(l):
    """
    l is the `single-unit length` for this level of the recursion.
    """
    # Something vaugely like this except a 45 degree angle
    #
    #  /|
    # | |___ start here
    # |
    #
    # Start drawing
    pendown()

    # Draw horizontal leg in the shape
    # forward(l)

    # Draw up
    right(90)
    forward(l)

    # Draw the slanty part
    left(90 + (90 - 33.69))  # 33.69 is arctan(3/2)
    forward(l * sqrt(13) / 6)  # 13/6 comes from the 3 2 right triangle

    # Draw the retrun
    left(33.69)
    forward(5 * l / 6)


def write_file(draw_func, filename, size):
    """
    Write turtle drawing to file
    """
    drawing = svgwrite.Drawing(filename, size=size)
    drawing.add(drawing.rect(fill="white", size=("100%", "100%")))
    t = SvgTurtle(drawing)
    Turtle._screen = t.screen
    Turtle._pen = t
    draw_func()
    drawing.save()


def drawcurve():
    # pendict = {
    #     "outline" :
    # }
    # pensize(width=1)
    pensize(width=0)
    width(width=1)
    # turtle.pen(pen=None, **)

    penup()
    setheading(180)
    forward(500)
    pendown()
    setheading(45)

    # left(45)
    linit = 800
    l = linit
    while l > 0.005:
        unit_a(l)
        l *= 2 / 3
        unit_b(l)
        l *= 2 / 3

    # Turn east
    setheading(0)
    cpos = position()

    # How long to draw the extensions
    extl = 800 * 1.5

    # How big to make the crossing gap
    gap = 50

    # Extend the strand out
    forward(extl)

    # Return
    setpos(cpos)
    setheading(90)  # North
    penup()
    forward(gap)
    pendown()
    forward(extl - gap)
    penup()

    # Same
    setpos(cpos)
    setheading(270)  # Sout
    penup()
    forward(gap)
    pendown()
    forward(extl - gap)

    return


if __name__ == "__main__":
    # speed(0)

    write_file(drawcurve, "approach-pt.svg", size=("4000px", "4000px"))

    sleep(3)
