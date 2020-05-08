from progress.bar import Bar

load("cycle_reps.sage")

gknot = {
    # (0): (-1, 1),
    (3, 1): (-1, 2, -3, 1, -2, 3),
    (4, 1): (-1 * I, 2 * I, -3, 4, -2 * I, 1 * I, -4, 3),
    (5, 1): (-1, 2, -3, 4, -5, 1, -2, 3, -4, 5),
    (5, 2): (-1, 2, -3, 4, -5, 3, -2, 1, -4, 5),
    (6, 1): (-1, 2, -3 * I, 4 * I, -5 * I, 6 * I, -2, 1, -6 * I, 5 * I, -4 * I, 3 * I),
    (6, 2): (-1, 2 * I, -3 * I, 4 * I, -5 * I, 1, -6, 3 * I, -4 * I, 5 * I, -2 * I, 6),
    (6, 3): (1, -2 * I, 3 * I, -4 * I, 2 * I, -5, 6, -1, 5, -3 * I, 4 * I, -6),
    (6, 4): (-1, 2, -3, 1, -2, 3, -4, 5, -6, 4, -5, 6),
    (6, 5): (-1, 2, -3, 1, -2, 3, 4 * I, -5 * I, 6 * I, -4 * I, 5 * I, -6 * I),
    (7, 1): (-1, 2, -3, 4, -5, 6, -7, 1, -2, 3, -4, 5, -6, 7),
    (7, 2): (
        -1 * I,
        6 * I,
        -7 * I,
        1 * I,
        -2 * I,
        3 * I,
        -4 * I,
        5 * I,
        -6 * I,
        7 * I,
        -5 * I,
        4 * I,
        -3 * I,
        2 * I,
    ),
    (7, 3): (-1, 2, -3, 4, -7, 6, -5, 1, -2, 3, -4, 5, -6, 7),
    (7, 4): (-1, 2, -3, 4, -5, 6, -7, 1, -4, 3, -2, 7, -6, 5),
    (7, 5): (
        -1 * I,
        2 * I,
        -3 * I,
        4 * I,
        -5 * I,
        1 * I,
        -2 * I,
        3 * I,
        -6 * I,
        7 * I,
        -4 * I,
        5 * I,
        -7 * I,
        6 * I,
    ),
    (7, 6): (
        -1 * I,
        2 * I,
        -3,
        4,
        -5 * I,
        6 * I,
        -4,
        3,
        -7 * I,
        1 * I,
        -6 * I,
        5 * I,
        -2 * I,
        7 * I,
    ),
    (7, 7): (-1 * I, 2 * I, -3, 4, -2 * I, 5 * I, -6, 7, -5 * I, 1 * I, -4, 3, -7, 6),
    (8, 1): (
        -1 * I,
        2 * I,
        -3,
        4,
        -2 * I,
        1 * I,
        -5 * I,
        6 * I,
        -7 * I,
        8 * I,
        -4,
        3,
        -8 * I,
        7 * I,
        -6 * I,
        5 * I,
    ),
    (8, 2): (
        1,
        -2,
        3 * I,
        -4 * I,
        5 * I,
        -6 * I,
        7 * I,
        -8 * I,
        2,
        -1,
        8 * I,
        -3 * I,
        4 * I,
        -5 * I,
        6 * I,
        -7 * I,
    ),
    (8, 3): (
        -1,
        2,
        -3,
        4,
        -5 * I,
        6 * I,
        -7 * I,
        8 * I,
        -4,
        3,
        -2,
        1,
        -8 * I,
        7 * I,
        -6 * I,
        5 * I,
    ),
    (8, 4): (
        -1 * I,
        2,
        -3,
        4,
        -5,
        1 * I,
        -6 * I,
        7 * I,
        -8 * I,
        5,
        -4,
        3,
        -2,
        6 * I,
        -7 * I,
        8 * I,
    ),
    (8, 5): (-1 * I, 2 * I, -3, 4, -5, 6, -7, 8, -2 * I, 1 * I, -6, 7, -8, 3, -4, 5),
    (8, 6): (
        1,
        -2,
        3 * I,
        -4 * I,
        5 * I,
        -6 * I,
        7 * I,
        -8 * I,
        2,
        -1,
        8 * I,
        -7 * I,
        6 * I,
        -3 * I,
        4 * I,
        -5 * I,
    ),
    (8, 7): (
        -1 * I,
        2 * I,
        -3 * I,
        1 * I,
        -4,
        5,
        -6,
        7,
        -8,
        4,
        -2 * I,
        3 * I,
        -5,
        6,
        -7,
        8,
    ),
    (8, 8): (
        1,
        -2,
        3,
        -4 * I,
        5 * I,
        -6 * I,
        4 * I,
        -7,
        8,
        -5 * I,
        6 * I,
        -3,
        2,
        -1,
        7,
        -8,
    ),
    (8, 9): (
        -1 * I,
        2 * I,
        -3 * I,
        4 * I,
        -5,
        6,
        -7,
        8,
        -2 * I,
        3 * I,
        -4 * I,
        1 * I,
        -8,
        5,
        -6,
        7,
    ),
    (8, 10): (
        -1,
        2,
        -3,
        4,
        -5,
        1,
        -2,
        6 * I,
        -7 * I,
        3,
        -4,
        8 * I,
        -6 * I,
        7 * I,
        -8 * I,
        5,
    ),
    (8, 11): (
        1,
        -2,
        3 * I,
        -4 * I,
        5 * I,
        -6 * I,
        7 * I,
        -8 * I,
        2,
        -1,
        8 * I,
        -5 * I,
        4 * I,
        -3 * I,
        6 * I,
        -7 * I,
    ),
    (8, 12): (
        -1,
        2,
        -3,
        4,
        -5 * I,
        6 * I,
        -4,
        3,
        -7 * I,
        8 * I,
        -2,
        1,
        -8 * I,
        7 * I,
        -6 * I,
        5 * I,
    ),
    (8, 13): (
        1 * I,
        -2 * I,
        3,
        -4,
        5,
        -6,
        7,
        -3,
        8 * I,
        -1 * I,
        2 * I,
        -8 * I,
        4,
        -7,
        6,
        -5,
    ),
    (8, 14): (
        -1,
        2,
        -3 * I,
        4 * I,
        -5 * I,
        6 * I,
        -7 * I,
        5 * I,
        -4 * I,
        8 * I,
        -2,
        1,
        -6 * I,
        7 * I,
        -8 * I,
        3 * I,
    ),
    (8, 15): (
        1 * I,
        -2 * I,
        3 * I,
        -4 * I,
        5 * I,
        -3 * I,
        6 * I,
        -7 * I,
        8 * I,
        -6 * I,
        2 * I,
        -1 * I,
        7 * I,
        -8 * I,
        4 * I,
        -5 * I,
    ),
    (8, 16): (
        1 * I,
        -2,
        3,
        -4 * I,
        5 * I,
        -6,
        2,
        -7 * I,
        4 * I,
        -5 * I,
        8 * I,
        -1 * I,
        7 * I,
        -3,
        6,
        -8 * I,
    ),
    (8, 17): (
        -1 * I,
        2 * I,
        -3,
        4,
        -5,
        6,
        -2 * I,
        7 * I,
        -4,
        5,
        -8 * I,
        1 * I,
        -6,
        3,
        -7 * I,
        8 * I,
    ),
    (8, 18): (
        -1,
        2 * I,
        -3 * I,
        4,
        -5,
        6 * I,
        -2 * I,
        7,
        -4,
        8 * I,
        -6 * I,
        1,
        -7,
        3 * I,
        -8 * I,
        5,
    ),
    (8, 19): (-1, 2, -3, -4, 5, 1, -2, -6, 4, 7, -8, -5, 6, 3, -7, 8),
    (8, 20): (
        -1,
        2 * I,
        3,
        -4,
        -5 * I,
        1,
        6 * I,
        -3,
        4,
        -7 * I,
        8 * I,
        5 * I,
        -2 * I,
        -6 * I,
        7 * I,
        -8 * I,
    ),
    (8, 21): (
        -1,
        2 * I,
        -3 * I,
        -4 * I,
        5 * I,
        -6,
        -7 * I,
        1,
        4 * I,
        -5 * I,
        8 * I,
        7 * I,
        -2 * I,
        3 * I,
        6,
        -8 * I,
    ),
    (9, 2): (
        -1 * I,
        2 * I,
        -3 * I,
        4 * I,
        -5 * I,
        6 * I,
        -7 * I,
        8 * I,
        -9 * I,
        1 * I,
        -2 * I,
        9 * I,
        -8 * I,
        7 * I,
        -6 * I,
        5 * I,
        -4 * I,
        3 * I,
    ),
    (9, 24): (
        -1 * I,
        2 * I,
        -3,
        4 * I,
        -5 * I,
        6,
        -7,
        8,
        -2 * I,
        1 * I,
        -6,
        7,
        -8,
        9 * I,
        -4 * I,
        5 * I,
        -9 * I,
        3,
    ),
    (9, 32): (
        -1 * I,
        2 * I,
        -3,
        4,
        -5,
        6,
        -7,
        8,
        -2 * I,
        9 * I,
        -4,
        7,
        -8,
        3,
        -9 * I,
        1 * I,
        -6,
        5,
    ),
    (10, 132): (
        1 * I,
        -2 * I,
        3 * I,
        -1 * I,
        -4,
        5 * I,
        6,
        -7 * I,
        -8,
        4,
        9 * I,
        -6,
        -10 * I,
        8,
        2 * I,
        -3 * I,
        7 * I,
        10 * I,
        -5 * I,
        -9 * I,
    ),
    (11, 1): (
        -1,
        2 * I,
        -3 * I,
        -4,
        5,
        6 * I,
        -2 * I,
        7,
        -8,
        3 * I,
        -6 * I,
        1,
        -7,
        8,
        9 * I,
        -10 * I,
        11 * I,
        -5,
        4,
        -9 * I,
        10 * I,
        -11 * I,
    ),
    (11, 2): (
        -1,
        2 * I,
        -3 * I,
        -4 * I,
        5 * I,
        -6 * I,
        7,
        -8,
        4 * I,
        -5 * I,
        6 * I,
        9 * I,
        -2 * I,
        10,
        -11,
        3 * I,
        -9 * I,
        1,
        -10,
        11,
        8,
        -7,
    ),
    (11, 42): (
        -1,
        2,
        3 * I,
        -4,
        5,
        -6,
        7,
        -3 * I,
        8 * I,
        -5,
        6,
        9 * I,
        -10 * I,
        11 * I,
        -9 * I,
        1,
        -2,
        10 * I,
        -11 * I,
        -7,
        4,
        -8 * I,
    ),
}


