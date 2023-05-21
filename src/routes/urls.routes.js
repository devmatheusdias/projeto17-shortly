import { Router } from "express";
import {Url, UrlId, ShortUrl, UrlDelete} from "../controllers/urlsController.js";

const urlsRouter = Router();

urlsRouter.post('/urls/shorten', Url)

urlsRouter.get('/urls/:id', UrlId)

urlsRouter.get('/urls/open/:shortUrl', ShortUrl)

urlsRouter.delete('/urls/:id', UrlDelete)

export default urlsRouter