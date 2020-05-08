# import pdb
from xml.dom import minidom
from os import system, chdir


def M(x, y):
    return (x, y), f" ({x}, {y})"


def m(a, b, dx, dy):
    """
    Move the pen to point (a,b) + (dx,dy)
    """
    x, y = a + dx, b + dy
    return M(x, y)


def L(a, b, x, y):
    return (x, y), f" -- ({x}, {y})"


def l(a, b, dx, dy):
    x = a + dx
    y = b + dy
    return L(a, b, x, y)


def H(a, b, x):
    return (x, b), f" -- ({x}, {b})"


def h(a, b, dx):
    x = a + dx
    return H(a, b, x)


def V(a, b, y):
    return (a, y), f" -- ({a}, {y})"


def v(a, b, dy):
    y = b + dy
    return V(a, b, y)


def C(a, b, x1, y1, x2, y2, x, y):
    """
    Inputs:
        a (float)
            x coord of starting point
        b (float)
            y coord of starting point
        x1 (float)
            x coord of start control point
        y1 (float)
            y coord of start control point
        x2 (float)
            x coord of end control point
        y2 (float)
            y coord of end control point
        x (float)
            x coord of ending point
        y (float)
            y coord of ending point
    """
    # Is the leading -- desirable?
    return (
        (x, y),
        f" -- ({a}, {b}) .. controls ({x1}, {y1}) and ({x2}, {y2}) .. ({x}, {y})",
    )


def c(a, b, dx1, dy1, dx2, dy2, dx, dy):
    """
    Inputs:
        a (float)
            x coord of previous point
        b (float)
            y coord of previous point
        dx1 (float)
            x shift of start control point relative to (a,b)
        dy1 (float)
            y coord of start control point relative to (a,b)
        dx2 (float)
            x coord of end control point relative to (a,b)
        dy2 (float)
            y coord of end control point relative to (a,b)
        dx (float)
            x shift of end point relative to (a,b)
        dy (float)
            y shift of end point relative to (a,b)
    """
    # control point 1
    cx1 = a + dx1
    cy1 = b + dy1

    # control point 2
    cx2 = a + dx2
    cy2 = b + dy2

    # end point
    ex = a + dx
    ey = b + dy

    return C(a, b, cx1, cy1, cx2, cy2, ex, ey)


def S(a, b, sx1, sy1, sx2, sy2, ex, ey):
    return C(a, b, sx1, sx2, sx2, sy2, ex, ey)


def s(a, b, dx1, dy1, dx2, dy2, dx, dy):
    s1x = a + dx1
    s1y = b + dy1

    # control point 2
    sx2 = a + dx2
    sy2 = b + dy2

    # end point
    ex = a + dx
    ey = b + dy
    return S(a, b, sx1, sy1, sx2, sy2, ex, ey)


def Q(a, b, x1, y1, x, y):
    # Do we want the leading .. ?
    return (x, y), f" -- ({a},{b}) .. controls ({x1}, {y1}) .. ({x},{y})"


def q(a, b, dx1, dy1, dx, dy):
    x, y = a + dx, b + dy
    x1, y1 = a + dx1, b + dy1
    return Q(a, b, x1, y1, x, y)


# def T(x,y):
#     return

# def t(dx,dy):
#     return

# def A(rx, ry, angle, large_arc_flag, sweep_flag, x, y):
#     return

# def a(rx, ry, angle, large_arc_flag, sweep_flag, dx, dy):
#     return


def Z():
    return " -- cycle"


def z():
    return Z()


