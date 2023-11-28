import Data.Data (typeOf)

type RGB = (Int, Int, Int)

newtype TYPE_NAME a b = TYPE_NAME (a, b) deriving (Show)

class MEq a where
    eq :: a -> a -> Bool
    neq :: a -> a -> Bool
    eq x y = not $ neq x y
    neq x y = not $ eq x y
    {-# MINIMAL eq | neq #-}

main = do
    print $ TYPE_NAME (1, 2)