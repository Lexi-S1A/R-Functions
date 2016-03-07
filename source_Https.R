source_https <-function(u, unlink.tmp.certs = FALSE) {
require(RCurl)
if(!file.exists("cacert.pem"))  
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile ="cacert.pem")
script <- getURL(u, followlocation = TRUE, cainfo = "cacert.pem")
if(unlink.tmp.certs) unlink("cacert.pem")
eval(parse(text = script), envir= .GlobalEnv)
}
