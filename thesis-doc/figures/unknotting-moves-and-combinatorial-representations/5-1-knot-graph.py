with open("5-1-knot-graph.tex", "w") as myf:

    out_str = r"""\documentclass{standalone}
\usepackage{tikz}

\begin{document}
\begin{tikzpicture}[every node/.style={scale=.75, circle, draw, fill=none,
    inner sep=0pt, text width=1.75em, align=center}, scale=4]

"""

    verts = [1, 2, 3, 4, 5]

    # Arrange them in order of uin, uout, oin, oout
    # These should give the vectors giving the direction of the
    # auxilliary vertex relative to the central one
    auxilliary_verts = [
        [(-1, 0), (1, 0), (0, 1), (0, -1)],  # crossing 1
        [(0, -1), (0, 1), (-1, 0), (1, 0)],
        [(-1, 0), (1, 0), (0, 1), (0, -1)],
        [(0, -1), (0, 1), (-1, 0), (1, 0)],
        [(-1, 0), (1, 0), (0, 1), (0, -1)],
    ]

    dash_lines = [
        ["1oout", "2oin"],
        ["1uout", "2uout"],
        ["2oout", "3oin"],
        ["2uin", "3uin"],
        ["3uout", "4uout"],
        ["3oout", "4oin"],
        ["4uin", "5uin"],
        ["4oout", "5oin"],
        # ["1uin", ".7, -.75", "4, -.75", "5oout"],
        # ["1oin", "2, .75", "5.3, .75", "5uout"],
        # ["5uout", "5.3, -.2", "5.7, -.2", "5.7, 1.2", ".8, 1.2", ".8, .3", "1oin"],
        # ["1uin", ".7, .2", ".3, .2", ".3, -1.2", "5.2, -1.2", "5.2, -.3", "5oout"]
    ]

    lines = [
        ["1uout", "2oin"],
        ["2oout", "3uin"],
        ["3uout", "4oin"],
        ["4oout", "5uin"],
        ["5uout", "5.5, 0", "5.5,1", "1, 1", "1oin"],
        ["1oout", "1, -.5", "2, -.5", "2uin"],
        ["2uout", "2, .5", "3,.5", "3oin"],
        ["3oout", "3, -.5", "4, -.5", "4uin"],
        ["4uout", "4, .5", "5, .5", "5oin"],
        ["5oout", "5, -1", ".5, -1", ".5, 0", "1uin"],
    ]

    # Separation from the auxilliary verts to the center vert
    sep = 0.3
    for v in verts:
        out_str += (
            f"\\node[fill=black!80!white, text=white] ({v}) at ({v}, 0) "
            + "{$"
            + str(v)
            + "^{\\rm mid}$};\n"
        )
        for vstr, vcoords in zip(
            ["uin", "uout", "oin", "oout"], auxilliary_verts[v - 1]
        ):

            # Scale the gap appropriately
            x, y = [coord * sep for coord in vcoords]
            x += v

            if vstr[0] == "u":
                out_str += f"\\node[] "
            else:
                out_str += f"\\node[fill=black!80!white, text=white] "

            out_str += (
                f"({v}{vstr}) at ({x}, {y}) "
                + "{"
                + f"${v}_"
                + vstr[0]
                + "^{\\rm "
                + vstr[1:]
                + "}"
                + "$};\n"
            )

        out_str += (
            f"\\draw[line width=3pt, black!80!white] ({v}oin) -- ({v}) -- ({v}oout);\n"
        )
        out_str += (
            f"\\draw[double, double distance=3pt] ({v}uout) -- ({v}) -- ({v}uin);\n"
        )
        out_str += f"\\draw[black!80!white, dotted, thick] ({v}uin) -- ({v}oin) ({v}uout) -- ({v}oout) ({v}uin) -- ({v}oout) ({v}uout) -- ({v}oin);\n"

    out_str += "\\draw[black!80!white, line width=1.5pt] "
    for line in lines:
        for vert in line:
            out_str += f" ({vert}) --"

        out_str = out_str[:-2]

    out_str += ";\n"

    out_str += "\\draw[dotted, dashed] "
    for line in dash_lines:
        for vert in line:
            out_str += f" ({vert}) --"
        out_str = out_str[:-2]
    out_str += ";\n"

    out_str += r"""\end{tikzpicture}
\end{document}
    """

    myf.write(out_str)
