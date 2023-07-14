import { Router } from "express";
import { createEstudiante, deleteEstudiante, getEstudiantes,getEstudiante,updateEstudiante } from "../controllers/estudianteController.js";

const router = Router();

// Ruta para obtener todos los estudiantes
router.get('/', getEstudiantes);

// Ruta para crear un nuevo estudiante
router.post('/', createEstudiante);

// Ruta para obtener un estudiante por su id
router.get('/:id', getEstudiante);

// Ruta para actualizar un estudiante por su id
router.put('/:id', updateEstudiante);

// Ruta para eliminar un estudiante por su id
router.delete('/:id', deleteEstudiante);

export default router;
