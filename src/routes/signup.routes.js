import { Router } from "express";
import {Signup} from "../controllers/signupController.js";
import {validateSchema} from "../middlewares/validateSchema.middleware.js"
import { signupSchema } from "../schemas/signup.schema.js";
import { validateSignup } from "../middlewares/signup.middleware.js";

const signupRouter = Router();

signupRouter.post('/signup', validateSchema(signupSchema), validateSignup, Signup)

export default signupRouter;