# Get the finite part of the standard Gauss sequence representation
# for the knot given by index `ind` in the gknot table.
#
# Note, sign in gknot is represented by the presence / absence of the
# imaginary unit j.
def finite_gauss_seq(ind):
    gc = gknot[ind]

    # Collect the sign information for each crossing j in a handy dict.
    # Note, this defines the part of the b_j that contain the mu's and stuff
    j_terms = {}
    for term in gc:
        j = Integer(abs(term))  # expressions `<int>j` cast to float, undo that
        if j in j_terms:  # If we've encountered k already no need to fill entry
            continue
        else:
            if term in RR:  # This is when neg mu_j = -
                j_terms[j] = (j * I, -1 * j * I)
            else:
                j_terms[j] = (-1 * j, j)

    out_code = []
    for j in range(1, len(gc) / 2 + 1):
        # Have to do 2*j - 2, 2 * j -1 to account for 0-indexing in python
        # while our definition in the document used 1-indexing.
        k1, k2 = gc[2 * j - 2], gc[2 * j - 1]
        j1, j2 = j_terms[j]

        if not j1 in RR:  # neg mu_j = -
            out_code += [k1, k2, j1, j2]
        else:
            out_code += [j1, j2, k1, k2]

    return out_code


def standard_unknot_code(n):
    """
    Standard unknot code of length n
    """
    out_code = []
    for i in range(1, n + 1):
        out_code += [-i, i, i * I, -1 * i * I]
    return out_code


