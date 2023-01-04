const {Configuration,OpenAIApi} = require('openai')
const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')

require('dotenv').config()

const token = process.env.API_TOKEN; 
const configuration = new Configuration({apiKey: token});
const openai = new OpenAIApi(configuration);
const app = express();

app.use(cors());
app.use(bodyParser.json());

app.post('/message',(req,res)=>{
    // console.log(req.body)
    const response = openai.createCompletion({
        model: 'text-davinci-003',
        prompt: req.body.prompt,
        max_tokens: 1024,
        temperature: 0,
        top_p: 1,
        presence_penalty: 0,
        frequency_penalty: 0,   
    })

    response.then((data)=>{
        res.send({message : data.data.choices[0].text})
    })
})

app.post('/image',(req,res)=>{
    // console.log(req.body)
    const response = openai.createImage({
        prompt: req.body.prompt,
        n: 1,
        size: "1024x1024",
      });

    response.then((data)=>{
        console.log(data.data);
        res.send({img_url : data.data.data[0].url})
    })
})

app.listen(3000,()=>{
    console.log('Listening on port 3000')
});