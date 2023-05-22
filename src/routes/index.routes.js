import { Router } from "express";
import autenticationRouter from "./autentication.routes.js";
import rankingRouter from "./ranking.routes.js";
import urlsRouter from "./urls.routes.js";
import usersRouter from "./users.routes.js";

const router = Router()
router.use(autenticationRouter);
router.use(urlsRouter);
router.use(usersRouter);
router.use(rankingRouter);

export default router