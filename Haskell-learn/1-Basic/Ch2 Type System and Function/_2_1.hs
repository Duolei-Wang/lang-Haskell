fib :: (Eq t, Num t) => t -> t -> t -> t
fib 0 a b = a
fib n a b = fib (n - 1) b (a + b)

fibonacci :: (Eq t, Num t) => t -> t
fibonacci n = fib n 0 1

fibList :: (Eq a, Num a, Enum a) => a -> [a]
fibList n = map fibonacci [1 .. n]

n :: Int
n = 10

main :: IO ()
main = do
    print $ fibList n
