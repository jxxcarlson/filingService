{-# LANGUAGE OverloadedStrings #-}


-- https://dev.to/parambirs/how-to-write-a-haskell-web-servicefrom-scratch---part-3-5en6
-- https://adit.io/posts/2013-04-15-making-a-website-with-haskell.html

module Main where

import             Control.Monad.IO.Class (liftIO) -- liftIO :: IO a -> m a

import Web.Scotty
import Data.Text.Lazy (pack, Text)
import Network.Wai.Middleware.Static ( (>->), addBase, noDots, staticPolicy )
import Web.Scotty
import Network.Wai.Middleware.Cors
import Network.Wai.Middleware.RequestLogger

import Document (Document, write)

main = scotty 8077 $ do
    middleware corsPolicy 
    middleware logStdoutDev

    get "/hello" $ do
        html $ mconcat ["Yes, I am still here\n"]

    post "/save" $ do
        document <- jsonData :: ActionM Document 
        liftIO $ Document.write document

    middleware $ staticPolicy (noDots >-> addBase "filingService")

corsPolicy = cors (const $ Just policy)
    where
      policy = simpleCorsResourcePolicy
        { corsOrigins  = Nothing
        , corsRequestHeaders = ["Content-Type"]  }

