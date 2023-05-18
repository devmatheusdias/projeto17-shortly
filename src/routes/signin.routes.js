import { Router } from "express";
import {postSignin} from "../controllers/signinController.js";

const signinRouter = Router();

signinRouter.post('/signin', postSignin)

export default signinRouter;