
import { Router } from "express";
import{getPreguntas, getPregunta, createPregunta,updatePregunta,deletePregunta} from "../controllers/preguntaController.js";
const router = Router();


router.get('/', getPreguntas);
router.get('/:id', getPregunta);
router.post('/', createPregunta);
router.put('/:id', updatePregunta);
router.delete('/:id', deletePregunta);

export default router;
