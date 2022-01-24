const fs = require('fs')
const readLine = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
})

readLine.question('Enter filename: ', filename=>{
    readLine.question('Enter some text: ', text =>{
        fs.writeFile(`${filename}.txt`, text, err =>{
            if(err) throw err
            console.log('File was created')
            readLine.close()
        })
    })
})