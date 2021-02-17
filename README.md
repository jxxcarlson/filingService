# SFF: Simple Filing Service

Send a POST request to `localhost://8077/save` with body a JSON object with text fields 
`fileName` and `content`.  The file in question will be saved in the folder `./data`.

There is no authentication, so this app is intended for use on you own machine.

Send a GET request to `localhost://8077/hello` to see if the server is alive. 

Written in Haskell, 52 lines of code.

run with `stack ghci`.