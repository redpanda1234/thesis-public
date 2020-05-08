# using StatsBase
# pgfplotsx()

products = [[0, 5, 5, 3, 7, 8, 8, 3, 3, 7, 10, 7, 7, 10, 9, 8, 9, 7, 8, 9, 10, 7, 11, 8, 11, 8, 7, 8, 10, 9, 11, 9, 10, 10, 8, 9, 10], [6, 4, 7, 7, 10, 4, 9, 8, 9, 9, 8, 9, 9, 5, 7, 6, 8, 12, 10, 7, 8, 12, 6, 11, 6, 10, 12, 10, 8, 12, 10, 10, 8, 8, 10, 9, 9], [3, 5, 5, 3, 9, 10, 7, 3, 6, 6, 12, 6, 7, 12, 9, 9, 10, 9, 9, 9, 10, 9, 11, 10, 12, 8, 9, 9, 9, 11, 13, 11, 9, 9, 8, 9, 12], [3, 5, 4, 3, 8, 10, 7, 3, 6, 7, 12, 7, 7, 12, 9, 9, 10, 11, 9, 9, 10, 11, 11, 10, 12, 6, 11, 9, 9, 11, 13, 11, 9, 8, 7, 9, 12], [4, 10, 7, 9, 6, 8, 6, 7, 4, 9, 9, 9, 11, 9, 11, 12, 12, 8, 8, 12, 14, 8, 11, 9, 12, 11, 8, 9, 14, 7, 10, 11, 14, 11, 12, 11, 10], [8, 9, 9, 9, 8, 3, 7, 9, 9, 11, 9, 11, 11, 9, 9, 8, 12, 10, 8, 14, 12, 10, 11, 8, 10, 12, 10, 12, 12, 9, 9, 11, 12, 10, 11, 10, 7], [8, 9, 9, 9, 6, 2, 6, 9, 9, 10, 9, 10, 10, 7, 10, 11, 9, 9, 13, 13, 11, 9, 7, 10, 9, 10, 9, 13, 9, 10, 10, 7, 11, 8, 11, 12, 9], [3, 7, 6, 3, 10, 10, 7, 0, 6, 7, 13, 7, 7, 13, 11, 9, 11, 10, 10, 10, 10, 10, 11, 7, 12, 9, 10, 10, 9, 12, 14, 7, 10, 11, 8, 11, 8], [3, 8, 8, 6, 7, 9, 10, 6, 0, 4, 9, 4, 6, 10, 10, 8, 8, 6, 7, 5, 13, 6, 14, 8, 13, 8, 6, 9, 13, 9, 10, 10, 7, 12, 11, 10, 11], [5, 7, 7, 5, 10, 11, 10, 3, 2, 7, 14, 7, 7, 14, 11, 8, 12, 11, 11, 11, 10, 11, 10, 10, 12, 10, 11, 11, 7, 13, 13, 10, 10, 10, 8, 11, 13], [10, 5, 12, 12, 9, 9, 7, 13, 8, 14, 3, 14, 14, 6, 5, 9, 7, 10, 10, 12, 11, 10, 11, 12, 11, 13, 10, 11, 11, 9, 5, 11, 8, 12, 11, 11, 10], [5, 7, 7, 5, 10, 11, 7, 3, 2, 6, 14, 6, 7, 14, 11, 8, 12, 11, 11, 11, 10, 11, 11, 11, 12, 10, 11, 11, 7, 13, 13, 10, 11, 11, 5, 11, 13], [5, 7, 6, 3, 10, 11, 10, 4, 5, 7, 14, 7, 7, 14, 11, 8, 12, 13, 10, 11, 10, 13, 10, 10, 12, 9, 13, 11, 7, 13, 15, 12, 10, 8, 3, 11, 13], [10, 6, 12, 12, 9, 9, 10, 13, 10, 14, 6, 14, 14, 5, 4, 5, 4, 10, 8, 10, 11, 10, 12, 12, 11, 13, 9, 11, 9, 10, 4, 8, 5, 12, 15, 11, 8], [9, 7, 10, 10, 11, 8, 10, 11, 9, 12, 9, 12, 12, 7, 6, 9, 8, 12, 6, 8, 11, 12, 10, 10, 11, 11, 12, 5, 11, 7, 8, 11, 10, 8, 13, 8, 7], [9, 7, 10, 10, 12, 7, 11, 10, 11, 9, 11, 8, 8, 7, 7, 5, 10, 10, 12, 5, 9, 10, 8, 11, 7, 13, 10, 12, 9, 14, 12, 11, 10, 10, 11, 10, 9], [10, 8, 11, 11, 12, 7, 9, 12, 10, 11, 8, 11, 11, 5, 7, 9, 8, 12, 10, 8, 10, 12, 10, 9, 10, 11, 12, 10, 11, 5, 10, 11, 8, 10, 14, 9, 10], [7, 12, 11, 11, 8, 8, 9, 11, 5, 13, 10, 13, 13, 9, 12, 9, 12, 7, 9, 11, 16, 8, 6, 9, 14, 10, 7, 10, 15, 7, 9, 11, 14, 10, 14, 11, 7], [6, 8, 9, 7, 10, 12, 11, 8, 6, 11, 12, 11, 11, 12, 9, 11, 9, 8, 8, 10, 12, 8, 15, 6, 16, 9, 7, 8, 12, 10, 12, 11, 10, 12, 12, 8, 12], [8, 6, 9, 8, 12, 14, 13, 9, 8, 9, 12, 9, 9, 10, 6, 6, 5, 10, 4, 8, 8, 10, 7, 13, 12, 9, 10, 6, 10, 12, 12, 11, 5, 11, 9, 10, 12], [10, 8, 10, 10, 14, 10, 11, 8, 13, 10, 12, 10, 10, 11, 11, 9, 12, 16, 13, 9, 8, 16, 5, 13, 6, 13, 16, 14, 8, 16, 12, 13, 9, 5, 10, 12, 12], [5, 12, 11, 11, 8, 8, 9, 11, 4, 13, 10, 13, 13, 9, 12, 9, 12, 8, 9, 11, 16, 8, 6, 9, 12, 10, 8, 10, 15, 7, 9, 11, 14, 9, 14, 11, 9], [11, 7, 11, 11, 13, 6, 10, 9, 14, 11, 12, 11, 11, 11, 10, 8, 10, 11, 15, 9, 7, 9, 7, 11, 7, 14, 9, 15, 9, 15, 12, 12, 8, 11, 11, 14, 10], [6, 11, 10, 9, 9, 7, 10, 3, 5, 11, 12, 11, 11, 10, 10, 10, 9, 9, 5, 13, 13, 9, 14, 7, 13, 8, 8, 7, 12, 7, 13, 12, 15, 11, 11, 11, 10], [11, 8, 12, 12, 8, 10, 9, 11, 13, 12, 11, 11, 11, 11, 11, 8, 12, 14, 16, 12, 6, 14, 6, 12, 8, 15, 14, 16, 10, 14, 11, 13, 10, 11, 10, 11, 10], [7, 8, 8, 8, 11, 13, 8, 8, 6, 9, 13, 8, 9, 13, 10, 11, 8, 11, 7, 9, 11, 11, 14, 8, 15, 7, 11, 7, 11, 11, 13, 12, 8, 10, 11, 9, 11], [7, 12, 11, 11, 8, 8, 9, 11, 5, 13, 10, 13, 13, 9, 12, 9, 12, 8, 9, 11, 16, 8, 5, 9, 12, 10, 8, 10, 15, 6, 9, 11, 14, 9, 14, 10, 9], [7, 8, 9, 9, 10, 12, 11, 9, 7, 11, 12, 11, 11, 12, 9, 11, 9, 10, 8, 10, 14, 10, 15, 6, 16, 9, 10, 8, 12, 10, 12, 11, 10, 12, 12, 8, 12], [10, 8, 10, 10, 14, 12, 11, 8, 13, 10, 7, 9, 9, 9, 11, 8, 11, 15, 13, 7, 8, 15, 9, 14, 9, 12, 15, 13, 7, 15, 13, 12, 9, 10, 10, 11, 13], [7, 12, 11, 11, 8, 10, 5, 10, 7, 13, 10, 13, 13, 9, 11, 14, 11, 8, 8, 12, 16, 7, 15, 6, 12, 11, 8, 9, 15, 8, 8, 11, 4, 11, 14, 11, 10], [11, 10, 13, 13, 9, 10, 11, 14, 10, 13, 7, 13, 15, 8, 8, 9, 9, 8, 12, 11, 12, 9, 6, 13, 9, 11, 8, 12, 13, 8, 7, 11, 12, 11, 16, 11, 10], [8, 10, 11, 10, 9, 9, 12, 7, 8, 9, 5, 10, 12, 8, 11, 11, 11, 9, 9, 9, 13, 7, 12, 12, 13, 11, 9, 11, 12, 9, 9, 8, 11, 15, 13, 10, 10], [10, 8, 10, 10, 14, 10, 11, 8, 11, 11, 12, 11, 11, 10, 10, 10, 10, 14, 12, 8, 9, 14, 9, 13, 10, 11, 14, 12, 4, 14, 12, 11, 8, 10, 12, 11, 10], [10, 10, 10, 10, 11, 11, 8, 11, 12, 10, 8, 11, 11, 11, 12, 11, 9, 10, 8, 12, 12, 10, 10, 10, 12, 8, 10, 8, 6, 10, 12, 15, 12, 7, 12, 9, 12], [7, 9, 8, 8, 12, 10, 10, 3, 10, 7, 11, 7, 7, 15, 11, 10, 13, 14, 10, 8, 5, 14, 4, 11, 12, 11, 14, 9, 10, 14, 16, 13, 7, 12, 8, 13, 14], [9, 9, 10, 10, 11, 10, 5, 11, 8, 12, 11, 10, 12, 11, 7, 9, 9, 11, 8, 11, 13, 11, 14, 6, 11, 10, 11, 8, 12, 11, 11, 12, 8, 10, 13, 7, 10], [10, 11, 12, 12, 7, 8, 9, 9, 10, 12, 8, 12, 13, 8, 12, 7, 12, 10, 12, 12, 14, 10, 8, 13, 12, 13, 10, 12, 13, 9, 9, 11, 12, 12, 14, 10, 8]]

