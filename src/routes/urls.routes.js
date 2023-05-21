import { Router } from "express";
import {Url, UrlId, ShortUrl, UrlDelete} from "../controllers/urlsController.js";
import { urlSchema } from "../schemas/urls.schema.js";
import { authValidade } from "../middlewares/auth.middleware.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";

const urlsRouter = Router();

urlsRouter.post('/urls/shorten', authValidade, validateSchema(urlSchema), Url)

urlsRouter.get('/urls/:id', UrlId)

urlsRouter.get('/urls/open/:shortUrl', ShortUrl)

urlsRouter.delete('/urls/:id', UrlDelete)

export default urlsRouter