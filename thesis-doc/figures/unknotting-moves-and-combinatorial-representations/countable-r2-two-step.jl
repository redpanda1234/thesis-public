using PGFPlotsX

# function straight(ℓ, start_pt, θ)

# end

# Make the く-shaped segments
function ku(ℓ, start_pt, θ)
    # ℓ is the horizontal length
    # θ gives the angle of inclination / declination for our garbage
    # line segment
    return [start_pt,
            # start_pt + ℓ*[cos(θ), sin(θ)],
            start_pt + 1.5*ℓ*[cos(θ), sin(θ)]]
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
        pts1 = ku(ℓ, p₁, θ₁)
        pts2 = ku(ℓ, p₂, θ₂)
        p₁ = pts1[end]
        p₂ = pts2[end]
        if i % 3 == 0
            append!(first_half,  pts1)
            append!(second_half, pts2)
        end
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


    pgfsave("countable-r2-two-step-1.pdf", ax)
end

function draw_r2s_initial(n; scale=.5)
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
        pts1 = ku(ℓ, p₁, θ₁)
        pts2 = ku(ℓ, p₂, θ₂)
        p₁ = pts1[end]
        p₂ = pts2[end]
        # if i % 1 == 0
            append!(first_half,  pts1)
            append!(second_half, pts2)
        # end
        θ₁, θ₂ = θ₂, θ₁
        # ℓ *= scale
        ℓ = ℓ₀/(i+1)^(1.1)
    end
    # @show length(first_half), length(second_half)
    results = append!([], first_half)
    results = append!(results, reverse(second_half))
    xs = sort([p[1] for p in results])
    # @show xs
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

    # for (i, ctup) in enumerate(zip(first_half[1:end-1], first_half[2:end]))
    #     (x1, y1), (x2, y2) = ctup
    #     xsnew = [x1, x2]
    #     ysnew = [y1, y2]
    #     newp = @pgf Plot({white, line_width="$(20/i^(.8))pt"}, Coordinates(xsnew, ysnew))
    #     push!(ax, newp)
    # end
    # pb = @pgf Plot({line_width=".25pt", black}, Coordinates(xso, yso))

    # push!(ax, pb)


    pgfsave("countable-r2-two-step-0.pdf", ax)
end


draw_r2s(100; scale=.75)
draw_r2s_initial(100; scale=.75)