def twoline(ind):
    """
    Return a dictionary representing the two-line encoding of our knot as a
    permutation on the standard unknot sequence.
    """
    u_gc = standard_unknot_code(ind[0])
    k_gc = finite_gauss_seq(ind)
    twoline = {}
    for u, k in zip(u_gc, k_gc):
        twoline[u] = k

    return twoline


def to_cycle(ind):
    """
    Return the cycle notation (stored as a list of tuples) for the permutation
    representation of our knot as acting on the standard unknot sequence.
    """
    tl = twoline(ind)

    keys = set(tl.keys())

    cycles = []
    while True:
        # Find the smallest item in our list. In the case of ZZ \cup i ZZ,
        # sage does tiebreaking by
        #   1) min(k, k*I) = k*I
        #   2) min(k, -k*I) = -k*I
        #   3) min(-k, k*I) = -k
        #   4) min(-k, -k*I) = -k.
        # None of these occur here, I just wanted to list a fun fact. The only
        # case we care about is min(-k*I, k*I) = -k*I.
        min_key = min(list(keys))

        # New cycle we're defining
        new_cycle = [min_key]

        # Keys to remove
        to_remove = set([min_key])
        while True:
            curr_el = new_cycle[-1]
            next_el = tl[curr_el]

            if next_el not in to_remove:
                new_cycle += [next_el]
                to_remove.add(next_el)

            else:
                break

        if len(new_cycle) > 1:
            cycles += [tuple(new_cycle)]

        keys -= to_remove

        # Check if keys is empty
        if keys == set():
            break

    return cycles


