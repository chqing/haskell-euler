import Data.List

stringToIntArray :: String -> [[Int]]
stringToIntArray = stringArrayToIntArray . stringToArray 
	where 
		stringToArray = map words . lines
		stringArrayToIntArray = map $ map read
		
findMax :: [Int] -> Int
findMax = head . foldl next [0,0,0,0]
	where next (oldMax: old: olds) new = max oldMax (old * new * product olds) : olds ++ [new] 

z = [[1,2,3],[4,5,6]]
w = [[1,2],[3,4],[5,6]]

constSumDiags :: [[a]] -> [[a]]
constSumDiags array = map (diagSum array) [0..n]
	where 
		diagSum (row:rows) idx 
			| idx < 0           = []
			| idx >= length row = diagSum rows (idx - 1)
			| otherwise         = row !! idx : diagSum rows (idx - 1) 
		diagSum [] _            = []
		n = max (length $ head array) (length array)

constDiffDiags :: [[a]] -> [[a]]
constDiffDiags array = map (diagDiff array) [m..n]
	where 
		diagDiff (row:rows) idx 
			| idx < 0           = diagDiff rows (idx + 1)
			| idx >= length row = []
			| otherwise         = row !! idx : diagDiff rows (idx + 1) 
		diagDiff [] _           = []
		m = ((-1) * length array) + 1
		n = (length $ head array) - 1