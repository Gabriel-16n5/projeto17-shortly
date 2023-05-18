import { Router } from "express";
import {  } from "../controllers/rankingController.js";

const rankingRouter = Router()

rankingRouter.get("/ranking", getRanking);

export default rankingRouter;