using Plots
using Colors
# plotlyjs()

function twist(θ; r=5, ω=2π^2, ϕ=0)
    if θ == 0
        return [0,0,0]
    else
        return [r * θ^3 * cos(ω/θ + ϕ), r * θ^3 * sin(ω/θ + ϕ), θ^2]
    end
end

# Unexpected
function plot_twists(save::Bool)

    θs = 0:.01:π
    xyz_vals = twist.(θs)
    xyz_opp = reverse([[-1*x, -1*y, z] for (x,y,z) in xyz_vals])

    # Break things up into two arrays in case you want to make the
    # lines different colors so that it's possible to actually see
    # which is on top
    xsa = [p[1] for p in xyz_opp]
    ysa = [p[2] for p in xyz_opp]
    zsa = [p[3] for p in xyz_opp]

    xsb = [p[1] for p in xyz_vals]
    ysb = [p[2] for p in xyz_vals]
    zsb = [p[3] for p in xyz_vals]


    xyz_tot = append!(xyz_opp, xyz_vals)
    xs = [p[1] for p in xyz_tot]
    ys = [p[1] for p in xyz_tot]
    zs = [p[1] for p in xyz_tot]


    # Use pgfplotsx for a written-out version of the plot, use
    # plotlyjs if we're doing interactive plotting instead
    if save
        pgfplotsx()

        plot(camera=(60, 25), size=(1500,1000), legend=false)
        plot!(xsa, ysa, zsa, color=:blue, lw=1)
        plot!(xsb, ysb, zsb, color=:red, lw=1)
        savefig("countable-3d-twists-side.pdf")


        plot(camera=(0, 90), size=(1500,1000), legend=false)
        plot!(xsa, ysa, zsa, color=:blue, lw=1)
        plot!(xsb, ysb, zsb, color=:red, lw=1)
        savefig("countable-3d-twists-top.pdf")

    else
        plotlyjs()
        lcol= colorant"#D6D7D9" # nice colors
        bcol= colorant"#1D252C"


        plot(camera=(60, 25), size=(1500,1000),
        legend=false, background_color=bcol,
        color = lcol)

        plot!(xs, ys, zs, color=lcol, lw=.5)

    end


end

plot_twists(true)
