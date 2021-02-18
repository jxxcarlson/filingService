# filingService

Send a POST request to `localhost://8077/save` with body a JSON object with text fields 
`fileName` and `content`.  The file in question will be saved in the folder `./data`.

The `fileName` can be a path, e.g., `a/b/c/d.md`. If the path to file to be
written does not exist, it is created.

There is no authentication, so this app is intended for use on you own machine,
or in some other controlled environment. 

Send a GET request to `localhost://8077/hello` to see if the server is alive. 

Written in Haskell, 52 lines of code.

run with `stack ghci`.
