# using Plots
using PGFPlotsX
using LinearAlgebra

# pgfplotsx()

xs=range(-2,2,length=20)
ys=range(-2,2,length=20)

n0 = [1, 0, 3] # The normal vector
r0 = [1, 1, 1] # The shift vector

d = -1 * dot(n0, r0)

f(x,y) = -1*(dot(n0, [x,y,0]) + d)/n0[3]

# xyz_pts = [[x, y, f(x,y)] for x in xs for y in ys]

min_lim = "-1.1"
max_lim = "1.1"
tp = @pgf Axis({axis_on_top,
                axis_lines="center",
                xmin=min_lim,
                xmax=max_lim,
                ymin=min_lim,
                ymax=max_lim,
                zmin=min_lim,
                zmax=max_lim,
                },
               Plot3({surf}, Coordinates(xs, ys, f.(xs, ys'))));

# println(tp)
# print_tex(redirect_stdout(), tp)

# \begin{tikzpicture}
# \begin{axis}%
# [width=175pt,tick label style={font=\scriptsize},axis on top,
# axis lines=center,
# y dir=reverse,
# name=myplot,
# ymin=-1.1,ymax=1.1,
# xmin=-1.1,xmax=1.1,
# zmin=-1.1, zmax=1.1
# ]
# \end{axis}
# \node [right] at (myplot.right of origin)[shift={(-20pt,-8pt)}] {\scriptsize $y$};
# \node [above] at (myplot.above origin) [shift={(0,-20pt)}] {\scriptsize $z$};
# \end{tikzpicture}





# plot(x,y,f,st=:surface,camera=(30,30), xlim=(-2,2), ylim=(-2, 2), zlim=(-1, 1), legend=false)
pgfsave("affine-set.pdf", tp)
# savefig("affine-set.pdf")
