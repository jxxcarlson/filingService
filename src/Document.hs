{-# LANGUAGE OverloadedStrings #-}

module Document (Document, write) where
import Data.Text.Lazy ( unpack, Text )
import Data.Text.Lazy.Encoding
import Data.Aeson
import Control.Applicative
import System.Process
import Data.List.Split

-- Define the Article constructor
-- e.g. Article 12 "some title" "some body text"
data Document = Document Text Text  -- fileName content
     deriving (Show)


fileName :: Document -> Text
fileName (Document fileName _) = fileName

content :: Document -> Text
content (Document _ content) = content

-- Tell Aeson how to create a Document object from JSON string.
instance FromJSON Document where
     parseJSON (Object v) = Document <$>
                            v .: "fileName" <*> 
                            v .:  "content" 


-- Tell Aeson how to convert a Document object to a JSON string.
instance ToJSON Document where
     toJSON (Document fileName content) =
         object ["fileName" .= fileName,  "content" .= content]


write :: Document -> IO()
write doc = 
    writeFile ("data/" ++ (unpack $ (fileName doc))) (unpack $ content doc)


