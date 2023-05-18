import { Router } from "express";
import {  } from "../controllers/usersController.js";

const usersRouter = Router()

usersRouter.get("/users/me", getusers);

export default usersRouter;