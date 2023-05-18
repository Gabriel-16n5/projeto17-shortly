import { Router } from "express";
import { createShortenUrl, getUrl, getUrlId, deleteUrl } from "../controllers/urlsController.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import {urlsSchema} from "../schemas/urls.schema.js";

const urlsRouter = Router()

urlsRouter.post("/urls/shorten", validateSchema(urlsSchema), createShortenUrl);
urlsRouter.get("/urls/:id", getUrlId);
urlsRouter.get("/urls/open/:shortUrl", getUrl);
urlsRouter.delete("/urls/:id", deleteUrl);

export default urlsRouter;