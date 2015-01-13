module PartialApplication where

import Common

{-
    The following function `add` can be thought of as taking only one parameter
    and then returning a function that takes one parameter.  Supplying fewer
    arguments thand the function takes, and getting back a new function that
    takes the remaining argument(s) is called partial application.
-}

add :: Int -> Int -> Int
add x y = x + y

{-
    The function `add` takes two arguments.
    Use partial application of `add` to add two to every element in a list:
-}

addTwo xs = map (_YOUR_CODE_HERE) xs
