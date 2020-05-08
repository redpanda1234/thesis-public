# using Plots
# pgfplotsx()
using PGFPlotsX


# Make the く-shaped segments
function ku(ℓ, start_pt, θ)
    # ℓ is the horizontal length
    # θ gives the angle of inclination / declination for our garbage
    # line segment
    return [start_pt,
            # start_pt + ℓ*[cos(θ), sin(θ)],
            start_pt + 1.5*ℓ*[cos(θ), sin(θ)]]
end

function draw_r1s(n; scale=.5)
    ℓ₀ = 1
    ℓ = ℓ₀

    # The start points for drawing
    p₁ = [.75,0]
    p₂ = [-.75, 0]

    first_half = []
    second_half = []

    θ₁ = 3*π/4
    θ₂ = 1*π/4
    for i in 1:n
        s1, p₁ = ku(ℓ, p₁, θ₁)
        s2, p₂ = ku(ℓ, p₂, θ₂)
        append!(first_half, [s1, p₁])
        append!(second_half, [s2, p₂])
        # s1,m1, p₁ = ku(ℓ, p₁, θ₁)
        # s2,m2, p₂ = ku(ℓ, p₂, θ₂)
        # append!(first_half, [s1, m1,p₁])
        # append!(second_half, [s2, m2,p₂])
        θ₁, θ₂ = θ₂, θ₁
        # ℓ *= scale
        ℓ = ℓ₀/(i+1)^(1.1)
    end
    # @show length(first_half), length(second_half)
    results = append!([], first_half)
    results = append!(results, reverse(second_half))
    xs = [p[1] for p in results]
    ys = [p[2] for p in results]

    ax = @pgf Axis({
        yscale="3.75",
        scale=".5",
        axis_line_style="{draw=none}",
        tick_style="{draw=none}",
        xticklabel="\\empty",
        yticklabel="\\empty",
    })

    p = @pgf Plot({line_width=".25pt"}, Coordinates(xs, ys))
    push!(ax, p)



    xso = []
    yso = []
    overs = []
    for i in 1:length(first_half)-1
        if i % 4 == 1
            x1, y1 = first_half[i]
            x2, y2 = first_half[i+1]
            append!(xso, [x1, x2])
            append!(yso, [y1, y2])
            append!(overs, [[x1, y1], [x2, y2]])
        end
    end


    for (i, ctup) in enumerate(zip(overs[1:end-1], overs[2:end]))
        if i % 2 == 0
            continue
        end
        (x1, y1), (x2, y2) = ctup
        xsnew = [x1, x2]
        ysnew = [y1, y2]
        newp = @pgf Plot({white, line_width="$(20/i^(.8))pt"}, Coordinates(xsnew, ysnew))
        push!(ax, newp)
    end

    for (i, ctup) in enumerate(zip(overs[1:end-1], overs[2:end]))
        if i % 2 == 0
            continue
        end
        (x1, y1), (x2, y2) = ctup
        xsnew = [x1, x2]
        ysnew = [y1, y2]
        newp = @pgf Plot({line_width=".25pt"}, Coordinates(xsnew, ysnew))
        push!(ax, newp)
    end







    xso = []
    yso = []
    overs = []
    for i in 1:length(first_half)-1
        if i % 4 == 3
            x1, y1 = second_half[i]
            x2, y2 = second_half[i+1]
            append!(xso, [x1, x2])
            append!(yso, [y1, y2])
            append!(overs, [[x1, y1], [x2, y2]])
        end
    end


    for (i, ctup) in enumerate(zip(overs[1:end-1], overs[2:end]))
        if i % 2 == 0
            continue
        end
        (x1, y1), (x2, y2) = ctup
        xsnew = [x1, x2]
        ysnew = [y1, y2]
        newp = @pgf Plot({white, line_width="$(20/i^(.8))pt"}, Coordinates(xsnew, ysnew))
        push!(ax, newp)
    end

    for (i, ctup) in enumerate(zip(overs[1:end-1], overs[2:end]))
        if i % 2 == 0
            continue
        end
        (x1, y1), (x2, y2) = ctup
        xsnew = [x1, x2]
        ysnew = [y1, y2]
        newp = @pgf Plot({line_width=".25pt"}, Coordinates(xsnew, ysnew))
        push!(ax, newp)
    end


    # pw = @pgf Plot({line_width="3pt", white}, Coordinates(xso, yso))
    # pb = @pgf Plot({line_width=".25pt", black}, Coordinates(xso, yso))
    # push!(ax, pb)


    pgfsave("countable-r1-v2.pdf", ax)
end



function draw_r2s(n; scale=.5)
    ℓ₀ = 1
    ℓ = ℓ₀

    # The start points for drawing
    p₁ = [.75,0]
    p₂ = [-.75, 0]

    first_half = []
    second_half = []

    θ₁ = 3*π/4
    θ₂ = 1*π/4
    for i in 1:n
        s1, p₁ = ku(ℓ, p₁, θ₁)
        s2, p₂ = ku(ℓ, p₂, θ₂)
        append!(first_half, [s1, p₁])
        append!(second_half, [s2,p₂])
        θ₁, θ₂ = θ₂, θ₁
        # ℓ *= scale
        ℓ = ℓ₀/(i+1)^(1.1)
    end
    # @show length(first_half), length(second_half)
    results = append!([], first_half)
    results = append!(results, reverse(second_half))
    xs = [p[1] for p in results]
    ys = [p[2] for p in results]

    ax = @pgf Axis({
        yscale="3.75",
        scale=".5",
        axis_line_style="{draw=none}",
        tick_style="{draw=none}",
        xticklabel="\\empty",
        yticklabel="\\empty",
    })

    p = @pgf Plot({line_width=".25pt"}, Coordinates(xs, ys))
    push!(ax, p)

    xso = [p[1] for p in first_half]
    yso = [p[2] for p in first_half]

    for (i, ctup) in enumerate(zip(first_half[1:end-1], first_half[2:end]))
        (x1, y1), (x2, y2) = ctup
        xsnew = [x1, x2]
        ysnew = [y1, y2]
        newp = @pgf Plot({white, line_width="$(20/i^(.8))pt"}, Coordinates(xsnew, ysnew))
        push!(ax, newp)
    end
    pb = @pgf Plot({line_width=".25pt", black}, Coordinates(xso, yso))

    push!(ax, pb)


    pgfsave("countable-r2-v2.pdf", ax)
end

draw_r1s(100; scale=.75)
draw_r2s(100; scale=.75)

# function other_draw_r2s(n)
