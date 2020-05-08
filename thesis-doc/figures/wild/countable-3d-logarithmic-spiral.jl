using Plots
using Colors
plotlyjs()

# r₁ is the big r for the circle this is based on.
#
# This function just computes the equation seen in our explicit
# parameterization of the countable reidemeister I knot. Note that
# this uses the form defined in terms of the matrix-vector equation,
# since we found it more tangible when prototyping.
function to_cartesian(θ; r₁=3)
    # This is the special "f(0)=0" case in our piecewise definition of
    # our function.
    if θ == 0
        return [r₁,0,0]
    end

    # Compute the radius of the smaller circle
    r₂ = abs(θ)^3
    x = r₁*cos(θ)
    y = r₁*sin(θ)

    # The radial vector is orthogonal to the tangent vector, hence
    # we can use it as one of the basis vectors for the orthogonal
    # frame.
    vperp = [x, y, 0]
    vperp /= sqrt((x^2 + y^2)) # Normalize it

    # Since the big circle lies in the xy-plane, the z direction is
    # also always one of the basis vectors for the orthogonal plane.
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
θs = 0:step:π/2
θ₂s = reverse(-1 .* θs)


xyz_vals = to_cartesian.(θs)
xyz_opp = to_cartesian.(θ₂s) # The mirror image
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
