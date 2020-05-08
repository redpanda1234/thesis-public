using Plots
using LinearAlgebra
pgfplotsx()

function circle(θ; r=5)
    return (r*cos(θ), r*sin(θ))
end

# c/theta = 2*pi*n
# c = 2 * pi * n * theta
function wobble(θ; h=1)
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

function wobblycircle(θ; r=5, h=1)
    rnew = r+wobble(θ;h=h)
    return (rnew*cos(θ+π/2), rnew*sin(θ+π/2))
end

function smooth_zigzag(; r=5, h=.2)
    θend = 2*π+.05
    θrange = 0:.005:θend

    xy_vals = wobblycircle.(θrange; r=r, h=h)

    return xy_vals
end

xy_vals = smooth_zigzag()
out_xy_vals = smooth_zigzag(r=5.5)
in_xy_vals = smooth_zigzag(r=4.5)

plot(size=(500,500), legend=false, grid=false, axis=false, ticks=false)
plot!(xy_vals, color=:black)
plot!(out_xy_vals, color=:gray, lw=.5)
plot!(in_xy_vals, color=:gray, lw=.5)

savefig("smooth-countable-zigzag.pdf")
# For drawing the jagged zig-zag
#
# returns the points that are local maxes / local mins
function lopt(array)
    out_arr = [array[1]]
    for i in 2:length(array)-1
        if (norm(array[i-1]) < norm(array[i])) & (norm(array[i+1]) < norm(array[i]))
            push!(out_arr, array[i])
        elseif (norm(array[i-1]) > norm(array[i])) & (norm(array[i+1]) > norm(array[i]))
            push!(out_arr, array[i])
        end
    end
    push!(out_arr, array[end])
end

jag_xy_vals = lopt(xy_vals)
jag_out_xy_vals = lopt(out_xy_vals)
jag_in_xy_vals = lopt(in_xy_vals)

plot(size=(500,500), legend=false, grid=false, axis=false, ticks=false)
plot!(jag_xy_vals, color=:black)
plot!(jag_out_xy_vals, color=:gray, lw=.5)
plot!(jag_in_xy_vals, color=:gray, lw=.5)




savefig("jagged-countable-zigzag.pdf")
