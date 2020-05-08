from turtle import *
import svgwrite
from svg_turtle import SvgTurtle
import math


def koch_knot(l, parity, n, scale=1 / 2):
    """
    l: units forward to draw
    n: layers further to go
    """
    if n == 0:
        forward(l)
    else:

        newl = l / 3
        newlmid = newl * math.sqrt(2)

        if parity == 0:
            # Draw left recursive branch
            koch_knot(newl, 0, n - 1)

            # Draw rising leg of middle part
            left(45)
            forward(newlmid)
            left(90)

            # Draw first recursive branch in middle
            koch_knot(scale * newlmid, 1, n - 1)

            # Draw second recursive branch in middle
            left(90)
            koch_knot(scale * newlmid, 1, n - 1)
            left(90)

            # Draw break in curve
            forward(0.4 * newlmid)
            penup()
            forward(0.2 * newlmid)
            pendown()
            forward(0.4 * newlmid)

            left(45)

            # Draw right recursive branch
            koch_knot(newl, 0, n - 1)

        else:
            koch_knot(newl, 1, n - 1)

            right(45)
            forward(newlmid)
            right(90)

            koch_knot(scale * newlmid, 0, n - 1)

            right(90)
            koch_knot(scale * newlmid, 0, n - 1)
            right(90)

            forward(0.4 * newlmid)
            penup()
            forward(0.2 * newlmid)
            pendown()
            forward(0.4 * newlmid)

            right(45)

            koch_knot(newl, 1, n - 1)


def main():
    drawing = svgwrite.Drawing("test_koch_knot.svg", size=("1000px", "1000px"))

    t = SvgTurtle(drawing)
    Turtle._screen = t.screen
    Turtle._pen = t

    speed(0)
    koch_knot(1000, 0, 5)

    drawing.save()


if __name__ == "__main__":

    main()
