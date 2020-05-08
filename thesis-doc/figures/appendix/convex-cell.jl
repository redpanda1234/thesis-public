using PGFPlotsX
using LazySets, Polyhedra





# pts = [randn(3) for _ in 1:30]
pts = [randn(3) for _ in 1:30]
xs = [p[1] for p in pts]
ys = [p[2] for p in pts]
zs = [p[3] for p in pts]



removevredundancy!(p)
pts = vrep(p).V

hull = convex_hull(pts)
P = VPolytope(hull)

ax = @pgf Axis()
p = @pgf Plot3(
    {
        scatter,
        only_marks
    },
    Coordinates(xs, ys, zs)
)
push!(ax, p)
pgfsave("convex-cell-pts.pdf", ax)





# ch = chull(pts)

# chsimps = ch.simplices
# println("Got the simplices")

# ch_pts = ch.points
# # @show ch_pts
# simplices = []
# for simp in ch.simplices
#     coords = [ch_pts[k] for k in simp]
#     push!(simplices, coords)
# end


tri_xs = [p[1] for p in eachrow(pts)]
tri_ys = [p[2] for p in eachrow(pts)]
tri_zs = [p[3] for p in eachrow(pts)]





ax2 = @pgf Axis()
ax3 = @pgf Axis()
for (p1, p2, p3) in combinations(collect(eachrow(pts)), 3)
    xs = [p1[1], p2[1], p3[1]]
    ys = [p1[2], p2[2], p3[2]]
    zs = [p1[3], p2[3], p3[3]]

    tri = @pgf Plot3(
        {
            draw = "black",
            fill = "blue",
            fill_opacity = ".1"
        },
        # Coordinates(tri_xs, tri_ys, tri_zs)
        Coordinates(xs, ys, zs)
    )
    push!(ax2, tri)
end



pgfsave("convex-cell-2.pdf", ax2)

# plot(xs, ys, zs, seriestype=:scatter, aspect_ratio=:equal)


@show vrep(p)
