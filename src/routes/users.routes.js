import { Router } from "express";
import {getUsers} from "../controllers/usersController.js";
import { authValidade } from "../middlewares/auth.middleware.js";

const usersRouter = Router();

usersRouter.get('/users/me', authValidade, getUsers)

export default usersRouter;