# Haskell ToDo Console

## Table of Contents
 
- [Description](#description)
- [Features](#features)
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
 
## Description
 
Haskell ToDo Console is a simple console-based to-do list application written in Haskell. It allows you to manage your tasks by adding, marking as done, and searching for items based on specified parameters.
 
## Features 

- Add tasks with descriptions and tags.
- Mark tasks as done.
- Search for tasks based on parameters.

## Getting Started

### Prerequisites

Before running the application, make sure you have the following installed on your system:

- [GHC (Glasgow Haskell Compiler)](https://www.haskell.org/ghc/)
- [Cabal](https://www.haskell.org/cabal/)

### Installation

1. Clone the repository:

  
   git clone https://github.com/FaizanShaikh-3033/Haskell_ToDo_console.git
   cd Haskell_ToDo_console


2. Build the project:

 
   cabal update
   
   cabal build

## Usage

Run the executable with the following command:


cabal run solution

Follow the prompts to interact with the to-do list.

## Project Structure

- `src/`: Source code directory.
  - `Main.hs`: Main entry point of the program.
  - `Runner.hs`: Module for executing queries.
  - `Todo.hs`: Module for managing the to-do list state.
  - `Query.hs`: Module for defining and parsing queries.
  - `QueryResult.hs`: Module for representing query results.
  - `Types.hs`: Module for defining data types.
- `solution.cabal`: Cabal file specifying project configuration.

## Dependencies

- [base](https://hackage.haskell.org/package/base)
- [bytestring](https://hackage.haskell.org/package/bytestring)
- [transformers](https://hackage.haskell.org/package/transformers)
- [megaparsec](https://hackage.haskell.org/package/megaparsec)
- [parser-combinators](https://hackage.haskell.org/package/parser-combinators)
- [parsec](https://hackage.haskell.org/package/parsec)