xs = Array{Float64, 1}(undef, 13403)
ys = Array{Float64, 1}(undef, 13403)
i = 1
for (y, row) in enumerate(products)
    for (x, col) in enumerate(row)
        for _ in 1:col
            global i
            xs[i] = -1*x
            ys[i] = y
            i += 1
        end
    end
end

using PGFPlotsX
using StatsBase: Histogram, fit
# w = range(-1; stop = 1, length = 100) .^ 3
# xy = vec(tuple.(xs, ys'))
# xs = xs .- min(xs...)
xs = xs .* -1
ys = ys .* -1
ys = ys .- min(ys...)
h = fit(Histogram, (xs, ys), closed = :left, nbins=35)
a = @pgf Axis(
    {
        width="18cm",
        height="12cm",
        ticks = "none",
        view = (0, 90),
        colorbar,
        "colormap/jet"
    },
    Plot3(
        {
            surf,
            shader = "flat",

        },
        Table(h))
)
pgfsave("mult-heatmap.pdf", a)

# mat = collect([x,y] for (x,y) in zip(xs, ys))

# using DelimitedFiles
# writedlm("mat.csv",  mat, ',')
# writedlm("x.csv",  xs, ',')
# writedlm("y.csv",  ys, ',')
# h = fit(Histogram, (ys,xs), nbins=37)
# plot(h)