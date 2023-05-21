import { Router } from "express";
import {Signin} from "../controllers/signinController.js";

const signinRouter = Router();

signinRouter.post('/signin', Signin)

export default signinRouter;