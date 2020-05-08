import svgwrite
from svg_turtle import SvgTurtle

from math import sqrt

from turtle import *
from time import sleep


def drawiter(n, l):
    """
    Draw a wild trefoil based thing
    """
    # Constants
    gap = 0.1
    pgap = 1 - gap  # pregap

    gap *= l
    pgap *= l

    # Since we're drawing recursively it's a complete headache to make
    # sure that we actually have all of the ratios and things
    # perfectly tuned so that we'll always get back to exactly where
    # we want to be in the end.

    # These constants should (?) provide some correction for that.

    # See route.svg for an explanation.
    x1, y1 = position()

    # These vectors give the differences (relative to x1, y1) to
    # calculate the absolute coordinates if we were travelling
    # horizontally.
    v2 = (2 * l, 0)  # Gap here
    v3 = (4 * l, 0)  # Gap here
    v4 = (5 * l, 0)

    # Up
    v5 = (5 * l, 2 * l)

    # Left
    v6 = (2 * l, 2 * l)

    # Down
    v7 = (2 * l, -1 * l)

    # Right
    v8 = (3 * l, -1 * l)

    # Up
    v9 = (3 * l, 0)
    v10 = (3 * l, 1 * l)

    # Right
    v11 = (4 * l, 1 * l)

    # Down
    v12 = (4 * l, -1 * l)

    # Right
    v13 = (6 * l, -1 * l)

    # Up
    v14 = (6 * l, 0)

    # Right
    v15 = (8 * l, 0)

    dvecs = [v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15]

    # Need to figure out how to create all the points based on the
    # current heading
    #
    # Round to compensate for numerical precision errors
    theta = round(heading())

    setheading(theta)

    new_dvecs = []
    for dvec in dvecs:
        x, y = dvec
        if theta == 0 or theta == 360:
            new_dvecs += [(x, y)]
            gapx, gapy = (gap, 0)
        elif theta == 90:
            new_dvecs += [(-y, x)]
            gapx, gapy = (0, gap)
        elif theta == 180:
            new_dvecs += [(-x, -y)]
            gapx, gapy = (-gap, 0)
        elif theta == 270:
            new_dvecs += [(y, -x)]
            gapx, gapy = (0, -gap)

        else:
            print(theta)
    (
        (x2, y2),
        (x3, y3),
        (x4, y4),
        (x5, y5),
        (x6, y6),
        (x7, y7),
        (x8, y8),
        (x9, y9),
        (x10, y10),
        (x11, y11),
        (x12, y12),
        (x13, y13),
        (x14, y14),
        (x15, y15),
    ) = [(x1 + x, y1 + y) for (x, y) in new_dvecs]

    if n == 0:

        def movefunc(new_l):
            return forward(new_l)

    else:

        def movefunc(new_l):
            return drawiter(n - 1, new_l / 8)

    # Forward
    pendown()
    movefunc(l)
    movefunc(pgap)
    setpos(x2 - gapx, y2 - gapy)

    # Mind the gap
    penup()
    setpos(x2 + gapx, y2 + gapy)

    # Forward 2 units to next gap
    pendown()
    movefunc(pgap)
    movefunc(pgap)
    setpos(x3 - gapx, y3 - gapy)

    # Mind the gap
    penup()
    setpos(x3 + gapx, y3 + gapy)

    # Hook up and back around
    pendown()
    movefunc(pgap)
    setpos(x4, y4)

    left(90)
    # Go up two units
    for _ in range(2):
        movefunc(l)

    # Make sure we're in the correct place
    setpos(x5, y5)

    # Go left three units
    left(90)
    for _ in range(3):
        movefunc(l)

    # Make sure we're in the correct place
    setpos(x6, y6)

    # Go down 3 units
    left(90)
    for _ in range(3):
        movefunc(l)

    # Make sure we're in the right place
    setpos(x7, y7)

    # Move right 1 unit
    left(90)
    movefunc(l)

    # See the other comments for commentary.
    setpos(x8, y8)

    # Go up, minding the gap
    left(90)
    movefunc(pgap)
    # setpos(x9 - gapy, y9 - gapx)  # we're rotated here so

    # Mind the gap
    penup()
    forward(gap)
    forward(gap)
    # setpos(x9 + gapy, y9 + gapx)

    # Draw again
    pendown()
    movefunc(pgap)
    setpos(x10, y10)

    right(90)
    movefunc(l)
    setpos(x11, y11)

    right(90)

    # Final crossing
    for _ in range(2):
        movefunc(l)

    setpos(x12, y12)

    left(90)
    for _ in range(2):
        movefunc(l)

    setpos(x13, y13)

    left(90)
    movefunc(l)
    setpos(x14, y14)

    right(90)
    movefunc(l)
    movefunc(l)

    setpos(x15, y15)

    return


def drawcurve(n):
    drawiter(n, 200)
    right(90)
    drawiter(n, 200)
    right(90)
    drawiter(n, 200)
    right(90)
    drawiter(n, 200)


def write_file(draw_func, filename, size=("4000px", "4000px")):
    """
    Write turtle drawing to file
    """
    drawing = svgwrite.Drawing(filename, size=size)
    # drawing.add(drawing.rect(fill="white", size=("100%", "100%")))
    t = SvgTurtle(drawing)
    Turtle._screen = t.screen
    Turtle._pen = t
    draw_func()
    drawing.save()


if __name__ == "__main__":
    # speed(0)

    for n in range(4):

        def drawf():
            return drawcurve(n)

        write_file(drawf, f"everywhere-wild-{n}.svg")

    # sleep(3)
