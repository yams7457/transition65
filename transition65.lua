---@diagnostic disable: unreachable-code
m = midi.connect(1)
g = grid.connect()

params:add_number(
    "bassEvery", -- id
    "bass every", -- name
    1, -- min
    16, -- max
    8, -- default
    false -- wrap
    )
params:add_number(
    "melodyProb", -- id
    "melody probability", -- name
    0, -- min
    100, -- max
    100, -- default
    false -- wrap
    )

params:add_number(
    "compProb", -- id
    "comp probability", -- name
    0, -- min
    100, -- max
    12, -- default
    false -- wrap
    )

params:add_number(
    "bassProb", -- id
    "bass probability", -- name
    0, -- min
    100, -- max
    100, -- default
    false -- wrap
    )

params:add_number(
    "octaveOffset", -- id
    "octave offset", -- name
    0, -- min
    12, -- max
    3, -- default
    false -- wrap
    )


pentadQualities = {

{0, 1, 2, 4, 7},
{0, 1, 4, 7, 10},
{0, 2, 4, 7, 10},
{0, 2, 3, 4, 7},
{0, 3, 4, 7, 10},
{0, 2, 4, 5, 7},
{0, 4, 5, 7, 10},
{0, 2, 4, 6, 7},
{0, 4, 6, 7, 10},
{0, 2, 4, 7, 8},
{0, 4, 7, 8, 10},
{0, 2, 4, 7, 9},
{0, 4, 7, 9, 10},
{0, 2, 4, 7, 11},
{0, 4, 7, 10, 11},
{0, 1, 2, 3, 7},
{0, 2, 3, 7, 10},
{0, 2, 3, 5, 7},
{0, 2, 3, 6, 7},
{0, 3, 6, 7, 10},
{0, 2, 3, 7, 9},
{0, 3, 7, 9, 10},
{0, 2, 3, 7, 11},
{0, 3, 7, 10, 11},
{0, 2, 4, 8, 10},
{0, 1, 2, 3, 6},
{0, 2, 3, 6, 10},
{0, 2, 3, 4, 6},
{0, 3, 4, 6, 10},
{0, 2, 3, 5, 6},
{0, 3, 6, 9, 10},
{0, 2, 4, 9, 10},
{0, 2, 6, 7, 10},
{0, 4, 6, 10, 11}
  }

