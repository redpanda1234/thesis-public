using DifferentialEquations
using Plots
using Colors
pgfplotsx()

# Define the DE and stuff
# ================================================================== #
#
function spiral!(du, u, p, t)
    r, θ = u
    n = p[1]

    du[1] = dr = -r^n
    du[2] = dθ = -1
end

p = [2]
tspan = (0.0, 400.0)
max_dt = .05

# Solution 1
# ----------------------------------------------------------
r₀ = .3
θ₀ = π
u₀ = [r₀, θ₀]

prob = ODEProblem(spiral!, u₀, tspan, p)
sol = solve(prob, dtmax=max_dt)

x(r,θ) = r*cos(θ)
y(r,θ) = r*sin(θ)

x0s = [x(r,θ) for (r,θ) in sol.u]
y0s = [y(r,θ) for (r,θ) in sol.u]

# Solution 2
# ----------------------------------------------------------
r₁ = .25
u₁ = [r₁, θ₀]

prob = ODEProblem(spiral!, u₁, tspan, p)
sol = solve(prob, dtmax=max_dt)

x1s = [x(r,θ) for (r,θ) in sol.u]
y1s = [y(r,θ) for (r,θ) in sol.u]

# Reflect solutions 1 and 2 across the line x = -(r₀ + r₁)/2 and then
# reflect them over y = 0
ravg = -1*(r₀ + r₁)/2
x2s = 2*ravg .- x0s
x3s = 2*ravg .- x1s

y2s = -1 .* y0s
y3s = -1 .* y1s




# Plot things
# ================================================================== #

# Initialize plot parameters for a nice curve
# ----------------------------------------------------------
lws=.1
lcol=:black #colorant"#D6D7D9"
plot(
    # xlim=(-.75,.25), ylim=(-.25,.25),
    aspect_ratio=:equal,# size=(400,200),
    axis=false,
    grid=false,
    ticks=false,
    legend=false,
    # background_color=colorant"#1D252C",
    # linecolor=
)

# Plot the first spiral
plot!(x0s, y0s, lw=lws, color=lcol)

# Plug the empty hole in the middle
scatter!([0], [0],
      markersize = 2.4,
      markeralpha = 1,
      markercolor = lcol,
      markerstrokewidth = 0,
      )


savefig("plane-spirals-1.pdf")

# Plot the second spiral
plot!(x1s, y1s, lw=lws, color=lcol)

savefig("plane-spirals-2.pdf")
