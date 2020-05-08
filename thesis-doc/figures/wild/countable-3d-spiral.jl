using DifferentialEquations
using LinearAlgebra
using Plots
# plotlyjs()
pgfplotsx()

# r₁ is the big r for the circle this is based on
function to_cartesian(θ; r₁=5)
    if θ == 0
        return [r₁,0,0]
    end
    r₂ = abs(θ)^2
    x = r₁*cos(θ)
    y = r₁*sin(θ)

    vperp = [x, y, 0]
    vperp /= norm(vperp)
    zperp = [0,0,1]

    scale=2*π^2
    if θ > 0
        v_to_transform = [r₂*sin(scale/θ), r₂*cos(scale/θ), 0.0]
    else
        v_to_transform = [r₂*sin(-1*scale/θ), r₂*cos(scale/θ), 0.0]
    end

    # Rotate into the orthogonal plane
    R_mat = [zperp vperp [0.0; 0.0; 0.0]]
    v_out = (R_mat * v_to_transform) + [x,y,0]
    return v_out
end

step = .0001
θs = 0:step:π
θ₂s = reverse(-1 .* θs)

xyz_vals = to_cartesian.(θs)
xyz_opp = to_cartesian.(θ₂s) # The mirror image
append!(xyz_opp, xyz_vals)
xyz_vals = xyz_opp

xs = [p[1] for p in xyz_vals]
ys = [p[2] for p in xyz_vals]
zs = [p[3] for p in xyz_vals]

plot(camera=(55, 30), size=(700,500), legend=false)#, grid=false)#, axis=false, ticks=false)
plot!(xs, ys, zs, color=:black, lw=.5)

savefig("smooth-countable-3d-spiral.pdf")
