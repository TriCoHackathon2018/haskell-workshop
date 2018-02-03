{-# LANGUAGE GADTs, TypeInType #-}
module Main where

import Data.Kind ( Type )
import Prelude hiding ( Maybe(..), sequence )

main = return ()

-- Ignore what's above this line.
-- (Ask me later if you wanna know.)

{-

This is the advanced intro to haskell workshop
at the TriCo Hackathon 2018.

* I am Divesh Otwani. Let's do names.
* Advanced: I expect you to know how to program
  in some other language.
* This workshop is highly interactive.
* All the code can be found

----->     Link        <--------

* Goal
  - Learn basic syntax of haskell
  - Learn how to make functions
  - Learn how to make data types
  - Write clean & safe functions

* Notes
  - Ignore everything you've learned about programming.
  - The "I'm not *supposed to* be here" or
        "I'm not *supposed to* understand this"
    problem.
* Go to www.repl.it   (no .com) & copy the code
  from my github:  Link

-}


--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

-- Get used to the repl. Arithmatic.

-- Basic Syntax

addOne :: Int -> Int
addOne x = x + 1


{-
Exercise 1:

write addThree, multBy5

-}

addTwoNumbers :: Int -> Int -> Int
addTwoNumbers firstNum secondNum = firstNum + secondNum

{-
Exercise 2:

write multTwoNumbers, subtract, twiceFirstMinusSecond

-}

{-
Currying

is when you give only some of the arguments to a
function and it becomes the function with those
arguments default filled in.

Example:
-}

addOneCurry :: Int -> Int
addOneCurry = addTwoNumbers 1


{-

The -> notation is consistent.
It is right associative.
f :: A -> B -> C
  is
f :: A -> (B -> C)

addTwoNumbers :: Int -> Int -> Int

addOneCurry :: Int -> Int
addOneCurry = addTwoNumbers 1

-}


{-
Exercise 3:

write multBy3, subtractFrom5, using currying.

-}

-- Functions are values
-- We have lambdas and can write

addThree :: Int -> Int
addThree = \x -> x + 3

{-
Exercise 4:

write multTwoNumbers'

Hint: use two lambdas

-}

multTwoNumbers' :: Int -> Int -> Int
multTwoNumbers' = undefined


-- If structures, < > <= >= ==, etc.

absVal :: Int -> Int
absVal x = if x < 0 then (-x) else x


fibDefOne :: Int -> Int
fibDefOne n = if n <= 1 then n else fibDefOne (n-1) + fibDefOne (n-2)



-- More simple types:

stringVar :: String
stringVar = "Hello Friends"

charVar :: Char
charVar = 'd'

h :: Bool -> Char
h b = if b then 'a' else 'c'

doubleVar :: Double
doubleVar = 1.3





--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------


-- Type variables

doNothing :: a -> a
doNothing x = x

-- "Assume only what you can"

compose :: (a -> b) -> (b -> c) -> (a -> c)
compose = undefined


apply :: (a -> b) -> a -> b
apply = undefined


storeThings :: Int -> Int
storeThings = ignore 3 addFour where
  ignore :: a -> b -> b
  ignore x y = y
  addFour x = x + 4


--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

--              Data Types

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------



-- Tuples and Lists
tuple1 :: (Int, Int)
tuple1 = (3,4)

-- pattern match
getFirst :: (a,b) -> a
getFirst (x,y) = x

getFirst' :: (a,b) -> a
getFirst' tup = case tup of
  (x,y) -> x


-- Make your own type definition

data MyBool where
  MyTrue :: MyBool
  MyFalse :: MyBool


if_then_else :: MyBool -> a -> a -> a
if_then_else = undefined


data Color where
  Blue :: Color
  Green :: Color

-- Draw set
data ValidId where
  OneCard :: ValidId
  DriversLiscence :: Int -> ValidId
  SSN :: Int -> ValidId


-- Abstract Data Types

data Hold :: Type -> Type where
  HoldConstructor :: a -> Hold a

-- make a type to hold either an int or
-- some type `a`


data List :: Type -> Type where
  EmptyList :: List a
  Cons :: a -> List a -> List a

listOne :: [Int]
listOne = 1 : 2 : 3 : []

-- Multiple line case matching
minusOneExcept0 :: Int -> Int
minusOneExcept0 0 = 0
minusOneExcept0 x = x - 1


-- Exercises:
-- Write a list of characters
-- Evaluate it on the terminal
-- Write a list of booleans


snoc :: a -> [a] -> [a]
snoc x [] = x : []
snoc x (y:ys) = y : (snoc x ys)



sumIntList :: [Int] -> Int
sumIntList = undefined


mymap :: (a -> b) -> [a] -> [b]
mymap = undefined


--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

--             Final Examples

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------


{-

Final examples:

* List index
* Merge sort
* Sequenceing operations.

Exercises for later:
* Tree: size, find, insert
* Graph: Search. Cycles.

Things to talk about if time: Type classes.

-}


data Maybe :: Type -> Type where
  Nothing :: Maybe a
  Just :: a -> Maybe a

findInList :: (Eq a) => [a] -> a -> Maybe a
findInList = undefined


merge :: (Ord a) => [a] -> [a] -> [a]
merge = undefined


-- You'll need
-- length
-- take

mergeSort :: (Ord a) => [a] -> [a]
mergeSort = undefined


-- Sequencing Maybe operations

sequence :: (a -> Maybe b) -> (b -> Maybe c) -> (a -> Maybe c)
sequence f g =
  \a -> case f a of
    Just b -> g b
    Nothing -> Nothing

(<.>) = sequence
infixl 5 <.>


data AbstractSynTree where {}
data MachineCode where {}
data MachineState where {}

parser :: String -> Maybe AbstractSynTree
parser = undefined

compiler :: AbstractSynTree -> Maybe MachineCode
compiler = undefined

execute :: MachineState ->  MachineCode -> Maybe MachineState
execute = undefined

run :: (MachineState, String) -> Maybe MachineState
run (state, program) =
  (parser <.> compiler <.> (execute state))  program



{-

FAQ

* But can you do practical things?

Of course. However, to do them *well* and safely,
will require some sophistication. Not a lot, but
some. Not enough time here.

* Why can't I just deal with unsafe things?

When projects get large, you need tools to help
you manage complexity. Even if you don't use
Haskell, you will use the most of the principles
on which Haskell is built.

Questions?

-}



