import { Router } from "express";
import {Signin} from "../controllers/signinController.js";
import {validateSchema} from "../middlewares/validateSchema.middleware.js"
import { signinSchema } from '../schemas/signin.schema.js';
import { validateSignin } from "../middlewares/signin.middleware.js";


const signinRouter = Router();

signinRouter.post('/signin', validateSchema(signinSchema), validateSignin, Signin)

export default signinRouter;