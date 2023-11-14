{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE InstanceSigs #-}

module Todo
  ( TodoListM
  , runTodoList
  ) where

import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO)
import Control.Monad.Trans.State.Strict (StateT, get, modify, runStateT)
import qualified Data.ByteString.Char8 as B
import Data.List (intersect)

import Types (TodoItem(..), SearchParams(..), MonadTodoList(..),getDescription, Description, Index(..), Tag,getSearchWord,SearchWord(..))

data TodoList = TodoList [TodoItem]
  deriving (Show, Eq)

emptyTodoList :: TodoList
emptyTodoList = TodoList []

newtype TodoListM a = TodoListM { runTodoListM :: StateT TodoList IO a }
  deriving (Functor, Applicative, Monad, MonadIO)

runTodoList :: TodoListM a -> IO ()
runTodoList = void . flip runStateT emptyTodoList . runTodoListM

instance MonadTodoList TodoListM where
  add desc tags = do
    TodoList items <- TodoListM get
    let newIndex = Index $ fromIntegral $ length items
        newItem = TodoItem newIndex desc tags
    TodoListM $ modify (\(TodoList xs) -> TodoList (newItem:xs))
    return newIndex

  done (Index idx) = do
    TodoList items <- TodoListM get
    let newItems = filter (\item -> (getIndex $ tiIndex item) /= idx) items
    TodoListM $ modify (\_ -> TodoList newItems)


  search (SearchParams words tags) = do
    TodoList items <- TodoListM get
    let filteredItems = filter (\item -> any (`B.isInfixOf` getDescription (tiDescription item)) (map (\(SearchWord w) -> w) words) 
                                   || not (null (intersect tags (tiTags item)))) items
    return filteredItems
