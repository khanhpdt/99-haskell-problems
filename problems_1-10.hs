-- Problem 1
myLast :: [a] -> a 
myLast [] = error "Empty list!"
myLast [x] = x
myLast (_:xs) = myLast xs

-- Problem 2
myButLast :: [a] -> a
myButLast [] = error "Empty list!"
myButLast [x] = error "One-item list!"
myButLast [x, y] = x
myButLast (x:xs) = myButLast xs

-- Problem 3
elementAt :: [a] -> Integer -> a
elementAt [] _ = error "Empty list!"
elementAt _ n
  | n <= 0 = error "Non-positive index!"
elementAt (x:xs) n
  | n == 1 = x
  | otherwise = elementAt xs (n - 1)

-- Problem 4
myLength :: [a] -> Integer
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- Problem 5
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

-- Problem 6
isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome x = head x == last x && isPalindrome (init (tail x))

-- Problem 7
-- TODO

-- Problem 8
compress :: Eq a => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:xs)
  | x == head xs = compress xs
  | otherwise = [x] ++ compress xs

-- Problem 9
pack :: Eq a => [a] -> [[a]]
pack [] = [[]]
pack [x] = [[x]]
pack (x:xs)
  | x == head xs = (x:(head packTail)):(tail packTail)
  | otherwise = [x]:packTail
  where
    packTail = pack xs

-- Problem 10
encode :: Eq a => [a] -> [(Integer, a)]
encode [] = []
encode [x] = [(1, x)]
encode (x:xs)
  | x == head xs = (1 + fst (head encodeTail), x) : (tail encodeTail)
  | otherwise = (1, x) : encodeTail
  where
    encodeTail = encode xs
