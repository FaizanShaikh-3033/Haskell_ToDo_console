module QueryResult
  ( QueryResult (..)
  , toBytestring
  ) where

import Control.Monad (void)
--import qualified Control.Monad.Combinators.NonEmpty as NE
import Data.Char (chr, isLetter, isPrint)
import Data.Either (partitionEithers)
import Data.String (fromString)
import Data.Void (Void)
import Data.Word (Word8)
-- import Text.Megaparsec
-- import Text.Megaparsec.Byte
--import qualified Text.Megaparsec.Byte.Lexer as L
import qualified Data.ByteString.Char8 as B


import Types (Description (..), Index (..), Tag (..), TodoItem (..))
-- import qualified Data.ByteString as B

data QueryResult
  = Added Index
  | Done
  | Found [TodoItem]
  deriving (Show, Eq)

toBytestring :: QueryResult -> B.ByteString
toBytestring result = case result of
  Added i     -> B.pack (show (getIndex i))
  Done        -> B.pack "done"
  Found items -> 
    B.pack (show (length items) ++ " item(s) found\n")
    <> B.intercalate (B.pack "\n") (map itemToBytestring items)

  where
    itemToBytestring :: TodoItem -> B.ByteString
    itemToBytestring (TodoItem (Index index) (Description d) tags) =
      B.pack (show index) <> B.pack " \"" <> d <> B.pack "\"" <> foldMap showTag tags

    showTag :: Tag -> B.ByteString
    showTag (Tag tag) = B.pack " #" <> tag