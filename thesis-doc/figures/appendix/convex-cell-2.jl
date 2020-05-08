

# show(ch)


# v = vrep(pts)

# # Constructs a polyhedon from this V-representation with the QHull library
# p = polyhedron(v# , QHull.Library()
#                )
# # Removing redundant points, i.e. points which are in the interior of the convex hull
# removevredundancy!(p)

# m = Polyhedra.Mesh(p)

# using Polyhedra
# # Constructs a V-representation of 10 random points in 2 dimension
# v = vrep(rand(10, 2))

# using QHull
# # Constructs a polyhedon from this V-representation with the QHull library
# p = polyhedron(v, QHull.Library())
# # Removing redundant points, i.e. points which are in the interior of the convex hull
# removevredundancy!(p)
# # Show remaining points, i.e. the non-redundant ones
# @show vrep(p)
# # Show the H-representation, the facets describing the polytope
# @show hrep(p)
