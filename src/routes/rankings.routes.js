import { Router } from "express";
import { getRanking } from "../controllers/rankingsController.js";

const rankingsRouter = Router();

rankingsRouter.get('/ranking', getRanking)

export default rankingsRouter;