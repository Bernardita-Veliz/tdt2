import { Router } from "express";
import {createRespuesta, getRespuestas, getRespuesta, updateRespuesta, deleteRespuesta} from "../controllers/respuestaController.js";
const router = Router();


// Rutas para respuestas
router.get('/', getRespuestas);
router.get('/:id', getRespuesta);
router.post('/', createRespuesta);
router.put('/:id', updateRespuesta);
router.delete('/:id', deleteRespuesta);

export default router;
