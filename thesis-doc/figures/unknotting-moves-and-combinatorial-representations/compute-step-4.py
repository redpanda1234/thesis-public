# This computes the casework for part (4) of the definition of the
# diagram graph.


def get_verts(uo, sgn, verbose=False):
    """
    Return the ordering of the vertices around the center vertex, in
    the order of

    1. right
    2. top
    3. left
    4. bottom
    """
    left = (uo, "in")
    right = (uo, "out")

    # Now the gross part. Yes, this code could be compactified. No, I
    # won't do it.
    if uo == "o":
        other_uo = "u"
        if sgn < 0:
            # vertical understrand, negative crossing
            #
            tio = "in"
            bio = "out"
            magic_str = f"""
         {other_uo}, {tio:3}
           |
           |
           |

{uo}, in -----------> {uo}, out

           |
           |
           v
         {other_uo}, {bio:3}
            """
            if verbose:
                print(magic_str)
            #
            top = (other_uo, tio)
            bottom = (other_uo, bio)
        else:
            # vertical understrand, positive crossing
            tio = "out"
            bio = "in"
            magic_str = f"""
         {other_uo}, {tio:3}
           ^
           |
           |

{uo}, in -----------> {uo}, out

           |
           |
           |
         {other_uo}, {bio:3}
            """
            if verbose:
                print(magic_str)
            #      ^
            #      |
            #
            # ----------->
            #
            #      |
            #      y
            #
            top = (other_uo, tio)
            bottom = (other_uo, bio)
    elif uo == "u":
        other_uo = "o"
        if sgn < 0:
            # vertical overstrand, negative crossing
            #
            tio = "out"
            bio = "in"
            # Middle line is 11 chars to center
            magic_str = f"""
         {other_uo}, {tio:3}
           ^
           |
           |
{uo}, in ---- | ----> {uo}, out
           |
           |
           |
         {other_uo}, {bio:3}
            """
            if verbose:
                print(magic_str)
            #
            top = (other_uo, tio)
            bottom = (other_uo, bio)
        else:
            # vertical overstrand, positive crossing
            tio = "in"
            bio = "out"
            # Middle line is 11 chars to center
            magic_str = f"""
         {other_uo}, {tio:3}
           |
           |
           |
{uo}, in ---- | ----> {uo}, out
           |
           |
           v
         {other_uo}, {bio:3}
            """
            if verbose:
                print(magic_str)
            #
            #      y
            #      |
            #      |
            # ---- | ---->
            #      |
            #      |
            #      v
            #
            top = (other_uo, tio)
            bottom = (other_uo, bio)
    else:
        print(f"Received bad input: uo = {uo}, sgn = {sgn}")
    return (right, top, left, bottom)


def test_get_verts():
    print("o, 1")
    print(get_verts("o", 1), "\n\n\n\n\n\n", verbose=True)

    print("o, -1")
    print(get_verts("o", -1), "\n\n\n\n\n\n", verbose=True)

    print("u, 1")
    print(get_verts("u", 1), "\n\n\n\n\n\n", verbose=True)

    print("u, -1")
    print(get_verts("u", -1), "\n\n\n\n\n\n", verbose=True)


def get_pairings():
    uos = ["u", "o"]
    sgns = [1, -1]
    ctypes = [(uo, sgn) for uo in uos for sgn in sgns]
    cpairs = [(ct1, ct2) for ct1 in ctypes for ct2 in ctypes]

    # crap_dict = {}
    garbage = ""
    for (ct1, ct2) in cpairs:

        this_crap_string = ""

        # print(ct1, ct2)
        right, _, _, bot = get_verts(ct1[0], ct1[1])
        _, top, left, _ = get_verts(ct2[0], ct2[1])

        (kuo, keps), (luo, leps) = ct1, ct2

        (kruo, krio) = right
        (kbuo, kbio) = bot
        (ltuo, ltio) = top
        (lluo, llio) = left
        # (((kruo, krio), (kbuo, ktio)), ((ltuo, ltio), (lluo, llio))) = (
        #     (right, bot),
        #     (top, left),
        # )

        k_r_io_str = "{\\rm " + krio + "}"
        k_r_str = f"k_{kruo}^{k_r_io_str}"

        k_b_io_str = "{\\rm " + kbio + "}"
        k_b_str = f"k_{kbuo}^{k_b_io_str}"

        l_t_io_str = "{\\rm " + ltio + "}"
        l_t_str = f"\\ell_{ltuo}^{l_t_io_str}"

        l_l_io_str = "{\\rm " + llio + "}"
        l_l_str = f"\\ell_{lluo}^{l_l_io_str}"

        kepsstr = f"{keps:+}"[0]
        lepsstr = f"{leps:+}"[0]
        this_crap_string += f"\\item \\small $(\\ell_{luo}^{lepsstr})$: \\footnotesize "
        # # $v_k = {k_r_str}$, $u_k = {k_b_str}$,
        this_crap_string += f"$v_\\ell = {l_t_str}$, $u_\\ell = {l_l_str}$\n"
        garbage += this_crap_string

        # val = ((right, bot), (top, left))
        # key = (ct1, ct2)
        # # print(key)
        # if key not in crap_dict:
        #     crap_dict[key] = [val]
        # else:
        #     crap_dict[key] += [val]

    # print(crap_dict)
    with open("step-4-garbage.txt", "w") as myfile:
        myfile.write(garbage)
    return garbage


# crap_dict = get_pairings()
# crap_strings = []
# for key in crap_dict:
#     (kuo, keps), (luo, leps) = key
#     ((((kruo, krio), (kbuo, ktio)), ((ltuo, ltio), (lluo, llio))),) = crap_dict[key]
#     assert ((kruo, krio), (kbuo, ktio)) == (
#         get_verts(kuo, keps)[0],
#         get_verts(kuo, keps)[-1],
#     )
#     assert ((ltuo, ltio), (lluo, llio)) == (
#         get_verts(luo, leps)[1],
#         get_verts(luo, leps)[2],
#     )

#     print(crap_dict[key])
garbage = get_pairings()