def gen_tables(overwrite_dict=False):
    """
    Generate some data tables listing the properties of our permutation
    representations
    """
    # Skip the unknot and also all knots with crossing number > 8
    inds = [key for key in gknot.keys() if (type(key) == type(()) and key[0] < 9)]

    # Output strings for the two different encodings we tend to favor
    out_str_chars = ""
    out_str_gint = ""

    cycle_dict = {}
    for ind in Bar("Processing").iter(inds):
        this_cycle = to_cycle(ind)
        cycle_dict[ind] = this_cycle
        this_order = kperm(ind).order()
        out_str_chars += (
            f"${ind}$"
            + " & "
            + f"${cycle_to_tex_str(this_cycle)}$ & {this_order} \\\\\n"
        )
        out_str_gint += f"${ind}$" + " & " + f"${this_cycle}$ & {this_order} \\\\\n"

    if overwrite_dict:
        with open("cycle_reps.sage", "w") as f:
            f.write("cycle_dict = " + str(cycle_dict))

    with open("cycle-table-chars.tex", "w") as f:
        f.write(out_str_chars)

    with open("cycle-table-gint.tex", "w") as f:
        # Need the two replaces here because the `1*I` case gets written as `I`
        out_str_gint = out_str_gint.replace("*I", "i").replace("I", "i")
        out_str_gint = out_str_gint.replace("[", "").replace("]", "").replace("),", ")")
        f.write(out_str_gint)

    return cycle_dict


def gc_to_tex_str(gc):
    """
    Given the gauss code represented as a list gc, return a string
    representation. If normalize=True, then normalize the labeling of the
    elements to be in increasing order when we look through.
    """
    out_str = ""
    for symbol in gc:
        char = Integer(abs(symbol))
        if symbol in RR:
            if symbol < 0:
                out_str += f"{char}^+_u, "
            else:
                out_str += f"{char}^+_o, "
        else:
            if symbol * (-1j) < 0:
                out_str += f"{char}^-_u, "
            else:
                out_str += f"{char}^-_o, "

    out_str = out_str[:-2]  # remove the trailing `, `

    return out_str