def parse_path(nc, draw_command, path):
    """
    Takes an svg path, and tries to turn it into TikZ code
    ----------------------------------------------------------------------------
    Inputs:
        nc (float)
            Normalization constant to keep TikZ dimensions slightly reasonable
        draw_command (str)
            TikZ string describing the drawing style
        path (str)
            a string giving the svg representation of the path
    """
    # Default starting coordinates
    a, b = 0, 0

    # Declare names for control point things (to avoid weird indexing hacks)
    # c is for the name of the mode, and the ex/ey are "end x" "end y"
    cx1, cy1, cx2, cy2, cex, cey = [None for i in range(6)]

    # Similarly but for q
    qx1, qy1, qex, qey = [None for i in range(4)]

    # aaand for S. There's gotta be a better way.
    sx1, sy1, sx2, sy2, sex, sey = [None for i in range(6)]

    # String to return
    out_str = ""

    # Svg drawing modes
    modes = [
        "M",
        "m",
        "L",
        "l",
        "H",
        "h",
        "V",
        "v",
        "C",
        "c",
        "S",
        "s",
        "Q",
        "q",
        "T",
        "t",
        "A",
        "a",
        "Z",
        "z",
    ]

    # Break the svg path into components
    parts = path.split(" ")

    for i, part in enumerate(parts):
        # See if we're switching modes
        if part in modes:
            mode = part
            if part in ["M", "m"]:
                # If we already have stuff written to the string, there's a previous command
                # We need to terminate
                if out_str:
                    out_str += ";\n"

                # Initiate the new draw
                out_str += draw_command
            elif part in ["Z", "z"]:
                if out_str:
                    out_str += Z()

            continue  # Skip to get next points

        else:
            if part.split(",") != [""]:

                newpts = [float(num) * nc for num in part.split(",")]
                try:
                    # Extract the x,y coordinates
                    newx, newy = newpts
                    # Oops svg uses the whole "positive y is downwards" thing
                    newy *= -1
                except ValueError as e:
                    # There might be only one value to unpack if the mode is H, h, V, or v
                    newval = newpts[0]
            else:
                mode = None

        # Reset newstr
        newstr = ""

        # Main control flow
        if mode == "M":
            (a, b), newstr = M(newx, newy)

            # SVG spec says whenever more coordinates follow, we switch to
            # lineto commands. Go figure.
            mode = "L"
            out_str += newstr
            continue  # Continue to avoid double execution

        elif mode == "m":
            (a, b), newstr = m(a, b, newx, newy)
            mode = "l"  # see above
            out_str += newstr
            continue

        elif mode == "L":
            (a, b), newstr = L(a, b, newx, newy)

        elif mode == "l":
            (a, b), newstr = l(a, b, newx, newy)

        elif mode == "H":
            (a, b), newstr = H(a, b, newval)

        elif mode == "h":
            (a, b), newstr = h(a, b, newval)

        elif mode == "V":
            # Svg uses the other coordinate system
            newval *= -1
            (a, b), newstr = V(a, b, newval)

        elif mode == "v":
            # Svg uses the other coordinate system
            newval *= -1
            (a, b), newstr = v(a, b, newval)

        elif mode in ["C", "c"]:
            if (cx1 is None) and (cy1 is None):
                cx1, cy1 = newx, newy
                continue
            elif (cx2 is None) and (cy2 is None):
                cx2, cy2 = newx, newy
                continue
            elif (cex is None) and (cey is None):
                cex, cey = newx, newy
                if mode == "C":
                    (a, b), newstr = C(a, b, cx1, cy1, cx2, cy2, cex, cey)
                elif mode == "c":
                    (a, b), newstr = c(a, b, cx1, cy1, cx2, cy2, cex, cey)
                cx1, cy1, cx2, cy2, cex, cey = [None for i in range(6)]

        elif mode in ["Q", "q"]:
            if (qx1 is None) and (qy1 is None):
                qx1, qy1 = newx, newy
                continue
            elif (qex is None) and (qey is None):
                qex, qey = newx, newy
                if mode == "Q":
                    (a, b), newstr = Q(a, b, qx1, qy1, qex, qey)
                elif mode == "q":
                    (a, b), newstr = Q(a, b, qx1, qy1, qex, qey)
                qx1, qy1, qex, qey = [None for i in range(4)]

        elif mode in ["S", "s"]:
            if (sx1 is None) and (sy1 is None):
                # If no previous control point, spec says to assume it's the starting point
                sx1, sy1 = a, b
                continue
            elif (sx2 is None) and (sy2 is None):
                sx2, sy2 = newx, newy
                continue
            elif (sex is None) and (sey is None):
                sex, sey = newx, newy
                if mode == "S":
                    (a, b), newstr = S(a, b, sx1, sy1, sx2, sy2, sex, sey)
                elif mode == "s":
                    (a, b), newstr = S(a, b, sx1, sy1, sx2, sy2, sex, sey)
                else:
                    print("wait, what?")
                sx1, sy1 = (
                    sx2,
                    sy2,
                )  # S uses control points for previous S command (see svg spec)
                a, b = sex, sey
                sx2, sy2, sex, sey = [None for i in range(4)]

        elif mode == "Z" or mode == "z":
            newstr = Z()

        out_str += newstr

    out_str += ";\n"

    return out_str


