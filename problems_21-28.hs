-- Problem 21
insertAt :: a -> [a] -> Int -> [a]
insertAt x xs n = take (n - 1) xs ++ [x] ++ drop (n - 1) xs

-- Problem 22
range :: Int -> Int -> [Int]
range x y
  | x > y = []
  | x == y = [x]
  | otherwise = x : range (x + 1) y