def cycle_to_tex_str(cycles):
    """
    Given the cycle presentation represented as a list of tuples, return a
    string representation for printing in LaTeX.
    """
    out_str = ""
    for cycle in cycles:
        out_str += "("

        for symbol in cycle:
            char = Integer(abs(symbol))
            if symbol in RR:
                if symbol < 0:
                    out_str += f"{char}^+_u, "
                else:
                    out_str += f"{char}^+_o, "
            else:
                if symbol * (-1j) < 0:
                    out_str += f"{char}^-_u, "
                else:
                    out_str += f"{char}^-_o, "

        out_str = out_str[:-2] + ")"  # remove trailing `, ` and add paren

    return out_str


def fixed_str(ind, include_unknot=True):
    """
    Print the original gauss code, the modified one, and the standard unknot
    sequences, highlighting places that don't change in gray.
    """
    # Begin the string with the original gauss code
    out_str = gc_to_tex_str(gknot[ind]) + "\n"

    knot_gc = finite_gauss_seq(ind)
    unknot_gc = standard_unknot_code(ind[0])

    split_k = gc_to_tex_str(knot_gc).split(",")
    split_u = gc_to_tex_str(unknot_gc).split(",")

    k_str = ""
    u_str = ""
    grayed = False
    for kchar, uchar in zip(split_k, split_u):
        if grayed:
            # In this case, we're already highlighting so just continue
            if kchar == uchar:
                k_str += f",{kchar}"
                u_str += f",{uchar}"

            # Else, stop highlighting
            else:
                grayed = False
                k_str += "}," + kchar
                u_str += "}," + uchar

        else:
            # Start highlighting
            if kchar == uchar:
                grayed = True
                k_str += ", {\\color{gray}" + kchar
                u_str += ", {\\color{gray}" + uchar
            else:
                k_str += f",{kchar}"
                u_str += f",{uchar}"

    # If ending in a grayed state
    if grayed:
        k_str += "}"
        u_str += "}"

    # remove the leading comma
    k_str = k_str[1:]
    u_str = u_str[1:]

    if include_unknot:
        out_str += u_str + "\\\\\n" + k_str
    else:
        out_str += k_str
    return out_str