allTetrads = {


    {0, 1, 4, 7}, {1, 2, 5, 8}, {2, 3, 6, 9}, {3, 4, 7, 10}, {4, 5, 8, 11}, {0, 5, 6, 9}, {1, 6, 7, 10}, {2, 7, 8, 11}, {0, 3, 8, 9}, {1, 4, 9, 10}, {2, 5, 10, 11}, {0, 3, 6, 11},
    {0, 3, 6, 11}, {0, 1, 4, 7}, {1, 2, 5, 8}, {2, 3, 6, 9}, {3, 4, 7, 10}, {4, 5, 8, 11}, {0, 5, 6, 9}, {1, 6, 7, 10}, {2, 7, 8, 11}, {0, 3, 8, 9}, {1, 4, 9, 10}, {2, 5, 10, 11},
    {0, 3, 8, 9}, {1, 4, 9, 10}, {2, 5, 10, 11}, {0, 3, 6, 11}, {0, 1, 4, 7}, {1, 2, 5, 8}, {2, 3, 6, 9}, {3, 4, 7, 10}, {4, 5, 8, 11}, {0, 5, 6, 9}, {1, 6, 7, 10}, {2, 7, 8, 11},
    {0, 5, 6, 9}, {1, 6, 7, 10}, {2, 7, 8, 11}, {0, 3, 8, 9}, {1, 4, 9, 10}, {2, 5, 10, 11}, {0, 3, 6, 11}, {0, 1, 4, 7}, {1, 2, 5, 8}, {2, 3, 6, 9}, {3, 4, 7, 10}, {4, 5, 8, 11},
    {0, 2, 4, 7}, {1, 3, 5, 8}, {2, 4, 6, 9}, {3, 5, 7, 10}, {4, 6, 8, 11}, {0, 5, 7, 9}, {1, 6, 8, 10}, {2, 7, 9, 11}, {0, 3, 8, 10}, {1, 4, 9, 11}, {0, 2, 5, 10}, {1, 3, 6, 11},
    {0, 2, 5, 10}, {1, 3, 6, 11}, {0, 2, 4, 7}, {1, 3, 5, 8}, {2, 4, 6, 9}, {3, 5, 7, 10}, {4, 6, 8, 11}, {0, 5, 7, 9}, {1, 6, 8, 10}, {2, 7, 9, 11}, {0, 3, 8, 10}, {1, 4, 9, 11},
    {0, 3, 8, 10}, {1, 4, 9, 11}, {0, 2, 5, 10}, {1, 3, 6, 11}, {0, 2, 4, 7}, {1, 3, 5, 8}, {2, 4, 6, 9}, {3, 5, 7, 10}, {4, 6, 8, 11}, {0, 5, 7, 9}, {1, 6, 8, 10}, {2, 7, 9, 11},
    {0, 5, 7, 9}, {1, 6, 8, 10}, {2, 7, 9, 11}, {0, 3, 8, 10}, {1, 4, 9, 11}, {0, 2, 5, 10}, {1, 3, 6, 11}, {0, 2, 4, 7}, {1, 3, 5, 8}, {2, 4, 6, 9}, {3, 5, 7, 10}, {4, 6, 8, 11},
    {0, 3, 4, 7}, {1, 4, 5, 8}, {2, 5, 6, 9}, {3, 6, 7, 10}, {4, 7, 8, 11}, {0, 5, 8, 9}, {1, 6, 9, 10}, {2, 7, 10, 11}, {0, 3, 8, 11}, {0, 1, 4, 9}, {1, 2, 5, 10}, {2, 3, 6, 11},
    {0, 1, 4, 9}, {1, 2, 5, 10}, {2, 3, 6, 11}, {0, 3, 4, 7}, {1, 4, 5, 8}, {2, 5, 6, 9}, {3, 6, 7, 10}, {4, 7, 8, 11}, {0, 5, 8, 9}, {1, 6, 9, 10}, {2, 7, 10, 11}, {0, 3, 8, 11},
    {0, 3, 8, 11}, {0, 1, 4, 9}, {1, 2, 5, 10}, {2, 3, 6, 11}, {0, 3, 4, 7}, {1, 4, 5, 8}, {2, 5, 6, 9}, {3, 6, 7, 10}, {4, 7, 8, 11}, {0, 5, 8, 9}, {1, 6, 9, 10}, {2, 7, 10, 11},
    {0, 5, 8, 9}, {1, 6, 9, 10}, {2, 7, 10, 11}, {0, 3, 8, 11}, {0, 1, 4, 9}, {1, 2, 5, 10}, {2, 3, 6, 11}, {0, 3, 4, 7}, {1, 4, 5, 8}, {2, 5, 6, 9}, {3, 6, 7, 10}, {4, 7, 8, 11},
    {0, 4, 5, 7}, {1, 5, 6, 8}, {2, 6, 7, 9}, {3, 7, 8, 10}, {4, 8, 9, 11}, {0, 5, 9, 10}, {1, 6, 10, 11}, {0, 2, 7, 11}, {0, 1, 3, 8}, {1, 2, 4, 9}, {2, 3, 5, 10}, {3, 4, 6, 11},
    {0, 1, 3, 8}, {1, 2, 4, 9}, {2, 3, 5, 10}, {3, 4, 6, 11}, {0, 4, 5, 7}, {1, 5, 6, 8}, {2, 6, 7, 9}, {3, 7, 8, 10}, {4, 8, 9, 11}, {0, 5, 9, 10}, {1, 6, 10, 11}, {0, 2, 7, 11},
    {0, 2, 7, 11}, {0, 1, 3, 8}, {1, 2, 4, 9}, {2, 3, 5, 10}, {3, 4, 6, 11}, {0, 4, 5, 7}, {1, 5, 6, 8}, {2, 6, 7, 9}, {3, 7, 8, 10}, {4, 8, 9, 11}, {0, 5, 9, 10}, {1, 6, 10, 11},
    {0, 5, 9, 10}, {1, 6, 10, 11}, {0, 2, 7, 11}, {0, 1, 3, 8}, {1, 2, 4, 9}, {2, 3, 5, 10}, {3, 4, 6, 11}, {0, 4, 5, 7}, {1, 5, 6, 8}, {2, 6, 7, 9}, {3, 7, 8, 10}, {4, 8, 9, 11},
    {0, 4, 6, 7}, {1, 5, 7, 8}, {2, 6, 8, 9}, {3, 7, 9, 10}, {4, 8, 10, 11}, {0, 5, 9, 11}, {0, 1, 6, 10}, {1, 2, 7, 11}, {0, 2, 3, 8}, {1, 3, 4, 9}, {2, 4, 5, 10}, {3, 5, 6, 11},
    {0, 2, 3, 8}, {1, 3, 4, 9}, {2, 4, 5, 10}, {3, 5, 6, 11}, {0, 4, 6, 7}, {1, 5, 7, 8}, {2, 6, 8, 9}, {3, 7, 9, 10}, {4, 8, 10, 11}, {0, 5, 9, 11}, {0, 1, 6, 10}, {1, 2, 7, 11},
    {0, 1, 6, 10}, {1, 2, 7, 11}, {0, 2, 3, 8}, {1, 3, 4, 9}, {2, 4, 5, 10}, {3, 5, 6, 11}, {0, 4, 6, 7}, {1, 5, 7, 8}, {2, 6, 8, 9}, {3, 7, 9, 10}, {4, 8, 10, 11}, {0, 5, 9, 11},
    {0, 5, 9, 11}, {0, 1, 6, 10}, {1, 2, 7, 11}, {0, 2, 3, 8}, {1, 3, 4, 9}, {2, 4, 5, 10}, {3, 5, 6, 11}, {0, 4, 6, 7}, {1, 5, 7, 8}, {2, 6, 8, 9}, {3, 7, 9, 10}, {4, 8, 10, 11},
    {0, 4, 7, 8}, {1, 5, 8, 9}, {2, 6, 9, 10}, {3, 7, 10, 11}, {0, 4, 8, 11}, {0, 1, 5, 9}, {1, 2, 6, 10}, {2, 3, 7, 11}, {0, 3, 4, 8}, {1, 4, 5, 9}, {2, 5, 6, 10}, {3, 6, 7, 11},
    {0, 3, 4, 8}, {1, 4, 5, 9}, {2, 5, 6, 10}, {3, 6, 7, 11}, {0, 4, 7, 8}, {1, 5, 8, 9}, {2, 6, 9, 10}, {3, 7, 10, 11}, {0, 4, 8, 11}, {0, 1, 5, 9}, {1, 2, 6, 10}, {2, 3, 7, 11},
    {0, 1, 5, 9}, {1, 2, 6, 10}, {2, 3, 7, 11}, {0, 3, 4, 8}, {1, 4, 5, 9}, {2, 5, 6, 10}, {3, 6, 7, 11}, {0, 4, 7, 8}, {1, 5, 8, 9}, {2, 6, 9, 10}, {3, 7, 10, 11}, {0, 4, 8, 11},
    {0, 4, 8, 11}, {0, 1, 5, 9}, {1, 2, 6, 10}, {2, 3, 7, 11}, {0, 3, 4, 8}, {1, 4, 5, 9}, {2, 5, 6, 10}, {3, 6, 7, 11}, {0, 4, 7, 8}, {1, 5, 8, 9}, {2, 6, 9, 10}, {3, 7, 10, 11},
    {0, 4, 7, 9}, {1, 5, 8, 10}, {2, 6, 9, 11}, {0, 3, 7, 10}, {1, 4, 8, 11}, {0, 2, 5, 9}, {1, 3, 6, 10}, {2, 4, 7, 11}, {0, 3, 5, 8}, {1, 4, 6, 9}, {2, 5, 7, 10}, {3, 6, 8, 11},
    {0, 3, 5, 8}, {1, 4, 6, 9}, {2, 5, 7, 10}, {3, 6, 8, 11}, {0, 4, 7, 9}, {1, 5, 8, 10}, {2, 6, 9, 11}, {0, 3, 7, 10}, {1, 4, 8, 11}, {0, 2, 5, 9}, {1, 3, 6, 10}, {2, 4, 7, 11},
    {0, 2, 5, 9}, {1, 3, 6, 10}, {2, 4, 7, 11}, {0, 3, 5, 8}, {1, 4, 6, 9}, {2, 5, 7, 10}, {3, 6, 8, 11}, {0, 4, 7, 9}, {1, 5, 8, 10}, {2, 6, 9, 11}, {0, 3, 7, 10}, {1, 4, 8, 11},
    {0, 3, 7, 10}, {1, 4, 8, 11}, {0, 2, 5, 9}, {1, 3, 6, 10}, {2, 4, 7, 11}, {0, 3, 5, 8}, {1, 4, 6, 9}, {2, 5, 7, 10}, {3, 6, 8, 11}, {0, 4, 7, 9}, {1, 5, 8, 10}, {2, 6, 9, 11},
    {0, 4, 7, 10}, {1, 5, 8, 11}, {0, 2, 6, 9}, {1, 3, 7, 10}, {2, 4, 8, 11}, {0, 3, 5, 9}, {1, 4, 6, 10}, {2, 5, 7, 11}, {0, 3, 6, 8}, {1, 4, 7, 9}, {2, 5, 8, 10}, {3, 6, 9, 11},
    {0, 3, 6, 8}, {1, 4, 7, 9}, {2, 5, 8, 10}, {3, 6, 9, 11}, {0, 4, 7, 10}, {1, 5, 8, 11}, {0, 2, 6, 9}, {1, 3, 7, 10}, {2, 4, 8, 11}, {0, 3, 5, 9}, {1, 4, 6, 10}, {2, 5, 7, 11},
    {0, 3, 5, 9}, {1, 4, 6, 10}, {2, 5, 7, 11}, {0, 3, 6, 8}, {1, 4, 7, 9}, {2, 5, 8, 10}, {3, 6, 9, 11}, {0, 4, 7, 10}, {1, 5, 8, 11}, {0, 2, 6, 9}, {1, 3, 7, 10}, {2, 4, 8, 11},
    {0, 2, 6, 9}, {1, 3, 7, 10}, {2, 4, 8, 11}, {0, 3, 5, 9}, {1, 4, 6, 10}, {2, 5, 7, 11}, {0, 3, 6, 8}, {1, 4, 7, 9}, {2, 5, 8, 10}, {3, 6, 9, 11}, {0, 4, 7, 10}, {1, 5, 8, 11},
    {0, 4, 7, 11}, {0, 1, 5, 8}, {1, 2, 6, 9}, {2, 3, 7, 10}, {3, 4, 8, 11}, {0, 4, 5, 9}, {1, 5, 6, 10}, {2, 6, 7, 11}, {0, 3, 7, 8}, {1, 4, 8, 9}, {2, 5, 9, 10}, {3, 6, 10, 11},
    {0, 3, 7, 8}, {1, 4, 8, 9}, {2, 5, 9, 10}, {3, 6, 10, 11}, {0, 4, 7, 11}, {0, 1, 5, 8}, {1, 2, 6, 9}, {2, 3, 7, 10}, {3, 4, 8, 11}, {0, 4, 5, 9}, {1, 5, 6, 10}, {2, 6, 7, 11},
    {0, 4, 5, 9}, {1, 5, 6, 10}, {2, 6, 7, 11}, {0, 3, 7, 8}, {1, 4, 8, 9}, {2, 5, 9, 10}, {3, 6, 10, 11}, {0, 4, 7, 11}, {0, 1, 5, 8}, {1, 2, 6, 9}, {2, 3, 7, 10}, {3, 4, 8, 11},
    {0, 1, 5, 8}, {1, 2, 6, 9}, {2, 3, 7, 10}, {3, 4, 8, 11}, {0, 4, 5, 9}, {1, 5, 6, 10}, {2, 6, 7, 11}, {0, 3, 7, 8}, {1, 4, 8, 9}, {2, 5, 9, 10}, {3, 6, 10, 11}, {0, 4, 7, 11},
    {0, 1, 3, 7}, {1, 2, 4, 8}, {2, 3, 5, 9}, {3, 4, 6, 10}, {4, 5, 7, 11}, {0, 5, 6, 8}, {1, 6, 7, 9}, {2, 7, 8, 10}, {3, 8, 9, 11}, {0, 4, 9, 10}, {1, 5, 10, 11}, {0, 2, 6, 11},
    {0, 2, 6, 11}, {0, 1, 3, 7}, {1, 2, 4, 8}, {2, 3, 5, 9}, {3, 4, 6, 10}, {4, 5, 7, 11}, {0, 5, 6, 8}, {1, 6, 7, 9}, {2, 7, 8, 10}, {3, 8, 9, 11}, {0, 4, 9, 10}, {1, 5, 10, 11},
    {0, 4, 9, 10}, {1, 5, 10, 11}, {0, 2, 6, 11}, {0, 1, 3, 7}, {1, 2, 4, 8}, {2, 3, 5, 9}, {3, 4, 6, 10}, {4, 5, 7, 11}, {0, 5, 6, 8}, {1, 6, 7, 9}, {2, 7, 8, 10}, {3, 8, 9, 11},
    {0, 5, 6, 8}, {1, 6, 7, 9}, {2, 7, 8, 10}, {3, 8, 9, 11}, {0, 4, 9, 10}, {1, 5, 10, 11}, {0, 2, 6, 11}, {0, 1, 3, 7}, {1, 2, 4, 8}, {2, 3, 5, 9}, {3, 4, 6, 10}, {4, 5, 7, 11},
    {0, 2, 3, 7}, {1, 3, 4, 8}, {2, 4, 5, 9}, {3, 5, 6, 10}, {4, 6, 7, 11}, {0, 5, 7, 8}, {1, 6, 8, 9}, {2, 7, 9, 10}, {3, 8, 10, 11}, {0, 4, 9, 11}, {0, 1, 5, 10}, {1, 2, 6, 11},
    {0, 1, 5, 10}, {1, 2, 6, 11}, {0, 2, 3, 7}, {1, 3, 4, 8}, {2, 4, 5, 9}, {3, 5, 6, 10}, {4, 6, 7, 11}, {0, 5, 7, 8}, {1, 6, 8, 9}, {2, 7, 9, 10}, {3, 8, 10, 11}, {0, 4, 9, 11},
    {0, 4, 9, 11}, {0, 1, 5, 10}, {1, 2, 6, 11}, {0, 2, 3, 7}, {1, 3, 4, 8}, {2, 4, 5, 9}, {3, 5, 6, 10}, {4, 6, 7, 11}, {0, 5, 7, 8}, {1, 6, 8, 9}, {2, 7, 9, 10}, {3, 8, 10, 11},
    {0, 5, 7, 8}, {1, 6, 8, 9}, {2, 7, 9, 10}, {3, 8, 10, 11}, {0, 4, 9, 11}, {0, 1, 5, 10}, {1, 2, 6, 11}, {0, 2, 3, 7}, {1, 3, 4, 8}, {2, 4, 5, 9}, {3, 5, 6, 10}, {4, 6, 7, 11},
    {0, 3, 5, 7}, {1, 4, 6, 8}, {2, 5, 7, 9}, {3, 6, 8, 10}, {4, 7, 9, 11}, {0, 5, 8, 10}, {1, 6, 9, 11}, {0, 2, 7, 10}, {1, 3, 8, 11}, {0, 2, 4, 9}, {1, 3, 5, 10}, {2, 4, 6, 11},
    {0, 2, 4, 9}, {1, 3, 5, 10}, {2, 4, 6, 11}, {0, 3, 5, 7}, {1, 4, 6, 8}, {2, 5, 7, 9}, {3, 6, 8, 10}, {4, 7, 9, 11}, {0, 5, 8, 10}, {1, 6, 9, 11}, {0, 2, 7, 10}, {1, 3, 8, 11},
    {0, 2, 7, 10}, {1, 3, 8, 11}, {0, 2, 4, 9}, {1, 3, 5, 10}, {2, 4, 6, 11}, {0, 3, 5, 7}, {1, 4, 6, 8}, {2, 5, 7, 9}, {3, 6, 8, 10}, {4, 7, 9, 11}, {0, 5, 8, 10}, {1, 6, 9, 11},
    {0, 5, 8, 10}, {1, 6, 9, 11}, {0, 2, 7, 10}, {1, 3, 8, 11}, {0, 2, 4, 9}, {1, 3, 5, 10}, {2, 4, 6, 11}, {0, 3, 5, 7}, {1, 4, 6, 8}, {2, 5, 7, 9}, {3, 6, 8, 10}, {4, 7, 9, 11},
    {0, 3, 6, 7}, {1, 4, 7, 8}, {2, 5, 8, 9}, {3, 6, 9, 10}, {4, 7, 10, 11}, {0, 5, 8, 11}, {0, 1, 6, 9}, {1, 2, 7, 10}, {2, 3, 8, 11}, {0, 3, 4, 9}, {1, 4, 5, 10}, {2, 5, 6, 11},
    {0, 3, 4, 9}, {1, 4, 5, 10}, {2, 5, 6, 11}, {0, 3, 6, 7}, {1, 4, 7, 8}, {2, 5, 8, 9}, {3, 6, 9, 10}, {4, 7, 10, 11}, {0, 5, 8, 11}, {0, 1, 6, 9}, {1, 2, 7, 10}, {2, 3, 8, 11},
    {0, 1, 6, 9}, {1, 2, 7, 10}, {2, 3, 8, 11}, {0, 3, 4, 9}, {1, 4, 5, 10}, {2, 5, 6, 11}, {0, 3, 6, 7}, {1, 4, 7, 8}, {2, 5, 8, 9}, {3, 6, 9, 10}, {4, 7, 10, 11}, {0, 5, 8, 11},
    {0, 5, 8, 11}, {0, 1, 6, 9}, {1, 2, 7, 10}, {2, 3, 8, 11}, {0, 3, 4, 9}, {1, 4, 5, 10}, {2, 5, 6, 11}, {0, 3, 6, 7}, {1, 4, 7, 8}, {2, 5, 8, 9}, {3, 6, 9, 10}, {4, 7, 10, 11},
    {0, 3, 7, 9}, {1, 4, 8, 10}, {2, 5, 9, 11}, {0, 3, 6, 10}, {1, 4, 7, 11}, {0, 2, 5, 8}, {1, 3, 6, 9}, {2, 4, 7, 10}, {3, 5, 8, 11}, {0, 4, 6, 9}, {1, 5, 7, 10}, {2, 6, 8, 11},
    {0, 4, 6, 9}, {1, 5, 7, 10}, {2, 6, 8, 11}, {0, 3, 7, 9}, {1, 4, 8, 10}, {2, 5, 9, 11}, {0, 3, 6, 10}, {1, 4, 7, 11}, {0, 2, 5, 8}, {1, 3, 6, 9}, {2, 4, 7, 10}, {3, 5, 8, 11},
    {0, 2, 5, 8}, {1, 3, 6, 9}, {2, 4, 7, 10}, {3, 5, 8, 11}, {0, 4, 6, 9}, {1, 5, 7, 10}, {2, 6, 8, 11}, {0, 3, 7, 9}, {1, 4, 8, 10}, {2, 5, 9, 11}, {0, 3, 6, 10}, {1, 4, 7, 11},
    {0, 3, 6, 10}, {1, 4, 7, 11}, {0, 2, 5, 8}, {1, 3, 6, 9}, {2, 4, 7, 10}, {3, 5, 8, 11}, {0, 4, 6, 9}, {1, 5, 7, 10}, {2, 6, 8, 11}, {0, 3, 7, 9}, {1, 4, 8, 10}, {2, 5, 9, 11},
    {0, 3, 7, 11}, {0, 1, 4, 8}, {1, 2, 5, 9}, {2, 3, 6, 10}, {3, 4, 7, 11}, {0, 4, 5, 8}, {1, 5, 6, 9}, {2, 6, 7, 10}, {3, 7, 8, 11}, {0, 4, 8, 9}, {1, 5, 9, 10}, {2, 6, 10, 11},
    {0, 4, 8, 9}, {1, 5, 9, 10}, {2, 6, 10, 11}, {0, 3, 7, 11}, {0, 1, 4, 8}, {1, 2, 5, 9}, {2, 3, 6, 10}, {3, 4, 7, 11}, {0, 4, 5, 8}, {1, 5, 6, 9}, {2, 6, 7, 10}, {3, 7, 8, 11},
    {0, 4, 5, 8}, {1, 5, 6, 9}, {2, 6, 7, 10}, {3, 7, 8, 11}, {0, 4, 8, 9}, {1, 5, 9, 10}, {2, 6, 10, 11}, {0, 3, 7, 11}, {0, 1, 4, 8}, {1, 2, 5, 9}, {2, 3, 6, 10}, {3, 4, 7, 11},
    {0, 1, 4, 8}, {1, 2, 5, 9}, {2, 3, 6, 10}, {3, 4, 7, 11}, {0, 4, 5, 8}, {1, 5, 6, 9}, {2, 6, 7, 10}, {3, 7, 8, 11}, {0, 4, 8, 9}, {1, 5, 9, 10}, {2, 6, 10, 11}, {0, 3, 7, 11},
    {0, 2, 4, 8}, {1, 3, 5, 9}, {2, 4, 6, 10}, {3, 5, 7, 11}, {0, 4, 6, 8}, {1, 5, 7, 9}, {2, 6, 8, 10}, {3, 7, 9, 11}, {0, 4, 8, 10}, {1, 5, 9, 11}, {0, 2, 6, 10}, {1, 3, 7, 11},
    {0, 2, 6, 10}, {1, 3, 7, 11}, {0, 2, 4, 8}, {1, 3, 5, 9}, {2, 4, 6, 10}, {3, 5, 7, 11}, {0, 4, 6, 8}, {1, 5, 7, 9}, {2, 6, 8, 10}, {3, 7, 9, 11}, {0, 4, 8, 10}, {1, 5, 9, 11},
    {0, 4, 8, 10}, {1, 5, 9, 11}, {0, 2, 6, 10}, {1, 3, 7, 11}, {0, 2, 4, 8}, {1, 3, 5, 9}, {2, 4, 6, 10}, {3, 5, 7, 11}, {0, 4, 6, 8}, {1, 5, 7, 9}, {2, 6, 8, 10}, {3, 7, 9, 11},
    {0, 4, 6, 8}, {1, 5, 7, 9}, {2, 6, 8, 10}, {3, 7, 9, 11}, {0, 4, 8, 10}, {1, 5, 9, 11}, {0, 2, 6, 10}, {1, 3, 7, 11}, {0, 2, 4, 8}, {1, 3, 5, 9}, {2, 4, 6, 10}, {3, 5, 7, 11},
    {0, 1, 3, 6}, {1, 2, 4, 7}, {2, 3, 5, 8}, {3, 4, 6, 9}, {4, 5, 7, 10}, {5, 6, 8, 11}, {0, 6, 7, 9}, {1, 7, 8, 10}, {2, 8, 9, 11}, {0, 3, 9, 10}, {1, 4, 10, 11}, {0, 2, 5, 11},
    {0, 2, 5, 11}, {0, 1, 3, 6}, {1, 2, 4, 7}, {2, 3, 5, 8}, {3, 4, 6, 9}, {4, 5, 7, 10}, {5, 6, 8, 11}, {0, 6, 7, 9}, {1, 7, 8, 10}, {2, 8, 9, 11}, {0, 3, 9, 10}, {1, 4, 10, 11},
    {0, 3, 9, 10}, {1, 4, 10, 11}, {0, 2, 5, 11}, {0, 1, 3, 6}, {1, 2, 4, 7}, {2, 3, 5, 8}, {3, 4, 6, 9}, {4, 5, 7, 10}, {5, 6, 8, 11}, {0, 6, 7, 9}, {1, 7, 8, 10}, {2, 8, 9, 11},
    {0, 6, 7, 9}, {1, 7, 8, 10}, {2, 8, 9, 11}, {0, 3, 9, 10}, {1, 4, 10, 11}, {0, 2, 5, 11}, {0, 1, 3, 6}, {1, 2, 4, 7}, {2, 3, 5, 8}, {3, 4, 6, 9}, {4, 5, 7, 10}, {5, 6, 8, 11},
    {0, 2, 3, 6}, {1, 3, 4, 7}, {2, 4, 5, 8}, {3, 5, 6, 9}, {4, 6, 7, 10}, {5, 7, 8, 11}, {0, 6, 8, 9}, {1, 7, 9, 10}, {2, 8, 10, 11}, {0, 3, 9, 11}, {0, 1, 4, 10}, {1, 2, 5, 11},
    {0, 1, 4, 10}, {1, 2, 5, 11}, {0, 2, 3, 6}, {1, 3, 4, 7}, {2, 4, 5, 8}, {3, 5, 6, 9}, {4, 6, 7, 10}, {5, 7, 8, 11}, {0, 6, 8, 9}, {1, 7, 9, 10}, {2, 8, 10, 11}, {0, 3, 9, 11},
    {0, 3, 9, 11}, {0, 1, 4, 10}, {1, 2, 5, 11}, {0, 2, 3, 6}, {1, 3, 4, 7}, {2, 4, 5, 8}, {3, 5, 6, 9}, {4, 6, 7, 10}, {5, 7, 8, 11}, {0, 6, 8, 9}, {1, 7, 9, 10}, {2, 8, 10, 11},
    {0, 6, 8, 9}, {1, 7, 9, 10}, {2, 8, 10, 11}, {0, 3, 9, 11}, {0, 1, 4, 10}, {1, 2, 5, 11}, {0, 2, 3, 6}, {1, 3, 4, 7}, {2, 4, 5, 8}, {3, 5, 6, 9}, {4, 6, 7, 10}, {5, 7, 8, 11},
    {0, 3, 4, 6}, {1, 4, 5, 7}, {2, 5, 6, 8}, {3, 6, 7, 9}, {4, 7, 8, 10}, {5, 8, 9, 11}, {0, 6, 9, 10}, {1, 7, 10, 11}, {0, 2, 8, 11}, {0, 1, 3, 9}, {1, 2, 4, 10}, {2, 3, 5, 11},
    {0, 1, 3, 9}, {1, 2, 4, 10}, {2, 3, 5, 11}, {0, 3, 4, 6}, {1, 4, 5, 7}, {2, 5, 6, 8}, {3, 6, 7, 9}, {4, 7, 8, 10}, {5, 8, 9, 11}, {0, 6, 9, 10}, {1, 7, 10, 11}, {0, 2, 8, 11},
    {0, 2, 8, 11}, {0, 1, 3, 9}, {1, 2, 4, 10}, {2, 3, 5, 11}, {0, 3, 4, 6}, {1, 4, 5, 7}, {2, 5, 6, 8}, {3, 6, 7, 9}, {4, 7, 8, 10}, {5, 8, 9, 11}, {0, 6, 9, 10}, {1, 7, 10, 11},
    {0, 6, 9, 10}, {1, 7, 10, 11}, {0, 2, 8, 11}, {0, 1, 3, 9}, {1, 2, 4, 10}, {2, 3, 5, 11}, {0, 3, 4, 6}, {1, 4, 5, 7}, {2, 5, 6, 8}, {3, 6, 7, 9}, {4, 7, 8, 10}, {5, 8, 9, 11},
    {0, 3, 5, 6}, {1, 4, 6, 7}, {2, 5, 7, 8}, {3, 6, 8, 9}, {4, 7, 9, 10}, {5, 8, 10, 11}, {0, 6, 9, 11}, {0, 1, 7, 10}, {1, 2, 8, 11}, {0, 2, 3, 9}, {1, 3, 4, 10}, {2, 4, 5, 11},
    {0, 2, 3, 9}, {1, 3, 4, 10}, {2, 4, 5, 11}, {0, 3, 5, 6}, {1, 4, 6, 7}, {2, 5, 7, 8}, {3, 6, 8, 9}, {4, 7, 9, 10}, {5, 8, 10, 11}, {0, 6, 9, 11}, {0, 1, 7, 10}, {1, 2, 8, 11},
    {0, 1, 7, 10}, {1, 2, 8, 11}, {0, 2, 3, 9}, {1, 3, 4, 10}, {2, 4, 5, 11}, {0, 3, 5, 6}, {1, 4, 6, 7}, {2, 5, 7, 8}, {3, 6, 8, 9}, {4, 7, 9, 10}, {5, 8, 10, 11}, {0, 6, 9, 11},
    {0, 6, 9, 11}, {0, 1, 7, 10}, {1, 2, 8, 11}, {0, 2, 3, 9}, {1, 3, 4, 10}, {2, 4, 5, 11}, {0, 3, 5, 6}, {1, 4, 6, 7}, {2, 5, 7, 8}, {3, 6, 8, 9}, {4, 7, 9, 10}, {5, 8, 10, 11},
    {0, 3, 6, 9}, {1, 4, 7, 10}, {2, 5, 8, 11}, {0, 3, 6, 9}, {1, 4, 7, 10}, {2, 5, 8, 11}, {0, 3, 6, 9}, {1, 4, 7, 10}, {2, 5, 8, 11}, {0, 3, 6, 9}, {1, 4, 7, 10}, {2, 5, 8, 11}
}

