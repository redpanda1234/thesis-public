using Plots
using Colors
plotlyjs()

function twist(θ; r=5, ω=2π^2, ϕ=0)
    if θ == 0
        return [0,0,0]
    else
        return [r * θ^3 * cos(ω/θ + ϕ), r * θ^3 * sin(ω/θ + ϕ), θ]
    end
end

θs = 0:.0001:π
xyz_vals = twist.(θs)
# xs_opp = [-1 * point[1] for point in xyz_vals]
xyz_opp = reverse([[-1*x, -1*y, z] for (x,y,z) in xyz_vals])


append!(xyz_opp, xyz_vals)

xs = [p[1] for p in xyz_opp]
ys = [p[2] for p in xyz_opp]
zs = [p[3] for p in xyz_opp]

lcol= colorant"#D6D7D9"
bcol= colorant"#1D252C"

plot(camera=(60, 25), size=(1500,1000),
     legend=false, background_color=bcol,
     color = lcol)#, grid=false)#, axis=false, ticks=false)

plot!(xs, ys, zs, color=lcol, lw=.5)
