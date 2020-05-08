# What this is
A repository to host a copy of my undergraduate thesis, including full
source code for all diagrams, programs, and so on. The main goals for
the thesis were

+ Establish some connection between knots and group-like structure
  through the use of unknotting moves, and
+ Try to better understand the conditions under which it's possible to
  perform a countable sequence of ambient isotopies (e.g.,
  Reidemeister moves) in succession while preserving ambient isotopy
  in the limit.

# Reading it
The main document is under the
[`thesis-doc`](https://github.com/redpanda1234/thesis-public/tree/master/thesis-doc)
folder, and is titled
[`kobayashi-thesis.pdf`](https://github.com/redpanda1234/thesis-public/blob/master/thesis-doc/kobayashi-thesis.pdf).
We recommend downloading the file to view it, as it is >250 pages and
Github was not designed as a `.pdf` viewer. If you're a `zathura`
user, you can use the `recolor` option to view the `.pdf` with the
color scheme I use. Here's my `.zathurarc`:
```
set recolor true
set recolor-lightcolor "#1D252C"
set recolor-darkcolor "#D6D7D9"
set default-bg "#1D252C"
```

# What to do if you find errata / typos
Feel free to submit an [issue
report](https://github.com/redpanda1234/thesis-public/issues). Email
is also fine!

# Using code
Most of the code for the main document should be fairly clean. By
contrast, the `figures/` directory a bit disorganized. If you have
questions about any particular diagrams / how I generated them, feel
free to get in touch.
