-- Problem 14
dupli :: [a] -> [a]
dupli [] = []
dupli (x:xs) = [x,x] ++ dupli xs

-- Problem 15
repli :: [a] -> Int -> [a]
repli [] _ = []
repli (x:xs) n = replicateItem x n ++ repli xs n
  where replicateItem :: a -> Int -> [a]
        replicateItem x n
          | n == 0 = []
          | n == 1 = [x]
          | otherwise = x : replicateItem x (n - 1)

-- Problem 16
myDropAt :: [a] -> Int -> [a]
myDropAt [] _ = []
myDropAt x 0 = x
myDropAt (x:xs) n
  | n == 1 = xs
  | otherwise = x : myDropAt xs (n - 1)

-- Problem 17
split :: [a] -> Int -> ([a], [a])
split [] _ = ([], [])
split x 0 = ([], x)
split (x:xs) n = (x : fst splitTail, snd splitTail)
  where splitTail = split xs (n - 1)

-- Problem 18
myTake :: [a] -> Int -> [a]
myTake [] _ = []
myTake _ 0 = []
myTake (x:xs) n = x : myTake xs (n - 1)

myDropUntil :: [a] -> Int -> [a]
myDropUntil [] _ = []
myDropUntil x 0 = x
myDropUntil (x:xs) n = myDropUntil xs (n - 1)

slice :: [a] -> Int -> Int -> [a]
slice [] _ _ = []
slice _ 0 0 = []
slice x m n
  | m == 0 = myTake x n
  | otherwise = myTake (myDropUntil x (m - 1)) (n - m + 1)

-- Problem 19
rotateLeft :: [a] -> Int -> [a]
rotateLeft [] _ = []
rotateLeft x 0 = x
rotateLeft (x:xs) n = rotateLeft (xs ++ [x]) (n - 1)

-- Problem 20
removeAt :: [a] -> Int -> (a, [a])
removeAt [] _ = error "Empty list!"
removeAt x 0 = error "Zero index!"
removeAt (x:xs) 1 = (x, xs)
removeAt (x:xs) n = (fst removeTail, x : snd removeTail)
  where removeTail = removeAt xs (n - 1)
