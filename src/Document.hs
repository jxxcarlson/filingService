{-# LANGUAGE OverloadedStrings #-}

module Document (Document, write) where
import Data.Text.Lazy ( unpack, Text )
import Data.Text.Lazy.Encoding
import Data.Aeson
    ( (.:),
      object,
      FromJSON(parseJSON),
      Value(Object),
      KeyValue((.=)),
      ToJSON(toJSON) )
import System.Directory (createDirectoryIfMissing)
import System.FilePath.Posix (takeDirectory)      
import Control.Applicative

-- The Document type

data Document = Document Text Text  -- fileName content
     deriving (Show)

fileName :: Document -> Text
fileName (Document fileName _) = fileName

content :: Document -> Text
content (Document _ content) = content


-- Document: to and from JSON

instance FromJSON Document where
     parseJSON (Object v) = Document <$>
                            v .: "fileName" <*> 
                            v .:  "content" 

instance ToJSON Document where
     toJSON (Document fileName content) =
         object ["fileName" .= fileName,  "content" .= content]


-- Writing a documennt to disk

write :: Document -> IO()
write doc = 
    createAndWriteFile ("data/" ++ (unpack $ (fileName doc))) (unpack $ content doc)

createAndWriteFile :: FilePath -> String -> IO ()
createAndWriteFile path content = do
  createDirectoryIfMissing True $ takeDirectory path
  writeFile path content
