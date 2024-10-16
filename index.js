const http=require("http")
const server=http.createServer((req,res)=>{
    console.log(req)
    res.setHeader("Content-Type","Text/plain")
    res.end("hello momo")
})
server.listen(3000,()=>{
    console.log("listening at 3000")})