def get_draw_command(style):
    """
    Use the style attribute in the .svg to get a suitable draw / filldraw / etc. command
    """
    # First, we want to get things in a dict, so we split the string appropriately
    pre_dict_list = [attribute.split(":") for attribute in style.split(";")]
    try:
        sd = dict(pre_dict_list)  # style dict
    except ValueError as e:
        print("Encountered empty stlye dict. Continuing...")
        # We get some valueerrors if there isn't a style tag on the path
        return "\\draw"

    if "opacity" in sd and sd["opacity"] != "none":
        opacity = float(sd["opacity"])
    else:
        opacity = 1

    if "fill" in sd and sd["fill"] != "none":
        try:
            fill_hex = sd["fill"].lstrip("#")
            # fill rgb
            fr, fg, fb = tuple(int(fill_hex[i : i + 2], 16) for i in (0, 2, 4))
            fill = r"{rgb,255:" + f"red,{fr}; green,{fg}; blue,{fb}" + "}"
        except ValueError as e:
            # Custom-defined fill patterns are fairly common (e.g. gradient fills), and cause this to break
            fill = "none"
    else:
        fill = "none"

    if "fill-opacity" in sd and sd["fill-opacity"] != "none":
        fill_opacity = float(sd["fill-opacity"])
    else:
        fill_opacity = 0

    if "stroke" in sd and sd["stroke"] != "none":
        draw_hex = sd["stroke"].lstrip("#")
        if draw_hex == "000000":
            draw = "black"
        else:
            dr, dg, db = tuple(int(draw_hex[i : i + 2], 16) for i in (0, 2, 4))
            draw = r"{rgb,255:" + f"red,{dr}; green,{dg}; blue,{db}" + "}"
    else:
        draw = "none"

    # MAAAAGIC NUMBER@!!!!
    scale_factor = 0.4

    if "stroke-width" in sd:
        width_str = sd["stroke-width"]
        if "px" in width_str:
            width_str = width_str[:-2]
        line_width = str(scale_factor * float(width_str)) + "pt"
    else:
        line_width = "1"

    if "stroke-dasharray" in sd:
        widths = sd["stroke-dasharray"].split(",")
        dash_pattern = ""
        on = True  # I could do some len(widths) % 2 nonsense here but who needs it
        for width in widths:
            if width == "none":
                continue
            else:
                width = str(float(width) * scale_factor)
            if on:
                dash_pattern += f"on {width}pt "
                on = False
            else:
                dash_pattern += f"off {width}pt "
                on = True
        dash_pattern = "{" + dash_pattern + "}"
    else:
        dash_pattern = False
    if (draw != "none") and (fill != "none"):
        if dash_pattern:
            return f"\\filldraw[opacity={opacity}, draw={draw}, fill={fill}, fill opacity={fill_opacity}, line width={line_width}, dash pattern={dash_pattern}]"
        else:
            return f"\\filldraw[opacity={opacity}, draw={draw}, fill={fill}, fill opacity={fill_opacity}, line width={line_width}]"

    elif draw != "none":
        if dash_pattern:
            return f"\\draw[draw={draw}, opacity={opacity}, line width={line_width}, dash pattern={dash_pattern}]"
        else:
            return f"\\draw[draw={draw}, opacity={opacity}, line width={line_width}]"

    else:
        return "\\draw[very thin]"


def get_points(fname):
    doc = minidom.parse(fname)  # parseString also exists

    # Get dims of image so we can shrink it in TikZ
    nodelist = doc.getElementsByTagName("svg")
    viewbox = nodelist[0].getAttribute("viewBox")
    _, _, xdim, ydim = [float(num) for num in viewbox.split(" ")]

    # normalization constant
    nc = 5 / max(xdim, ydim)

    path_strings = [path.getAttribute("d") for path in doc.getElementsByTagName("path")]
    path_styles = [
        path.getAttribute("style") for path in doc.getElementsByTagName("path")
    ]
    doc.unlink()

    return nc, path_strings, path_styles


def convert(fname):
    write_me = "\\documentclass{standalone}\n\\usepackage{tikz}\n\\usepackage{fkmath}\n\\begin{document}\n\\begin{tikzpicture}\n"
    nc, path_strings, path_styles = get_points(fname)
    draw_command = "\\draw "  # TODO: replace this with something using path_styles
    for path, style in zip(path_strings, path_styles):
        draw_command = get_draw_command(style)
        write_me += parse_path(nc, draw_command, path)

    # chdir("tests")
    # wname = "test_conversion"
    wname = fname[:-4]
    tname = wname + ".tex"
    pname = wname + ".pdf"

    write_me += "\\end{tikzpicture}\n\\end{document}"

    with open(tname, "w") as test_file:
        test_file.write(write_me)

    # Use weird rexep to only print errors
    system(f"pdflatex -halt-on-error {tname} | grep '^!.*' -A200 --color=always")
    system(f"zathura {pname} &")
    # chdir("..")
    return


# styles = convert("trefoil.png")
# styles = convert("tests/7_2_out.svg")
