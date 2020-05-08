using Plots
pgfplotsx()

n = 100

mypow = 2

theta_n = [2*pi*1/(i^mypow) for i in 3:n]
r_n = [20/(i^mypow) for i in 3:n]

ys = []
xs = []
for (t1, t2, r) in zip(theta_n[1:end-1], theta_n[2:end], r_n[1:end-1])
    for t in (t1, t2)
        push!(ys, r*sin(t))
        push!(xs, r*cos(t))
    end
end

plot(xs, ys, color=:black, legend=false, aspect_ratio=:equal)

savefig("wiggly-feral-problem.pdf")
