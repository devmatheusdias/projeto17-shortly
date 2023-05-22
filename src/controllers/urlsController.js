import { postUrl, getUrlId, getShortUrl, deleteUrl } from "../repository/urls.repository.js"

export async function Url(req, res){
    try {
        const result = await postUrl(req.body, res.locals.token)
        res.status(201).send(result)
    } catch (error) {
        res.send(error.message)
    }
}

export async function UrlId(req, res){
    try {
        const result = await getUrlId(req.params)
       
        if(!result) res.status(404).send('Url não encontrada')
       
        res.status(200).send(result)
    } catch (error) {
        res.send(error.message)
    }
}

export async function ShortUrl(req, res){
    try {
        
    } catch (error) {
        res.send(error.message)
    }
}

export async function UrlDelete(req, res){
    try {
        
    } catch (error) {
        res.send(error.message)
    }
}

