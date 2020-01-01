module Main where

import BloomFilter.Mutable
import Control.Monad.ST (stToIO)
import Prelude hiding (elem)

main :: IO ()
main = do
  f <- stToIO $ new (\i -> [fromIntegral i `mod` 10]) 10
  putStrLn "insert:"
  x1 <- readLn
  stToIO $ insert f x1
  putStrLn "insert:"
  x2 <- readLn
  stToIO $ insert f x2
  putStrLn "check:"
  x3 <- readLn
  x <- stToIO (x3 `elem` f)
  putStrLn $
    if x
      then "Yes"
      else "No"
