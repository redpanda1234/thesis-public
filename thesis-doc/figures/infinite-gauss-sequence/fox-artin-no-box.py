import svgwrite
from svg_turtle import SvgTurtle

from turtle import *
from time import sleep


def draw_first_loop(l):
    """
    l is the `single-unit length` for this level of the recursion.

    On the first drawing, there are two gaps to omit
    """
    yinit = pos()[1]

    pendown()

    # Draw first stroke down
    setheading(270)
    forward(10 * l / 32)

    # Lift to avoid drawing in the gap
    penup()
    forward(l / 16)
    pendown()

    # Draw on the other side of the gap
    forward(l / 16)

    # Set to draw east
    setheading(0)
    forward(30 * l / 32)

    # up-right of ur corner
    ur = (pos()[0] + l / 32, yinit + l / 32)

    # Draw south
    setheading(270)
    forward(5 * l / 32)
    # penup()
    forward(l / 16)
    # pendown()
    forward(28 * l / 32)

    # A little bottom right of br corner
    br = (pos()[0] + l / 32, pos()[1] - l / 32)

    # Draw west
    setheading(180)
    forward(15 * l / 32)
    # penup()
    forward(l / 16)
    # pendown()
    forward(18 * l / 32)

    # A little bottom left of bl corner
    bl = (pos()[0] - l / 32, pos()[1] - l / 32)

    # Draw north
    setheading(90)
    forward(37 * l / 32)
    penup()
    forward(l / 16)

    # Continue past gap
    pendown()
    forward(3 * l / 16)

    # A little up-left for drawing bounding box
    ul = (pos()[0] - l / 32, yinit + l / 32)

    # Go left for start of next loop
    setheading(180)
    forward(7 * l / 32)

    # cpos = pos()
    # penup()
    # setpos(ul)
    # color("blue")
    # pendown()
    # goto(ur)
    # goto(br)
    # goto(bl)
    # goto(ul)
    # penup()
    # setpos(cpos)
    # pendown()
    # color("black")


def draw_loop(l):
    """
    l is the `single-unit length` for this level of the recursion.
    """

    yinit = pos()[1]

    pendown()

    # Draw first stroke down
    setheading(270)
    forward(10 * l / 32)

    # Lift to avoid drawing in the gap
    penup()
    forward(l / 16)
    pendown()

    # Draw on the other side of the gap
    forward(l / 16)

    # Set to draw east
    setheading(0)
    forward(30 * l / 32)

    # up-right of ur corner
    ur = (pos()[0] + l / 32, yinit + l / 32)

    # Draw south
    setheading(270)
    forward(5 * l / 32)
    penup()
    forward(l / 16)
    pendown()
    forward(28 * l / 32)

    # A little bottom right of br corner
    br = (pos()[0] + l / 32, pos()[1] - l / 32)

    # Draw west
    setheading(180)
    forward(15 * l / 32)
    penup()
    forward(l / 16)
    pendown()
    forward(18 * l / 32)

    # A little bottom left of bl corner
    bl = (pos()[0] - l / 32, pos()[1] - l / 32)

    # Draw north
    setheading(90)
    forward(37 * l / 32)
    penup()
    forward(l / 16)

    # Continue past gap
    pendown()
    forward(3 * l / 16)

    # A little up-left for drawing bounding box
    ul = (pos()[0] - l / 32, yinit + l / 32)

    # Go left for start of next loop
    setheading(180)
    forward(7 * l / 32)

    # cpos = pos()
    # penup()
    # setpos(ul)
    # color("blue")
    # pendown()
    # goto(ur)
    # goto(br)
    # goto(bl)
    # goto(ul)
    # penup()
    # setpos(cpos)
    # pendown()
    # color("black")


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


def myloops():
    l = 800
    draw_first_loop(l)
    l /= 2
    while l > 0.005:
        draw_loop(l)
        l /= 2
    return


if __name__ == "__main__":
    # speed(0)

    write_file(myloops, "loops-no-boxes.svg", size=("4000px", "4000px"))

    sleep(3)
