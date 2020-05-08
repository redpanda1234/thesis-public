using Plots
using LinearAlgebra

function rand3()
    rvec = [rand() for _ in 1:3]
    rvec /= sum(rvec)
    if !isapprox(sum(rvec),1)
        @show rvec
    end
    return rvec
end

a = [0, sqrt(3)/2]
b = [-.5, 0]
c = [.5, 0]
d = [0, -sqrt(3)/2]

mab = (a+b)/2
mbc = (b+c)/2
mca = (c+a)/2

# The barycenter of the upper triangle
bary1 = (a + b + c)/3
bary2 = (d + b + c)/3

function lb(x)
    return x*bary1[2]/(0-b[1]) + bary1[2]
end

function lc(x)
    return x*-1*bary1[2]/c[1] + bary1[2]
end

function lab(x)
    return sqrt(3)/2 + sqrt(3)*x
end
function lac(x)
    return sqrt(3)/2 - sqrt(3)*x
end


# Figure out which of the 6 barycentric subdivision regions our v is
# in
function get_b1desc(v)
    # We want to get the t value along a displacement line connecting
    # barycenter and v from some point on the boundary
    m = (v[2] - bary1[2])/(v[1] - bary1[1])
    y0 = bary1[2]

    # Get the point on the axis
    function p0_bc(v)
        xval = abs(y0/m)
        if v[1] < 0
            p0 = [xval, 0]
        else
            p0 = [-xval, 0]
        end
        return p0
    end

    # Get the point further below (on the side of the upside-down
    # triangle)
    function p1_bc(v)
        # No idea why we have to multiply by 2/3 but ok
        if v[1] < 0
            xval = -2*sqrt(3)/((m + sqrt(3))*3)
        elseif v[1] > 0
            xval =2*sqrt(3)/((sqrt(3)-m)*3)
        end

        yval = m*xval + y0
        return [xval, yval]

    end


    function p0_ab(v)
        xval = (sqrt(3)/2 - y0)/(m-sqrt(3))
        yval = lab(xval)
        p0 = [xval, yval]
        if -.5 > xval
            println("in p0_ab")
            @show p0, v
        end
        return p0
    end

    function p0_ac(v)
        xval = (sqrt(3)/2 - y0)/(m+sqrt(3))

        yval = lac(xval)
        p0 = [xval, yval]
        if xval > .5
            println("in p0_ac")
            @show p0, v
        end
        return p0
    end

    function linfo(p, v)
        if (bary1[2] - p[2])/(v[2] - p[2]) > 1
            @show p, v
        end
        return (p, (bary1[2] - p[2])/(v[2] - p[2]))
    end


    if v[1] == 0 # v on vertical line
        if v[2] > bary1[2]
            return linfo(d, v)
        elseif v[2] < bary1[2]
            return linfo(a, v)
        elseif v[2] == bary1[2]
            return (bary1, 1)
        end

    elseif lb(v[1]) == v[2]
        if v[2] > bary1[2]
            return linfo(b, v)
        elseif v[2] < bary1[2]
            return linfo(mca, v)
        end

    elseif lc(v[1]) == v[2]
        if v[2] > bary1[2]
            return linfo(c, v)
        elseif v[2] < bary1[2]
            return linfo(mab, v)
        end

    elseif (lb(v[1]) < v[2]) & (lc(v[1]) < v[2]) # top corner
        # println("topcorn")
        p0 = p1_bc(p0_bc(v))
        return linfo(p0, v)

    elseif v[1] < 0 # bottom left corner
        p0 = p0_ac(v)
        return linfo(p0, v)

    elseif v[1] > 0 # bottom right corner
        p0 = p0_ab(v)
        return linfo(p0, v)
    end
end


function lbd(x)
    -sqrt(3)/2 -sqrt(3)*x
end
function lcd(x)
    -sqrt(3)/2 + sqrt(3)*x
end
# Figure out which of the 6 barycentric subdivision regions our v is
# in
function get_b2desc(v)
    # We want to get the t value along a displacement line connecting
    # barycenter and v from some point on the boundary
    m = (v[2] - bary2[2])/(v[1] - bary2[1])
    y0 = bary1[2]

    function p0_db(v)
        xval = 1*(-sqrt(3)/2 - y0)/(2*(m+sqrt(3)))
        yval = lbd(xval)
        p0 = [xval, yval]

        return p0
    end

    function p0_dc(v)
        xval = 1*(-sqrt(3)/2 - y0)/(2*(m-sqrt(3)))
        yval = lcd(xval)
        p0 = [xval, yval]
        return p0
    end

    function linfo(p, v)
        if (bary2[2] - p[2])/(v[2] - p[2]) > 1
            @show p, v
        end
        return (p, (bary2[2] - p[2])/(v[2] - p[2]))
    end


    if v[1] == 0 # v on vertical line
        return linfo(d, v)
    elseif v[1] < 0
        p0 = p0_dc(v)
        return linfo(p0, v)
    else
        p0 = p0_db(v)
        return linfo(p0, v)
    end
end

# Reconstruct where the new barycenter should be
function get_pt(p0, t, vnew)
    return t * vnew + (1-t) * p0
end


# returns v, f(v), b1, f(b1), b2, f(b2)
function draw_simplices()
    v = [.12, .6]
    u = bary1

    # u = [-.15, -.3]
    # random start point
    # v = sum([r * x for (r,x) in zip(rand3(), [a,b,c])])
    # u = sum([r * x for (r,x) in zip(rand3(), [d,b,c])])

    p0, t0 = get_b1desc(v)
    p1, t1 = get_b2desc(v)
    @show t0*v + (1-t0)*p0 - bary1
    @show t1*v + (1-t1)*p1 - bary2
    # @show p1, t1

    vs = string("\\coordinate (v) at (", string(v[1]), ", ", string(v[2]), ");\n")
    us = string("\\coordinate (u) at (", string(u[1]), ", ", string(u[2]), ");\n")

    b1s = string("\\coordinate (baanc) at (", string(p0[1]), ", ", string(p0[2]), ");\n")
    b2s = string("\\coordinate (bbanc) at (", string(p1[1]), ", ", string(p1[2]), ");\n")

    b1t = string("\\pgfmathsetmacro{\\bat}{", string(t0), "}\n")
    b2t = string("\\pgfmathsetmacro{\\bbt}{", string(t1), "}\n")
    b1tc = string("\\pgfmathsetmacro{\\batc}{1-\\bat}\n")
    b2tc = string("\\pgfmathsetmacro{\\bbtc}{1-\\bbt}\n")

    out_str = string(vs, us, b1s, b2s, b1t, b2t, b1tc, b2tc)

    return out_str
end

draw_simplices()
