import { Router } from "express";
import usersRouter from "./users.routes.js";
import urlsRouter from "./urls.routes.js";
import rankingsRouter from "./rankings.routes.js";
import signinRouter from "./signin.routes.js";
import signupRouter from "./signup.routes.js";

const routes = Router();
routes.use(usersRouter, urlsRouter, rankingsRouter, signinRouter, signupRouter);

export default routes;