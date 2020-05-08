using Plots, ProgressMeter
pgfplotsx()

# Get x y coords of a circle
function circle(c₀, r)
    θs = 0:.1:2π+.1
    xs = Array{Float64, 1}(undef, length(θs))
    ys = Array{Float64, 1}(undef, length(θs))
    for (i, θ) in enumerate(θs)
        xs[i] = r*cos(θ) + c₀[1]
        ys[i] = r*sin(θ) + c₀[2]
    end

    return xs, ys
end



function n_nsq_balls(n)
    plot(size=(500,500), legend=false)

    @showprogress 1 for m in 1:n
        println(m)
        xs, ys = circle([1/m, 0], (m)^(-1/3))
        plot!(xs, ys, lw=.25, color=:black)
    end

    savefig("n-nsq-balls.pdf")
end

n_nsq_balls(100)
