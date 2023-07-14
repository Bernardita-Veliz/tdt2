import { Router } from "express";
import {getAsignaturas, getAsignatura, createAsignatura, updateAsignatura, deleteAsignatura} from "../controllers/asignaturaController.js"
const router = Router();

// Ruta para obtener todos los docentes
router.get('/', getAsignaturas);

// Ruta para obtener un docente por su ID
router.get('/:id', getAsignatura);

// Ruta para crear un nuevo docente
router.post('/', createAsignatura);

// Ruta para actualizar los datos de un docente
router.put('/:id', updateAsignatura);

// Ruta para eliminar un docente por su ID
router.delete('/:id', deleteAsignatura);

export default router;
