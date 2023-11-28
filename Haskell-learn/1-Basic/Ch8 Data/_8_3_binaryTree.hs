data BinTree a = Leaf a | Node a (BinTree a) (BinTree a)
    deriving (Show)

t1 :: BinTree String
t1 = Leaf "LHS"

t2 :: BinTree String
t2 = Leaf "RHS"

t3 :: BinTree String
t3 = Node "Root" t1 t2

main :: IO ()
main = do
    print t3