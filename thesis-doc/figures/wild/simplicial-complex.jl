using Plots
pgfplotsx()

# Get the right triangle coordinate
function right(r)
    return [r * cos(-π/6), r * sin(-π/6)]
end

function top(r)
    return [r * cos(π/2), r * sin(π/2)]
end

function left(r)
    return [r * cos(7*π/6), r * sin(7*π/6)]
end


function going_down(n)
    # We're subdividing equilateral triangles with centers at the
    # origin
    segments = []
    for i in 1:n
        Ri = 2*1/(2^i) # radial distance out from center
        Rp = 2*1/2^(i-1) # previous radial distance

        ri, ti, li = right(Ri), top(Ri), left(Ri)
        rp, tp, lp = right(Rp), top(Rp), left(Rp)

        # @show ri, ti, li
        append!(segments, [[ri, ti], [ti, li], [li, ri]])
        if i != 1
            append!(segments, [(ri, rp), (ti, tp), (li, lp), (li, rp), (ri, tp), (ti, lp)])
        end
    end

    # plot([ri, ti, li, rp, tp, lp])

    plot(legend=false, size=(470,400), grid=false, ticks=false, axis=false)
    for pair in segments
        xs = [pair[1][1], pair[2][1]]
        ys = [pair[1][2], pair[2][2]]
        plot!(xs, ys, color=:black, lw=.4)
    end
    savefig("simp-comp-down.pdf")
end

going_down(10)

function going_up(n)
    # We're subdividing equilateral triangles with centers at the
    # origin
    segments = []
    for i in 1:n
        Ri = 2*i # radial distance out from center
        Rp = 2*(i-1) # previous radial distance

        ri, ti, li = right(Ri), top(Ri), left(Ri)
        rp, tp, lp = right(Rp), top(Rp), left(Rp)

        # @show ri, ti, li
        append!(segments, [[ri, ti], [ti, li], [li, ri]])
        # if i != 1
        append!(segments, [(ri, rp), (ti, tp), (li, lp), (li, rp), (ri, tp), (ti, lp)])
        # end
    end

    # plot([ri, ti, li, rp, tp, lp])

    plot(legend=false, size=(470,400), grid=false, ticks=false, axis=false)
    for pair in segments
        xs = [pair[1][1], pair[2][1]]
        ys = [pair[1][2], pair[2][2]]
        plot!(xs, ys, color=:black, lw=.4)
    end
    savefig("simp-comp-up.pdf")
end

going_up(10)
