data Week = Mon | Tue | Wen | Thu | Fri | Sat | Sun
    deriving (Show, Eq, Ord, Enum, Read)

tomorrow :: Week -> Week
tomorrow Sun = Mon
tomorrow day = succ day

type Name = String
type Author = String
type ISBN = String
type Price = Float

data Book = Book
    { name :: Name
    , author :: Author
    , isbn :: ISBN
    , price :: Price
    }
    deriving (Show)

data DATA_NAME = DATA_NAME Int Int
