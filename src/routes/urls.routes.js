import { Router } from "express";
import {postUrl, getUrlId, getShortUrl, deleteUrl} from "../controllers/urlsController.js";

const urlsRouter = Router();

urlsRouter.post('/urls/shorten', postUrl)

urlsRouter.get('/urls/:id', getUrlId)

urlsRouter.get('/urls/open/:shortUrl', getShortUrl)

urlsRouter.delete('/urls/:id', deleteUrl)

export default urlsRouter