noteCoordinates = {}
noteCoordinates[8] = {13, 6}
noteCoordinates[9] = {14, 6}
noteCoordinates[10] = {15, 6}
noteCoordinates[11] = {13, 5}
noteCoordinates[12] = {14, 5}
noteCoordinates[13] = {15, 5}
noteCoordinates[14] = {13, 4}
noteCoordinates[15] = {14, 4}
noteCoordinates[16] = {15, 4}
noteCoordinates[17] = {13, 3}
noteCoordinates[18] = {14, 3}
noteCoordinates[19] = {15, 3}
noteCoordinates[20] = {13, 2}
noteCoordinates[21] = {14, 2}
noteCoordinates[22] = {15, 2}
noteCoordinates[23] = {13, 1}
noteCoordinates[24] = {14, 1}
noteCoordinates[25] = {15, 1}








compDown = {-2,-3,-4,-7}
compUp = {3,4,6,7}
lastMelodyIndex = math.random(8,25)
sequence = {}
lastBassPitch = math.random(0,11)
bassFlag = 0
heldNotes = {}
lastPitchInRow = {}
bassArm = 0
compArm = 0
bassStep = 0
lastCompNote = 0

for i = 1,6 do
    lastPitchInRow[i] = {(7 - i) * 7}
end

for i = 1, 3 do
    heldNotes[i] = {}
    for j = 1,16 do
        heldNotes[i][j] = {}
        for k = 1,8 do
            heldNotes[i][j][k] = nil
        end
    end
