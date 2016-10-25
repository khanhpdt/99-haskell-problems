# Basic Haskell syntaxes

- Logical operators
  ```
  && -- and
  || -- or
  ```

- Equality operators
  ```
  ==
  /= -- not equal
  ```

- Calling functions
  ```
  <function name> <argument 1> <argument 2> ... -- prefix
  <argument 1> `<function name>` <argument 2> -- infix
  ```

- Function definition
  ```
  <function name> <parameter 1> <paramenter 2> ... = <body>
  ```

- Variable definition
  ```
  <name> = <value> -- this is actually a function without parameters
  ```

- Conditional expression
  ```
  if <predicate> then <consequent> else <alternative> -- else is mandatory
  ```

- Lists
  - Homogeneous, i.e., items of same type
  - Example: `[1,2,3]`
  - Concatenation: `<list> ++ <list>`, `<list item> : <list>`
  - Accessing: `<list> !! <index>`
  - Comprehension: `[ <output> | <var 1> <- <list>, <var 2> <- <list>, ..., <predicate 1>, <predicate 2> ...]`
  - Basic operations: 
	`head, tail, last, init, length, null (check empty), reverse, take, drop, maximum, minimum, sum, product, elem (check item existence, zip`

- Tuples
  - Heterogeneous, i.e., items can be of different types
  - Example: `(1, 'a')`
  - Fixed size
  - Basic operations:
	`fst, snd`

- Ranges
  ```
  [<first item>..<last item>]
  [<first item>,<second item>..<last item>] -- ranges with step
  ```

- `::` operator 
  - has-type-of operator
  - Example: `'a' :: Char` means that `'a'` has type of `Char`
  
- Common types
  `Int, Integer, Float, Double, Bool, Char`
  
- Type classes
  - A type class is an interface that defines some behavior.
  - Common type classes
	`Eq, Ord, Show, Read, Enum, Bounded, Num, Floating, Integral`
	
- Type annotation
  - To explicitly tell Haskell the type of an expression
  - Example: `read "5" :: Int`

- As-patterns
  - Indicated by `@`
  - Example
	```
	firstLetter :: String -> String
	firstLetter "" = "Empty string, whoops!"
	firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
	```
	
- Guards
  - Indicated by pipe character `|`
  - Example
	```
	bmiTell :: => Double -> String
	bmiTell bmi
		| bmi <= 18.5 = "You're underweight, you emo, you!"
		| bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
		| bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
		| otherwise = "You're a whale, congratulations!"
	```

- `where` keyword
  - Local binding
  - Scope: visible across guards but not across different patterns
  - Example
	```
	greet :: String -> String
	greet "Juan" = niceGreeting ++ " Juan!"
	greet "Fernando" = niceGreeting ++ " Fernando!"
	greet name = badGreeting ++ " " ++ name
		where niceGreeting = "Hello! So very nice to see you,"
		      badGreeting = "Oh! Pfft. It's you."
	```

- `let` expression
  - Local binding
  - Scope
	- When used to define local variables in functions: the variables are visible only in the `in` expression.
	- When used in list comprehensions: the variables are visible in the output and everything after the `let` expression.
  - Example
	```
	cylinder :: Double -> Double -> Double
	cylinder r h =
		let sideArea = 2 * pi * r * h
			topArea = pi * r ^ 2
		in sideArea + 2 * topArea
	```

- `case` expression
  ```
  case <expression> of <pattern 1> -> <result 1>
                       <pattern 2> -> <result 2>
					   <pattern 3> -> <result 3>
					   ...
  ```

- Section
  - To define partially applied with infix function
  - Wrap the function by parentheses and supply a parameter on one side only
  - e.g., 
	```
	divideByTen :: (Floating a) => a -> a
	divideByTen = (/10) -- leave out the other side where an argument will be filled in
	
	divideByTen 200 
	-- 20.0
	```

- Lambda expression
  - Syntax
	```
	(\<parameters> -> <body>) -- parentheses are optional
	```
  - Example
	```
	numLongChains :: Int
	numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))
	```
  - Could not define multiple patterns in lambda
  
- Folds
  - To reduce a list to a single item
  - Syntax
  ```
  foldl <binary function> <accumulator> <list>
  foldr <binary function> <accumulator> <list>
  ```
  - Example
  ```
  sum' :: (Num a) => [a] -> a
  sum' xs = foldl (\acc x -> acc + x) 0 xs
  
  map' :: (a -> b) -> [a] -> [b]
  map' f xs = foldr (\x acc -> f x : acc) [] xs
  
  -- NOTE the difference between the order of the parameters in
  -- the binary function in left fold and that in right fold
  ```
  - Shortcuts: 
    - `foldl1`: same as `foldl`, except that the accumulator is set to the first element in the list
	- `foldr1`: same as `foldr`, except that the accumulator is set to the last element in the list

- `$` operator
  - Function application operator
  - Lowest precedence, right-associative
  - Help to write fewer parentheses, e.g., 
	```
	sum (filter (> 10) (map (*2) [2..10]))
	-- can be rewritten as
	> sum $ filter (> 10) $ map (*2) [2..10]
	```
  - Help to treat function application as another function, e.g.,
	```
	map ($ 3) [(4+), (10*), (^2), sqrt]
	```

- `.` operator
  - Function composition operator
  - Right-associative
  - Definition
	```
	(.) :: (b -> c) -> (a -> b) -> a -> c
	f . g = \x -> f (g x)
	```


  
# References
[1]: Learn you a Haskell for great good
