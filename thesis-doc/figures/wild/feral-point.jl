using Plots
# Plots.scalefontsizes(2)

pgfplotsx()

function get_pts(n)
    xs = []
    ys = []
    for i in 0:n
        i -= 2
        xa = 4-1/(2.0^i)
        dx = 1/(2.0^(i+2))
        xb = xa + dx
        xc = xa + 2*dx
        append!(xs, [xa, xb, xb, xc])
        append!(ys, [0, 0, dx^2, dx^2])
    end
    # @show xs, ys
    plot(xs, ys, color=:black, lw=.85, axis=false, legend=false, grid=false, ticks=false, tex_output_standalone=true)
    # save("feral-point.tex")
    savefig("feral-point.tex")
end

get_pts(100)
