using Plots
pgfplotsx()

# θ is from 0 to 2π
# r is default radius
function square(θ; r=1)
    rnew = min(r/abs(cos(θ)), r/abs(sin(θ)))
    return (rnew*cos(θ), rnew*sin(θ))
end

function wobble(θ; h=1)
    θ = (θ - π/4) % (2*π)
    scale=2*π^2
    if θ==0
        return 0
    elseif θ<=π
        return h*θ^2 * sin(scale/θ)
    elseif θ<=2*π
        return wobble(2*π-θ; h=h)
    else
        return 0
    end
end

function wobblysquare(θ; r=5, h=1)
    if (π/4 <= θ) & (θ<=3*π/4)
        rnew = r+wobble(θ;h=h)
    else
        rnew = r
    end
    return square(θ;r=rnew)
end

function zigzag(; r=5, h=.2)
    θend = 2*π+.005
    θrange = 0:.005:θend

    xy_vals = wobblysquare.(θrange; r=r, h=h)

    return xy_vals
end

xy_vals = zigzag()
out_xy_vals = zigzag(r=5.5)
in_xy_vals = zigzag(r=4.5)

plot(size=(500,500), legend=false, grid=false, axis=false, ticks=false)

# [(x₁, y₁), (x₂, y₂), (x₃, y₃)]
for (i, pttriple) in enumerate(zip(xy_vals, out_xy_vals, in_xy_vals))
    if i % 5 == 0
        pttriple = [pt for pt in pttriple]
        plot!(pttriple, lw=.25, color=:orange)
    end
end

plot!(xy_vals, color=:black)
plot!(out_xy_vals, color=:gray, lw=.5)
plot!(in_xy_vals, color=:gray, lw=.5)

savefig("countable-square-zigzag.pdf")
