preamble = r"""\documentclass{standalone}
\usepackage{fkmath, tikz, float}
\usetikzlibrary{calc}
\newenvironment{kdiag}{

  \begin{tikzpicture}[scale=2]

    \pgfmathsetmacro{\gap}{.05}
    \pgfmathsetmacro{\sep}{.25}

    \def\coords##1{
      \coordinate (##1) at (##1, 0);
      \coordinate (##1t) at (##1, \sep);
      \coordinate (##1l) at ($(##1, 0) - (\sep, 0)$);
      \coordinate (##1r) at ($(##1, 0) + (\sep, 0)$);
      \coordinate (##1b) at (##1, -\sep);
    }

    \def\upc##1{
      \coords{##1}
      \draw[-latex] (##1l) -- ($(##1) - (\gap, 0)$);
      \draw[-latex] ($(##1) + (\gap, 0)$) -- (##1r);
      \draw[-latex] (##1t) -- (##1b);
    }

    \def\unc##1{
      \coords{##1}
      \draw[-latex] (##1l) -- ($(##1) - (\gap, 0)$);
      \draw[-latex] ($(##1) + (\gap, 0)$) -- (##1r);
      \draw[-latex] (##1b) -- (##1t);
    }

    \def\opc##1{
      \coords{##1}
      \draw[-latex] (##1l) -- (##1r);
      \draw[latex-] (##1t) -- ($(##1) + (0, \gap)$);
      \draw[latex-] ($(##1) - (0, \gap)$) -- (##1b);
    }

    \def\onc##1{
      \coords{##1}
      \draw[-latex] (##1l) -- (##1r);
      \draw[-latex] (##1t) -- ($(##1) + (0, \gap)$);
      \draw[-latex] ($(##1) - (0, \gap)$) -- (##1b);
    }
}{\end{tikzpicture}}

\begin{document}
\begin{kdiag}
\upc{1}
\opc{2}
\unc{3}
\onc{4}
"""


def main():
    seqs = [
        "(-1, 2, -3.5, 4.5, -2, 1, -4.5, 3.5)",
        "(-1, -3.5, -2, -4.5)(3.5, 2, 4.5, 1)",
        "(-1, 4.5, -4.5, 2, -2, 3.5, -3.5, 1)",
        "(-1, -2)(-4.5, -3.5)(3.5, 4.5)(2, 1)",
        "(-1, 1, -3.5, 3.5, -2, 2, -4.5, 4.5)",
        "(-1, -4.5, -2, -3.5)(3.5, 1, 4.5, 2)",
        "(-1, 3.5, -4.5, 1, -2, 4.5, -3.5, 2)",
    ]

    for (i, seq) in enumerate(seqs):
        out_str = preamble
        with open(f"4-1-seq-{i}.tex", "w") as f:
            out_str += "% " + str(seq) + "\n"
            out_str += "\\end{kdiag}\n\\end{document}"
            f.write(out_str)


main()