end

function qualitiesToRoots()
    pentads = {}
    for i = 1, #pentadQualities do
        for j = 0,11 do
            table.insert(pentads, {(pentadQualities[i][1] + j) % 12, (pentadQualities[i][2] + j) % 12, (pentadQualities[i][3] + j) % 12, (pentadQualities[i][4] + j) % 12, (pentadQualities[i][5] + j) % 12})
            for i = 1,50 do pentads[#pentads][i + 5] = pentads[#pentads][i] + 12 end
            table.sort(pentads[#pentads])
        end
    end
end

function initialPentad()
    currentPentad = math.random(1,408)
end

function makeBassCollection()
    local bassCollectionWorking = {}
    for i = 1,5 do
        bassCollectionWorking[i] = (pentads[currentPentad][i] + 12) % 12
        bassCollectionWorking[i + 5] = (pentads[currentPentad][i] + 9) % 12
        bassCollectionWorking[i + 10] = (pentads[currentPentad][i] + 5) % 12
    end
    table.sort(bassCollectionWorking)

    bassCollectionNoDuplicates = removeDuplicates(bassCollectionWorking)
    
end

-- Function to remove duplicates
function removeDuplicates(tbl)
    local unique = {}
    local result = {}

    for _, v in ipairs(tbl) do
        if not unique[v] then
            unique[v] = true
            table.insert(result, v)
        end
    end

    return result
end

function noFlatNine()
    local toBeRemoved = {}
    bassCollection = {}

    -- Step 1 & 2: Iterate through pentads[currentPentad] and mark values in bassCollectionNoDuplicates
    for _, pentadValue in ipairs(pentads[currentPentad]) do
        for _, bassValue in ipairs(bassCollectionNoDuplicates) do
            if bassValue == pentadValue - 1 then
                toBeRemoved[bassValue] = true
            end
        end
    end

    -- Step 3: Create a new table without the values to be removed
    for _, bassValue in ipairs(bassCollectionNoDuplicates) do
        if not toBeRemoved[bassValue] then
            table.insert(bassCollection, bassValue)
        end
    end

    -- Step 4: Return the updated bassCollection
    return bassCollection
end

function bassOctaves()
    for i = 1,#bassCollection do
        if bassCollection[i] <= 5 then bassCollection[i] = bassCollection[i] + 12 end
    end
    table.sort(bassCollection)
    local length = #bassCollection
    for i = 1,#bassCollection do
        bassCollection[i + length ] = bassCollection[i] + 12
    end
end

function randomComp(x,y)
        local compNote
        if y <= 6 then 
            repeat
                compNote = pentads[currentPentad][lastMelodyIndex + compDown[math.random(1,4)]]
            until compNote ~= lastCompNote
        -- elseif y >= 3 then
        --     repeat
        --         compNote = pentads[currentPentad][lastMelodyIndex + compUp[math.random(1,4)]]
        --     until compNote ~= lastCompNote         
        end   
      lastCompNote = compNote % 12
      playNote(compNote, math.random(90,120), 2, x, y)
end

function randomBass(x,y)
    if bassFlag == 1 then
        makeBassCollection()
        bassFlag = 0
    end
    local pitch = bassCollection[math.random(1, #bassCollection)] - 12
    while pitch % 12 == lastMelodyPitch % 12 or pitch % 12 == lastCompNote % 12 or pitch % 12 == lastBassPitch do
        pitch = bassCollection[math.random(1, #bassCollection)] - 12
    end
    playNote(pitch, math.random(90,120), 3, x, y)
    lastBassPitch = pitch % 12
end

function melodyNote(x,y)
    local melodyIndex = (6 - y) * 3 + x - 12 + 7
    local pitch = pentads[currentPentad][melodyIndex]
    local vel = math.random(90, 120)
    appendNoteToSequence(pitch % 12, sequence)
    playNote(pitch, vel, 1, x, y)
    lastMelodyPitch = pitch
    lastMelodyIndex = melodyIndex
    lastPitchInRow[y] = pitch
end


function appendNoteToSequence(value, list)
    -- Check if the value is already in the table
    local is_duplicate = false
    for _, v in ipairs(list) do
        if v == value then
            is_duplicate = true
            break
        end
    end
    
    -- Append the new value if it's not a duplicate
    if not is_duplicate then
        list[#list + 1] = value
    
        -- Ensure the table has no more than four values
        while #list > 3 do
            -- Remove the oldest value
            table.remove(list, 1)
        end
    end
end

function playNote(pitch, vel, ch, x, y)
    m:note_on(pitch + params:get("octaveOffset") * 12,vel,ch)
    heldNotes[ch][x][y] = pitch + params:get("octaveOffset") * 12
end

function releaseNote(x,y)
    for i = 1,3 do
        if heldNotes[i][x][y] then
            m:note_off(heldNotes[i][x][y], 0, i)
            heldNotes[i][x][y] = nil
        end
    end
end

function pollForNotes(x,y)
    bassStep = bassStep + 1
    print(lastMelodyPitch)
    if math.random(1,100) <= params:get("melodyProb") then
        melodyNote(x,y)
    end
    if math.random(1,100) <= params:get("compProb") or compArm == 1 then
        randomComp(x,y)
        compArm = 0
    end
    
    if bassArm == 1 then
        randomBass(x,y)
        bassArm = 0
    elseif math.random(1,100) <= params:get("bassProb") and params:get("bassEvery") <= bassStep then
        randomBass(x,y)
        bassStep = bassStep % params:get("bassEvery")
    end
end

    function transition(direction, x, y)
        local suitableTetrads = {}
        local selectedTetrad
        local suitablePentads = {}
        local lastNote = lastPitchInRow[y] % 12 -- most recent note in sequence
    
        -- Calculate absolute distance between two notes
        local function calculateDistance(note1, note2)
            return math.abs(note1 - note2)
        end
    
        -- Find all suitable tetrads in allTetrads
        for i, tetrad in ipairs(allTetrads) do
            if tableContainsAll(tetrad, sequence) then
                table.insert(suitableTetrads, tetrad)
            end
        end
    
        -- If no suitable tetrads with all three elements, find with at least two
        if #suitableTetrads == 0 then
            for i, tetrad in ipairs(allTetrads) do
                if tableContainsAtLeastTwo(tetrad, sequence) then
                    table.insert(suitableTetrads, tetrad)
                end
            end
        end
    
        -- Find the pivot closest to the most recent note in sequence based on direction
        local closestDistance = math.huge
        for _, tetrad in ipairs(suitableTetrads) do
            for _, value in ipairs(tetrad) do
                if not tableContains(sequence, value) then
                    local distance = calculateDistance(lastNote, value % 12)
                    if direction == 1 and value > lastNote and distance < closestDistance then
                        closestDistance = distance
                        pivot = value
                        selectedTetrad = tetrad
                    elseif direction == -1 and value < lastNote and distance < closestDistance then
                        closestDistance = distance
                        pivot = value
                        selectedTetrad = tetrad
                    end
                end
            end
        end
    
        -- Rest of your function logic...    
    local foundPentad = false
    while not foundPentad do
        -- Randomly select one suitable tetrad
        selectedTetrad = suitableTetrads[math.random(#suitableTetrads)]

        -- Find the pivot
        for _, value in ipairs(selectedTetrad) do
            if not tableContains(sequence, value) then
                pivot = value
                break
            end
        end

        -- Clear the previous suitablePentads
        suitablePentads = {}

        -- Find all suitable pentads
        for i, pentad in ipairs(pentads) do
            if tableContainsAll(pentad, selectedTetrad, 5) then
                local commonNotes = countCommonNotes(pentad, pentads[currentPentad], 5)
                if commonNotes <= 4 then
                    table.insert(suitablePentads, {index = i, pentad = pentad})
                end
            end
        end

        -- Check if there are any suitable pentads
        if #suitablePentads > 0 then
            foundPentad = true
        end
    end

    -- Randomly select one suitable pentad
    local selectedPentad = suitablePentads[math.random(#suitablePentads)]
    currentPentad = selectedPentad.index
    for i = 1, 5 do print(pentads[currentPentad][i]) end
    adjustAndPlayThePivot(direction, x, y)
    pivotFlag = 0
    bassFlag = 1
end


function adjustAndPlayThePivot(direction, x, y)

    pivot = pivot + math.floor(lastMelodyPitch / 12) * 12

    if direction == -1 and pivot >= lastMelodyPitch then pivot = pivot - 12
    elseif direction == 1 and pivot <= lastMelodyPitch then pivot = pivot + 12 end

    appendNoteToSequence(pivot % 12, sequence)
    playNote(pivot, vel, 1, x, y)
    lastMelodyPitch = pivot
    lastMelodyIndex = findIndex(pivot, pentads[currentPentad])
    lastPitchInRow[y] = pivot
    bassArm = 1
    compArm = 1
end

-- Helper function to check if a table contains at least two elements from another table
function tableContainsAtLeastTwo(t, elements)
    local count = 0
    for _, e in ipairs(elements) do
        if tableContains(t, e) then
            count = count + 1
            if count >= 2 then
                return true
            end
        end
    end
    return false
end


function tableContains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

function tableContainsAll(table, values, limit)
    for _, value in ipairs(values) do
        if not tableContains(table, value, limit) then
            return false
        end
    end
    return true
end

function countCommonNotes(table1, table2, limit)
    local count = 0
    for i = 1, math.min(limit, #table1) do
        for j = 1, math.min(limit, #table2) do
            if table1[i] == table2[j] then
                count = count + 1
                break
            end
        end
    end
    return count
end

function findIndex(value, tbl)
    for i, v in ipairs(tbl) do
        if v == value then
            return i
        end
    end
    return nil
end



function init()
    qualitiesToRoots()
    initialPentad()
    makeBassCollection()
    bassCollection = noFlatNine()
    bassOctaves()
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~loaded up!')
end

----grid stuff!
function g.key(x, y, z, vel, dup)
    g:all(0)
    gridmap()

    if y <= 6 then channel = 1
    elseif y >= 7 then channel = 3
    end

    if z == 1 then
        if x >= 9 then
            g:led(x, y, 15)
        end
        if y <= 6 then
            if x >= 13 and x <= 15 then
                pollForNotes(x,y)
            elseif x == 16 then
                transition(1, x, y)
            elseif x == 12 then
                transition(-1, x, y)
            end
        end
        if y == 8 and x == 9 then
            compArm = 1
        end
        if y == 8 and x == 10 then
            bassArm = 1
        end
    end
    
    if z == 0 then
        releaseNote(x,y)
    end

    g:refresh()
end

function gridmap()
    for y = 1,6 do
      g:led(16,y,3)
      g:led(12,y,3)
    end
    for y = 1,6 do
      for x = 13,15 do
        g:led(x,y,5)
      end
    end
    for y = 7,8 do
      for x = 12,16 do
        g:led(x,y,8)
      end
    end
    if lastMelodyIndex <= 25 and lastMelodyIndex >= 8 then 
        g:led(noteCoordinates[lastMelodyIndex][1], noteCoordinates[lastMelodyIndex][2], 0)
    end
    if bassArm == 1 then
        g:led(10, 8, 15)
    end
    if compArm == 1 then
        g:led(9, 8, 15)
    end
    g:led(11, 8, math.min(math.ceil(15 * bassStep / params:get('bassEvery')), 15))
  end