def inserted_str(ind, include_unknot=True):
    """
    Print the original gauss code, the modified one, and the standard unknot
    sequences, highlighting places that are newly-inserted in the modified gauss
    code in gray.
    """
    # Begin the string with the original gauss code
    out_str = gc_to_tex_str(gknot[ind]) + "\n"

    knot_gc = finite_gauss_seq(ind)
    unknot_gc = standard_unknot_code(ind[0])

    split_k = gc_to_tex_str(knot_gc).split(",")
    k_pairs = [(split_k[2 * i], split_k[2 * i + 1]) for i in range(len(split_k) // 2)]
    split_u = gc_to_tex_str(unknot_gc).split(",")
    u_pairs = [(split_u[2 * i], split_u[2 * i + 1]) for i in range(len(split_u) // 2)]

    k_str = ""
    u_str = ""
    grayed = False
    for kpair, upair in zip(k_pairs, u_pairs):
        kchar = kpair[0] + kpair[1]
        uchar = upair[0] + upair[1]
        if grayed:
            # In this case, we're already highlighting so just continue
            if kchar == uchar:
                k_str += f",{kchar}"
                u_str += f",{uchar}"

            # Else, stop highlighting
            else:
                grayed = False
                k_str += "}," + kchar
                u_str += "}," + uchar

        else:
            # Start highlighting
            if kchar == uchar:
                grayed = True
                k_str += ", {\\color{gray}" + kchar
                u_str += ", {\\color{gray}" + uchar
            else:
                k_str += f",{kchar}"
                u_str += f",{uchar}"

    # If ending in a grayed state
    if grayed:
        k_str += "}"
        u_str += "}"

    # remove the leading comma
    k_str = k_str[1:]
    u_str = u_str[1:]

    if include_unknot:
        out_str += u_str + "\\\\\n" + k_str
    else:
        out_str += k_str
    return out_str


def kperm(ind):
    """
    Get a PermutationGroupElement representation for the gcode element
    given.

    This is a bit of a hack. But then again, the entire library is.
    """
    cycles = cycle_dict[ind]
    kgroup = PermutationGroup(cycles)
    gens = kgroup.gens()
    if len(gens) == 1:
        return gens[0]
    else:
        gen = gens[0]
        for g in gens[1:]:
            gen = gen * g
        return gen


def cyclic_perm(n):
    """
    Define the standard cyclic permutation up to length n, making sure
    that we permute the imaginary terms consistently with the real
    ones.

    Will generate indexing from 1 up to n inclusive.
    """
    # perm range
    prange = range(-n - 1, n + 1)

    reals = tuple([k for k in prange if k != 0])
    imags = tuple([I * k for k in prange if k != 0])

    pgroup = PermutationGroup([reals, imags])

    gens = pgroup.gens()
    # There really has to be a better way to get around the fact that
    # PermutationGroupElement doesn't like being initialized with
    # non-integers
    if len(gens) == 1:
        return gens[0]
    else:
        gen = gens[0]
        for g in gens[1:]:
            gen = gen * g
        return gen


# THIS is not a good name, because it could be confused with the cycle
# notation.
def cycle(perm, n, order=1):
    """
    Cyclically permute the entries of `perm` by conjugating by a
    cyclic permutation
    """
    # C for cyclic permutation, n for the order
    cn = cyclic_perm(n)

    c = cn ^ order

    return c * perm * c ^ (-1)


def test_cycler(perm, n, order=1):
    print(reduce_oneline(perm))
    print(reduce_oneline(cycle(perm, n, order=order)))


def action(kperm):
    """
    Given the permutation representation, convert it back to a one-line
    representation by taking the action on the standard unknot
    """
    n = max([abs(k) for k in kperm.tuple()])
    u_gc = standard_unknot_code(n)

    output = []
    for uchar in u_gc:
        try:
            output += [kperm(uchar)]
            # If the permutation isn't defined on the character (happens 50% of
            # the time), we get this
        except ValueError as e:
            # print(uchar)
            output += [uchar]
    return output


def test_action():
    """
    Test to make sure that the action function is working properly
    """
    probs = []
    inds = [key for key in gknot.keys() if key[0] < 9]
    for ind in inds:
        fg = finite_gauss_seq(ind)
        act = action(kperm(ind))
        if fg != act:
            print(fg, act)
            probs += [ind]
    return probs


def reduce_oneline(kperm):
    """
    Remove (the parts of the standard gauss sequence for kperm's action on the
    standard unknot) that represent the auxilliary crossings we added to define
    the permutation representation.
    """
    ol = action(kperm)
    uc = standard_unknot_code(len(ol) // 2)

    u_pairs = [(uc[2 * i], uc[2 * i + 1]) for i in range(len(uc) // 2)]
    k_pairs = [(ol[2 * i], ol[2 * i + 1]) for i in range(len(ol) // 2)]

    output = []
    for up, kp in zip(u_pairs, k_pairs):
        if up == kp:
            continue
        else:
            output += [kp[0], kp[1]]
    return output


def remove_reidI(oneline, recursed=False):
    """
    Reduce by reidemeister I moves
    """
    if oneline == []:
        return []

    pairs = zip(oneline, oneline[1:] + [oneline[0]])
    output = []
    gone = set()
    for (n1, n2) in pairs:
        if abs(n1) == abs(n2):
            if (n1 in RR and n2 in RR) or (n1 not in RR and n2 not in RR):
                gone.add(n1)
                gone.add(n2)

    output = [val for val in oneline if val not in gone]

    if recursed:
        if output == oneline:
            return output
        else:
            return remove_reidI(output, recursed=True)
    else:
        return remove_reidI(output, recursed=True)


def remove_reidII(oneline, recursed=False):
    """
    Search for places in the gauss code where we can do gauss code Reidemeister
    II
    """
    if oneline == []:
        return []

    n = len(oneline)
    crossing_inds = {}
    for i, c in enumerate(oneline):
        cabs = abs(c)
        if cabs not in crossing_inds:
            crossing_inds[cabs] = [i]
        else:
            crossing_inds[cabs] += [i]

    remove = set()
    for c1, c2 in zip(oneline, oneline[1:] + [oneline[0]]):
        # Reidemeister II'able crossings have to have opposite signs
        if c1 * c2 in RR:
            continue
        elif (real(c1) != imag(c2)) or (imag(c1) != real(c2)):
            continue

        c1is = crossing_inds[abs(c1)]
        c2is = crossing_inds[abs(c2)]
        for i in c1is:
            if i + 1 in c2is or i - 1 in c2is:
                all_cs = set([oneline[i] for i in c1is] + [oneline[i] for i in c2is])
                remove |= all_cs

    output = [c for c in oneline if c not in remove]
    if recursed:
        if output == oneline:
            return output
        else:
            return remove_reidII(output, recursed=True)
    else:
        return remove_reidII(output, recursed=True)


def r1_r2_reduced_action(kperm, recursed=False):
    """
    Remove reidemeister I and reidemeister II moves until there are none left.
    """
    if recursed:
        ol = remove_reidI(kperm)
        ol = remove_reidII(ol)
        if kperm == ol:
            return kperm
        else:
            return remove_reidII(ol, recursed=True)
    else:
        ol = reduce_oneline(kperm)
        ol = remove_reidI(ol)
        ol = remove_reidII(ol)

        return r1_r2_reduced_action(ol, recursed=True)


def test_reduce():
    """
    Test to make sure that the reducing function is working properly
    """
    probs = []
    inds = [key for key in gknot.keys() if key[0] < 9]
    for ind in inds:
        gc = gknot[ind]
        act = tuple(r1_r2_reduced_action(kperm(ind)))
        if gc != act:
            print(gc, act)
            probs += [ind]
    return probs


def reduced_orbit(ind):
    """
    Compute the orbit of the knot permutation as acting on the standard unknot
    and reduce each term
    """
    # Store length of outputs in a dict
    orblens = {}
    kp = kperm(ind)
    for i in range(1, kp.order()):
        l = len(r1_r2_reduced_action(kp ^ i))  # Take the i'th power of k
        if l not in orblens:
            orblens[l] = [i]
        else:
            orblens[l] += [i]
    return orblens


def compute_conn_sum_indices(reduced_oneline):
    """
    This function and the one coming after it are a bit of a mess. That's all I
    can say for now.
    """
    # Search through for all the points where we could possiblyy cut the gauss
    # code to yield a connected sum
    #
    # I'm sure there's a far more efficient algorithm for this. Seems like doing
    # it w/ dynamic programming and building up the blocks starting w/ 3-element
    # subsets could be way better than this nonsense. But maybe not? I'm
    # tired...
    all_abss = set([abs(c) for c in reduced_oneline])
    n = len(all_abss)
    sum_inds = []

    for i in range(len(reduced_oneline)):
        seen_once = set()
        seen_twice = set()
        for j, char in enumerate(reduced_oneline[i:] + reduced_oneline[:i]):
            absc = abs(char)
            if char not in seen_once:
                seen_once.add(char)
            else:
                seen_twice.add(char)
                if seen_once == seen_twice:
                    if seen_once != all_abss:
                        print(seen_once, i, j, (i + j) % (2 * n))
                        sum_inds += [(i + j) % (2 * n)]

    # This is terrible but I'm going to do it anyways. I'm too lazy to read the
    # code above to check whether it's possible to add i more than once [seems
    # likely] so I'm just gonna do this
    # OK: The list comprehension removes the trivial case
    # Needs t
    # link_inds = tuple(sorted(list(set([ind for ind in link_inds if ind != 0]))))
    sum_inds = tuple(sorted(list(set(sum_inds))))
    return sum_inds


def is_prime(reduced_oneline):
    all_abss = set([abs(c) for c in reduced_oneline])
    n = len(all_abss)

    for i in range(len(reduced_oneline)):
        seen_once = set()
        seen_twice = set()
        for j, char in enumerate(reduced_oneline[i:] + reduced_oneline[:i]):
            absc = abs(char)
            if char not in seen_once:
                seen_once.add(char)
            else:
                seen_twice.add(char)
                if seen_once == seen_twice:
                    if seen_once != all_abss:
                        return False

    return True


def reduced_orbit_primes(ind):
    """
    Compute the orbit of the knot permutation as acting on the standard unknot
    and reduce each term
    """
    # Store the connect sum types for the output in a dictionary
    orb_csts = {}
    kp = kperm(ind)
    for i in range(1, kp.order()):
        cs_inds = compute_conn_sum_indices(r1_r2_reduced_action(kp ^ i))
        if cs_inds not in orb_csts:
            orb_csts[cs_inds] = [i]
        else:
            orb_csts[cs_inds] += [i]
    return orb_csts


def construct_mult_table():
    """
    Gives the length of the reidemeister I, reidemeister II reduced knot given
    by multiplying each pair of knots together, along with whether it is prime
    """
    inds = [key for key in gknot.keys() if key[0] < 9]
    cycle_dict = {ind: kperm(ind) for ind in inds}

    products = []
    for (i, ind1) in Bar("Computing...").iter(enumerate(inds)):
        row = []
        for ind2 in inds:
            prod = cycle_dict[ind1] * cycle_dict[ind2]
            reduced_ol = r1_r2_reduced_action(prod)
            # prime_bool = is_prime(reduced_ol)
            try:
                assert len(reduced_ol) % 2 == 0
            except AssertionError as e:
                print(ind1, ind2)
            num_crosses = len(reduced_ol) // 2
            row += [num_crosses]
        products += [row]

    rot_a = r"\rotatebox{90}{"
    rot_b = "}"
    out_str = " & "
    for ind in inds:

        out_str += f"{rot_a}{ind}{rot_b} & "
    out_str = out_str[:-2] + "\\\\ \\midrule \n"

    for ind, row in zip(inds, products):
        out_str += f"{ind} & "
        for entry in row:
            out_str += f"{entry} & "
        out_str = out_str[:-2] + "\\\\\n"

    with open("mult-table-noprime.tex", "w") as f:
        f.write(out_str)

    with open("mult_table_products.sage", "w") as f:
        f.write(f"products = {products}")

    return products


def construct_mult_table():
    """
    Gives the length of the reidemeister I, reidemeister II reduced knot given
    by multiplying each pair of knots together, along with whether it is prime
    """
    inds = [key for key in gknot.keys() if key[0] < 9]
    cycle_dict = {ind: kperm(ind) for ind in inds}

    products = []
    for (i, ind1) in Bar("Computing...").iter(enumerate(inds)):
        row = []
        for ind2 in inds:
            G = PermutationGroup([cycle_dict[ind1], cycle_dict[ind2]])
            row += [floor(log(G.order()))]
        products += [row]

    rot_a = r"\rotatebox{90}{"
    rot_b = "}"
    out_str = " & "
    for ind in inds:
        out_str += f"{rot_a}{ind}{rot_b} & "

    out_str = out_str[:-2] + "\\\\ \\midrule \n"

    for ind, row in zip(inds, products):
        out_str += f"{ind} & "
        for entry in row:
            out_str += f"{entry} & "
        out_str = out_str[:-2] + "\\\\\n"

    with open("pairwise-orders-logs.tex", "w") as f:
        f.write(out_str)

    with open("pairwise-orders-logs.sage", "w") as f:
        f.write(f"products = {products}")

    return products
