module CreditCardNumberValidator where

import Common
import Data.Char
{-
    This exercise is based on the homework assignments in Erik Meijer's ongoing MOOC «FP101x - Introduction to Functional Programming».

    A credit card number is valid if it obeys certain logical rules.

    If a validation function is broken down to a combination of several small and simple functions, it's easy to convince yourself and others
    of your validation function to be correct.

    The validation algorithm is explained in FP101x as follows:

    - Double the value of every second digit beginning with the rightmost
    - Add the digits of the doubled values and the undoubled digits from the original number
    - Calculate the modulus of the sum divided by 10
    - If the result equals 0, then number is valid.

    Example:
    - Input number is 4012888888881881
    - Double every other digit, starting from right (reversed): [1,16,8,2,8,16,8,16,8,16,8,16,2,2,0,8]
    - Sum these digits (note that two-digit numbers has to be considered as two digits again): 90
    - Calculate the modulus of 90 over 10: 0
    - This means that the number is valid
-}

type DigitList = [Int]

{-
   Step 1:
   Convert a numerical representation of the credit card number to a String
-}
numberToString :: Int -> String
numberToString = show
-- Alternatively:
--numberToString xs = show xs

{-
   Step 2:
   Split string on single digits, and represent them as Ints
-}
stringToDigitList :: String -> DigitList
stringToDigitList = map digitToInt
--stringToDigitList xs = map digitToInt xs

{-
   Step 3:
   Double every other element, starting from the right-most digit
-}
doubleEveryOtherElement :: DigitList -> DigitList
doubleEveryOtherElement xs = reverse $ zipWith (*) (reverse xs) $ cycle [1,2]
-- Alternatively:
--doubleEveryOtherElement xs = reverse $ map (\(i, x) -> if i `mod` 2 == 0 then x else 2 * x) (zip [0..] (reverse xs))

{-
   Step 4:
   Sum the digits in a list. Remember to split numbers with more than 1 digit.
-}
sumDigitList :: DigitList -> Int
sumDigitList = sum . map digitToInt . concat . map show
-- Alternatively:
--sumDigitList xs = sum $ map digitToInt $ concat $ map show xs

{-
   Step 5:
   Calculate the modulus of a number over 10
-}
mod10 :: Int -> Int
mod10 x = x `mod` 10

{-
   Step 6:
   Tie it all together in one single function for determining
   if a credit card number is valid
-}
isValidCreditCardNumber :: Int -> Bool
isValidCreditCardNumber = (== 0) . mod10 . sumDigitList . doubleEveryOtherElement . stringToDigitList . numberToString
-- Alternatively:
--isValidCreditCardNumber x = 0 == (mod10 $ sumDigitList $ doubleEveryOtherElement $ stringToDigitList $ numberToString x)

